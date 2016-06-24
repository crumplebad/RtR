//
//  DetailViewController.m
//  RtR-MD
//
//  Created by Jay on 6/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "DetailViewController.h"
#import "Product.h"
#import "DetailPresenter.h"
#import "AppDependency.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@interface DetailViewController () {
    
    Product *gProduct;
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [AppDependency configureDependencyForDetails:self];
    [self.imageScrollView setDelegate:self.presenter];
    [self loadImages];
    [self configureView];
}

- (void)loadImages {
    NSArray *imageUrlArray;
    if (SCREEN_WIDTH > 320) {
        imageUrlArray = [gProduct.imagesBySize objectForKey:@"1200y"];
    } else {
        imageUrlArray = [gProduct.imagesBySize objectForKey:@"720y"];
    }
    [self setPageControlSize:[imageUrlArray count]];//BAD!!
    [self.presenter loadImageDataForUrls:imageUrlArray];
}

- (void)setPageControlSize:(NSInteger)size {
    [_pageControl setNumberOfPages: size];
}

- (void)setProduct:(Product *)product {
    gProduct = product;
}

- (void)configureView {
    [_stackableViewWidthConstraint setConstant:SCREEN_WIDTH - 40.f];
    _styleNameLbl.text = gProduct.styleName;
    _displayNameLbl.text = gProduct.displayName;
    _productDetailsLbl.text = [NSString stringWithFormat:@"Product Details:\n               %@", gProduct.productDetail];
    _designerLbl.text = [NSString stringWithFormat:@"Designer: %@", gProduct.designer];
    _typeLbl.text = [NSString stringWithFormat:@"Type: %@", gProduct.type];
    _fitNoteLbl.text = [NSString stringWithFormat:@"Fit Note:\n       %@", gProduct.fitNotes];
    _styleNoteLbl.text = [NSString stringWithFormat:@"Style Note:\n          %@", gProduct.styleNotes];
    _rentalFee8DayLbl.text = [NSString stringWithFormat:@"8 days rental fees: $%@.00", gProduct.rentalFee8Day];
    _rentalFeeLbl.text = [NSString stringWithFormat:@"1 day rental fees: $%@.00", gProduct.rentalFee];
    [_clearanceLbl setHidden:!gProduct.clearance];
    [_clearanceLblHeightConstraint setConstant:(gProduct.clearance?35.f:0.f)];
}

- (void)configureImageview:(NSArray *)imageArray {

    int i = 0;
    
    for (id image in imageArray) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        [imageView setFrame:CGRectMake(240*i, 0, 240, 320)];
        [_imageScrollContentView addSubview:imageView];
        i++;
    }
    [_imageScrollView setContentSize:CGSizeMake(240*i, 320)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
