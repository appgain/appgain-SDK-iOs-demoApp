//
//  UrlData.h
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/12/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SdkKeys.h"


@interface UrlData : NSObject


+ (NSString*) getAppKeysUrlWithID :(NSString*)appID ;

+ (NSString*) getSmartUrl;
+ (NSString*) getmatcherUrlWithUserID :(NSString*)userID;
+ (NSString*) getLandingPageUrl;
+ (NSString*) getnotificationTrackUrl;
+ (NSString*) getAutomatorUrlWithTriggerPoint :(NSString*)trigger;


@end

