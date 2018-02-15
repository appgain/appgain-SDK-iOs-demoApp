//
//  LandingTarget.h
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/15/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LandingTarget : NSObject


//      "targets": { "ios": “[input]", "android": “[input]", "web": "[input]"}

@property (nonatomic, strong) NSString *ios;
@property (nonatomic, strong) NSString *android;
@property (nonatomic, strong) NSString *web;

- (id)initWithTargetIOS:(NSString*)ios andAndroid:(NSString*)android andWeb: (NSString*)web ;


@end
