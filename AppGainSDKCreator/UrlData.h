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


+ (NSString*) getAppKeysUrl;

+ (NSString*) getSmartUrl;
+ (NSString*) getmatcherUrl;
+ (NSString*) getLandingPageUrl;
+ (NSString*) getnotificationTrackUrl;
+ (NSString*) getAutomatorUrlWithTriggerPoint :(NSString*)trigger;



//create smart link
//https://api.appgain.io/apps/<AppID>/smartlinks
// matcher url
//https://<AppSubDomainName>.appgain.io/i/smartlinks/match?userId= <UID_VALUE>&isfirstRun=<true | false>

// create landing pages
//https://api.appgain.io/apps/<AppID>landingpages
//notification track
//https://notify.appgain.io/<AppID>/recordstatus

// automator
// https://automator.appgain.io/automessages/<AppID>/firevent/<trigger-point name>/<userId>

@end

