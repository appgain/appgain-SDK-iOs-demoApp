//
//  LaunchPage.h
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/13/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "TargetPlatform.h"


@interface SmartLinkObject : NSObject

@property (nonatomic, strong) NSString *header;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *linkDescription;
@property (nonatomic, strong) NSString *linkName;
@property (nonatomic, strong) TargetPlatform *iosPlatform;
@property (nonatomic, strong) TargetPlatform *androidPlatform;
@property (nonatomic, strong) TargetPlatform *webPlatform;
@property (nonatomic, strong) NSString *slug ;

- (SmartLinkObject*)initWithHeader: (NSString*)header andImage : (NSString*) imageUrl andDescription : (NSString*) description andName :(NSString*)name iosTarget :(TargetPlatform*)ios androidTarget :(TargetPlatform*)android webTarget :(TargetPlatform*)web;



-(NSDictionary*)dictionaryValue;



@end
