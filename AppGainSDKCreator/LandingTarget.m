//
//  LandingTarget.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/15/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import "LandingTarget.h"

@implementation LandingTarget


@synthesize ios = _ios;
@synthesize android = _android;
@synthesize web = _web;

- (id)initWithTargetIOS:(NSString*)ios andAndroid:(NSString*)android andWeb: (NSString*)web{
    
    self = [super init];
    if(self) {
        _ios = ios;
        _android = android;
        _web = web;
    }
    return self;

}
@end
