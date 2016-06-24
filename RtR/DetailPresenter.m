//
//  DetailPresenter.m
//  RtR
//
//  Created by Jay on 6/23/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "DetailPresenter.h"
#import "DetailViewController.h"

@implementation DetailPresenter


- (void)loadImageDataForUrls:(NSArray *)urlArray {
    [self.input getAllImagesForUrl:urlArray];
}

- (void)returnAllImageData:(NSArray *)imageArray {

    [(DetailViewController *)_view configureImageview:imageArray];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = [(DetailViewController *) _view imageScrollView].frame.size.width;
    float fractionalPage = [(DetailViewController *) _view imageScrollView].contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    [(DetailViewController *) _view pageControl].currentPage = page;
}

@end
