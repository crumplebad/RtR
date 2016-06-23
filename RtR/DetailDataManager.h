//
//  DetailDataManager.h
//  RtR
//
//  Created by Jay on 6/23/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DetailDataManager : NSObject

- (void)getImagesForUrls:(NSArray *)urlArray withCompletionHandler:(void(^)(NSArray *imageArray , NSError *))completionBlock;

@end
