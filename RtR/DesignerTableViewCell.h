//
//  DesignerTableViewCell.h
//  RtR
//
//  Created by Jay on 6/21/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Designer.h"

@class DesignerTableViewCell;

@protocol DesignerTableViewCellDelegate <NSObject>

- (void) toggleFavorite:(DesignerTableViewCell *)cell;

@end

@interface DesignerTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIButton *favBtn;
@property (strong, nonatomic) IBOutlet UILabel *designerLbl;
@property (strong, nonatomic) IBOutlet UILabel *productCountLbl;
@property (weak, nonatomic) id<DesignerTableViewCellDelegate> delegate;

- (IBAction)favBtnPressed:(id)sender;
- (void)updateWithDesigner:(Designer *)designer;

@end
