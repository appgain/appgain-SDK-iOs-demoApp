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
+(void)RegisterDeviceWithToken:(NSData*)deviceToken;
+(void)CreateSmartLinkWithObject:( SmartLinkObject*)linkObject whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete;

+(void)CreateLinkMactcherWithUserID :(NSString *)userID whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete;
+(void)createLandingPageWithObject:(LandingPageObject *)landingPage whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete;
+(void)CreateAutomatorWithTrigger :(NSString*) trigger andUserId :(NSString*)userID whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete;
+(void)trackNotificationWithAction:(NSString*)action whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete;
@end
