//
//  ELCAssetTablePicker.m
//
//  Created by ELC on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import "ELCAssetTablePicker.h"
#import "ELCAssetCell.h"
#import "ELCAsset.h"
#import "ELCAlbumPickerController.h"
#import "ELCConsole.h"

@interface ELCAssetTablePicker ()

@property (nonatomic, assign) NSInteger columns;

@end

@implementation ELCAssetTablePicker

//Using auto synthesizers

- (id)init
{
    self = [super init];
    if (self) {
        //Sets a reasonable default bigger then 0 for columns
        //So that we don't have a divide by 0 scenario
        self.columns = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 5 : 4;
    }
    return self;
}

- (void)viewDidLoad
{
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
	[self.tableView setAllowsSelection:NO];

    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    self.elcAssets = tempArray;
	
    if (self.immediateReturn)
    {
        // do nothing.
    }
    else
    {
        UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction:)];
        [self.navigationItem setRightBarButtonItem:doneButtonItem];
        [self.navigationItem setTitle:NSLocalizedStringFromTable(@"Loading...", @"CommonUtil", nil)];
    }

	[self performSelectorInBackground:@selector(preparePhotos) withObject:nil];
    
    // Register for notifications when the photo library has changed
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preparePhotos) name:ALAssetsLibraryChangedNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[ELCConsole mainConsole] removeAllIndex];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ALAssetsLibraryChangedNotification object:nil];
}

- (void)preparePhotos
{
    @autoreleasepool {
        
        NSString *groupPropertyName = (NSString *)[self.assetGroup valueForProperty:ALAssetsGroupPropertyName];
        [self.navigationItem setTitle:groupPropertyName];
        
        
        [self.elcAssets removeAllObjects];
        [self.assetGroup enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop)
        {
            if (result == nil) return;
            
            ELCAsset *elcAsset = [[ELCAsset alloc] initWithAsset:result];
            [elcAsset setParent:self];
            
            BOOL isAssetFiltered = NO;
            if (self.assetPickerFilterDelegate &&
               [self.assetPickerFilterDelegate respondsToSelector:@selector(assetTablePicker:isAssetFilteredOut:)])
            {
                isAssetFiltered = [self.assetPickerFilterDelegate assetTablePicker:self isAssetFilteredOut:(ELCAsset*)elcAsset];
            }

            if (!isAssetFiltered)
            {
                [self.elcAssets addObject:elcAsset];
            }
         }];

        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            // scroll to bottom
            /*
            NSInteger section = [self numberOfSectionsInTableView:self.tableView] - 1;
            NSInteger row = [self tableView:self.tableView numberOfRowsInSection:section] - 1;
            if (section >= 0 && row >= 0)
            {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
                [self.tableView scrollToRowAtIndexPath:indexPath
                                      atScrollPosition:UITableViewScrollPositionBottom
                                              animated:NO];
            }
             */
        });
    }
}


- (void)doneAction:(id)sender
{	
	NSMutableArray *selectedAssetsImages = [[NSMutableArray alloc] init];
	for (ELCAsset *elcAsset in self.elcAssets)
    {
		if ([elcAsset selected])
        {
			[selectedAssetsImages addObject:elcAsset];
		}
	}
    
    if ([[ELCConsole mainConsole] onOrder])
    {
        [selectedAssetsImages sortUsingSelector:@selector(compareWithIndex:)];
    }
    [self.parent selectedAssets:selectedAssetsImages];
}

- (BOOL)shouldSelectAsset:(ELCAsset *)asset
{
    NSUInteger selectionCount = 0;
    for (ELCAsset *elcAsset in self.elcAssets)
    {
        if (elcAsset.selected) selectionCount++;
    }
    
    BOOL shouldSelect = YES;
    if ([self.parent respondsToSelector:@selector(shouldSelectAsset:previousCount:)])
    {
        shouldSelect = [self.parent shouldSelectAsset:asset previousCount:selectionCount];
    }
    return shouldSelect;
}

- (void)assetSelected:(ELCAsset *)asset
{
    if (self.singleSelection)
    {
        for (ELCAsset *elcAsset in self.elcAssets)
        {
            if (asset != elcAsset) {
                elcAsset.selected = NO;
            }
        }
    }
    
    if (self.immediateReturn)
    {
        NSArray *singleAssetArray = @[asset];
        [(NSObject *)self.parent performSelector:@selector(selectedAssets:) withObject:singleAssetArray afterDelay:0];
    }
}

- (BOOL)shouldDeselectAsset:(ELCAsset *)asset
{
    if (self.immediateReturn)
    {
        return NO;
    }
    return YES;
}

- (void)assetDeselected:(ELCAsset *)asset
{
    if (self.singleSelection)
    {
        for (ELCAsset *elcAsset in self.elcAssets)
        {
            if (asset != elcAsset)
            {
                elcAsset.selected = NO;
            }
        }
    }

    if (self.immediateReturn)
    {
        NSArray *singleAssetArray = @[asset.asset];
        [(NSObject *)self.parent performSelector:@selector(selectedAssets:) withObject:singleAssetArray afterDelay:0];
    }
    
    NSInteger numOfSelectedElements = [[ELCConsole mainConsole] numOfSelectedElements];
    if (asset.index < numOfSelectedElements - 1)
    {
        NSMutableArray *arrayOfCellsToReload = [[NSMutableArray alloc] initWithCapacity:1];
        for (NSInteger i = 0; i < [self.elcAssets count]; i++)
        {
            ELCAsset *assetInArray = [self.elcAssets objectAtIndex:i];
            if (assetInArray.selected && (assetInArray.index > asset.index))
            {
                assetInArray.index -= 1;
                
                NSInteger row = i / self.columns;
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
                BOOL indexExistsInArray = NO;
                for (NSIndexPath *indexInArray in arrayOfCellsToReload)
                {
                    if (indexInArray.row == indexPath.row)
                    {
                        indexExistsInArray = YES;
                        break;
                    }
                }
                
                if (!indexExistsInArray)
                {
                    [arrayOfCellsToReload addObject:indexPath];
                }
            }
        }
        [self.tableView reloadRowsAtIndexPaths:arrayOfCellsToReload withRowAnimation:UITableViewRowAnimationNone];
    }
}

#pragma mark UITableViewDataSource Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.columns == 0) self.columns = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 5 : 4;
    NSInteger numRows = ceil([self.elcAssets count] / (float)self.columns);
    return numRows;
}

- (NSArray *)assetsForIndexPath:(NSIndexPath *)path
{
    long index = path.row * self.columns;
    long length = MIN(self.columns, [self.elcAssets count] - index);
    return [self.elcAssets subarrayWithRange:NSMakeRange(index, length)];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    static NSString *CellIdentifier = @"Cell";
        
    ELCAssetCell *cell = (ELCAssetCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil)
    {
        cell = [[ELCAssetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setCellWidth:CGRectGetWidth(tableView.frame) columnCount:self.columns];
    [cell setAssets:[self assetsForIndexPath:indexPath]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cell_height = (CGRectGetWidth(tableView.frame) - 2 * (self.columns + 1)) / self.columns + 2*2;
	return cell_height;
}

- (NSInteger)totalSelectedAssets
{
    NSInteger count = 0;
    
    for (ELCAsset *asset in self.elcAssets)
    {
		if (asset.selected) {
            count++;	
		}
	}
    
    return count;
}


@end
