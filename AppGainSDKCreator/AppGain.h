//
//  AppGainTracker.h
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/13/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import <Foundation/Foundation.h>

/// import all model you need
#import "DataModels.h"
#import <Parse/Parse.h>

@interface AppGain : NSObject




+(void)initializeAppWithID:( NSString* )appID andApiKey :(NSString*)appApiKey  whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete ;


+(void)RegisterDeviceWithToken:(NSData*)deviceToken;

+(void)handlePush:(NSDictionary *)userInfo forApplication : (UIApplication*) application;

+(void)CreateSmartLinkWithObject:( SmartLinkObject*)linkObject whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete;

+(void)CreateLinkMactcherWithUserID :(NSString *)userID whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete;
+(void)createLandingPageWithObject:(LandingPageObject *)landingPage whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete;
+(void)CreateAutomatorWithTrigger :(NSString*) trigger andUserId :(NSString*)userID whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete;


+(void)trackNotificationWithAction:(NSString*)action andUserInfo:(NSDictionary *) userInfo whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete;
@end
