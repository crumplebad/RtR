//
//  DetailPresenter.h
//  RtR
//
//  Created by Jay on 6/23/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DetailInteractorIO.h"
#import "DetailView.h"

@interface DetailPresenter : NSObject<DetailInteractorOutput, UIScrollViewDelegate>

@property (nonatomic, weak)     id<DetailView>            view;
@property (nonatomic, strong)   id<DetailInteractorInput> input;

- (void)loadImageDataForUrls:(NSArray *)urlArray;

@end
