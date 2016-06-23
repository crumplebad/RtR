//
//  DetailViewController.h
//  RtR-MD
//
//  Created by Jay on 6/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailView.h"

@class DetailPresenter;

@class Product;

@interface DetailViewController : UIViewController<DetailView>

@property (strong, nonatomic) DetailPresenter *presenter;

@property (strong, nonatomic) IBOutlet UIPageViewController *pageController;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (strong, nonatomic) IBOutlet UIView *imageScrollContentView;
@property (strong, nonatomic) IBOutlet UILabel *clearanceLbl;
@property (strong, nonatomic) IBOutlet UILabel *styleNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *displayNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *productDetailsLbl;
@property (strong, nonatomic) IBOutlet UILabel *designerLbl;
@property (strong, nonatomic) IBOutlet UILabel *typeLbl;
@property (strong, nonatomic) IBOutlet UILabel *fitNoteLbl;
@property (strong, nonatomic) IBOutlet UILabel *styleNoteLbl;
@property (strong, nonatomic) IBOutlet UILabel *rentalFee8DayLbl;
@property (strong, nonatomic) IBOutlet UILabel *rentalFeeLbl;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *clearanceLblHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *stackableViewWidthConstraint;

- (void)configureImageview:(NSArray *)imageArray;

- (void)setProduct:(Product *)product;

@end

