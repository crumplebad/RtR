//
//  DesignersPresenter.m
//  RtR
//
//  Created by Jay on 6/21/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "DesignersPresenter.h"
#import "Designer.h"
#import "DesignersListViewController.h"

@implementation DesignersPresenter {
    NSArray *gDesignerArray;
}

- (void)loadDesignersData {
    [self.input getAllData];
}

-(Designer *)getDesignerAtIndex:(NSIndexPath *)indexPath {

    return gDesignerArray[indexPath.row];
}

- (void)returnDesignersData:(NSArray *)designersArray {
    gDesignerArray = designersArray;
    [[(DesignersListViewController *)_view tableView] reloadData];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [gDesignerArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DesignerTableViewCell *cell = (DesignerTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DesignerCell" forIndexPath:indexPath];
    [cell updateWithDesigner:gDesignerArray[indexPath.row]];
    cell.delegate = self;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (void)toggleFavorite:(DesignerTableViewCell *)cell {
//    CGPoint buttonPosition = [cell.favBtn convertPoint:CGPointZero toView:[(DesignersListViewController *)_view tableView]];
//    NSIndexPath *indexPath = [[(DesignersListViewController *)_view tableView] indexPathForRowAtPoint:buttonPosition];
//OR
    NSIndexPath *indexPath = [[(DesignersListViewController *)_view tableView] indexPathForCell:cell];
    
    if (indexPath != nil)
    {
        Designer *aDesigner = gDesignerArray[indexPath.row];
        if (cell.favBtn.tag == 0) {
            aDesigner.isFavorite = NO;//remove from favorite table
        } else {
            aDesigner.isFavorite = YES;//add to favorite table
        }
    }
}

@end