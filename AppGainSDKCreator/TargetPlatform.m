//
//  Platform.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/13/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//
#import "TargetPlatform.h"


@implementation TargetPlatform

@synthesize primary = _primary;
@synthesize fallback = _fallback;


- (id)init
{
    return [self initWithPrimary:_primary withFallBack:_fallback ];
}



- (id)initWithPrimary:(NSString*)primary withFallBack:(NSString*)fallBack 
{
    self = [super init];
    if(self) {
        _primary = primary;
        _fallback = fallBack;
    }
    return self;
}

@end
