//
//  DesignersInteractorIO.h
//  RtR
//
//  Created by Jay on 6/22/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol DesignersInteractorInput <NSObject>
//delegate methods
- (void)getAllData;

@end

@protocol DesignersInteractorOutput <NSObject>
//delegate methods

- (void)returnDesignersData:(NSArray *)designersArray;

@end
