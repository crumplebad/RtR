//
//  DetailInteractorIO.h
//  RtR
//
//  Created by Jay on 6/23/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DetailInteractorInput <NSObject>

- (void)getAllImagesForUrl:(NSArray *)urlArray;

@end

@protocol DetailInteractorOutput <NSObject>

- (void)returnAllImageData:(NSArray *)imageArray;

@end