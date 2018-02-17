//
//  AppGainTracker.h
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/13/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceLayer.h"
#import "SdkKeys.h"
#import "UrlData.h"

/// import all model you need
#import "DataModels.h"

@interface AppGain : NSObject
+(void)ConfigureApp:( NSString* )key;

+(void)CreateSmartLinkWithObject:( SmartLinkObject*)linkObject whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete;

+(void)CreateLinkMactcherWithUserID :(NSString *)userID;
+(void)createLandingPageWithObject:(LandingPageObject *)landingPage;
//
//curl --request GET \
//--url
//https://automator.appgain.io/automessages/<AppID>/firevent/<trigger
//point name>/<userId>
//--header 'appApiKey: [appApiKey]'
+(void)CreateAutomatorWithTrigger :(NSString*) trigger andUserId :(NSString*)userID;

@end
