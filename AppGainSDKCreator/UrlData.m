//
//  UrlData.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/12/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import "UrlData.h"



@implementation UrlData


+(NSString *)getAppKeysUrl{
    
    
    
    
    return @"not provided yet";

}
+ (NSString*) getSmartUrl{
    
    NSString *urlString =  [NSString stringWithFormat:@"%@/%@/%@", @"https://api.appgain.io/apps/", [[SdkKeys new] getAppID], @"/smartlinks"];

    return urlString;

}
+ (NSString*) getmatcherUrlWithUserID :(NSString*)userID{
    
    SdkKeys *temp = [SdkKeys new];
    
//https://[AppSubDomainName].appgain.io/i/smartlinks/match[?userId= parser user id ]&[isfirstRun=true|false]&[appuserId=APP userID] <- may can optional
    
    NSString *urlString =  [NSString stringWithFormat:@"%@/%@/%@/%@/%@/%@/%@/%@", @"https://", [temp getAppSubDomainName], @".appgain.io/i/smartlinks/match?userId=",[temp getParserUserID],@"&isfirstRun=",[temp getFirstRun],@"&appuserId=",[temp getParserUserID]];
    
    return urlString;

    
   
}
+ (NSString*) getLandingPageUrl{
    //https://api.appgain.io/apps/<AppID>landingpages
    
    NSString *urlString =  [NSString stringWithFormat:@"%@/%@/%@", @"https://api.appgain.io/apps/", [[SdkKeys new] getAppID], @"landingpages"];
    
    return urlString;
    
    

}
+ (NSString*) getnotificationTrackUrl{
    
    
    NSString *urlString =  [NSString stringWithFormat:@"%@/%@/%@", @"https://notify.appgain.io/", [[SdkKeys new] getAppID], @"/recordstatus"];

    return urlString;

}
+ (NSString*) getAutomatorUrlWithTriggerPoint:(NSString *)trigger{
   // @"https://automator.appgain.io/automessages/<AppID>/firevent/<trigger-point name>/<userId>";

    
    SdkKeys *temp = [SdkKeys new];

    
    NSString *urlString =  [NSString stringWithFormat:@"%@/%@/%@/%@/%@/%@", @"https://automator.appgain.io/automessages/", [temp getAppID], @"/firevent/",trigger,@"/",[temp getDeviceUDID]];
    
    return urlString;
 

}
@end
