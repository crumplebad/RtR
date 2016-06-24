//
//  DesignersPresenter.h
//  RtR
//
//  Created by Jay on 6/21/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DesignersInteractorIO.h"
#import "DesignersView.h"
#import "DesignerTableViewCell.h"

@interface DesignersPresenter : NSObject<DesignersInteractorOutput, UITableViewDelegate, UITableViewDataSource, DesignerTableViewCellDelegate>

@property (nonatomic, weak)     id<DesignersView>            view;
@property (nonatomic, strong)   id<DesignersInteractorInput> input;

- (Designer *)getDesignerAtIndex:(NSIndexPath *)indexPath;
- (void)loadDesignersData;

@end
