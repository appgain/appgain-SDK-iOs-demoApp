//
//  Platform.h
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/13/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//
#import <Foundation/Foundation.h>




@interface TargetPlatform : NSObject  


@property (nonatomic, strong) NSString *primary;
@property (nonatomic, strong) NSString *fallback;

- (id)initWithPrimary:(NSString*)primary withFallBack:(NSString*)fallBack ;


@end
