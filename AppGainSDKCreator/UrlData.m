//
//  UrlData.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/12/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import "UrlData.h"



@implementation UrlData


//https://api.appgain.it/ 5a805a51673b0f1b4d986bca/initSDK

+(NSString *)getAppKeysUrlWithID:(NSString *)appID{

    NSString *urlString =  [NSString stringWithFormat:@"%@%@%@", @"https://api.appgain.it/", appID, @"/initSDK"];


    return urlString;
}

+ (NSString*) getSmartUrl{
    NSString *urlString =  [NSString stringWithFormat:@"%@%@%@", @"https://api.appgain.it/apps/", [[SdkKeys new] getAppID], @"/smartlinks"];

    return urlString;

}
+ (NSString*) getmatcherUrlWithUserID :(NSString*)userID{
    
    SdkKeys *temp = [SdkKeys new];
    
//https://[AppSubDomainName].appgain.io/i/smartlinks/match[?userId= parser user id ]&[isfirstRun=true|false]&[appuserId=APP userID] <- may can optional
//
    
    
    //
    //'https://frstflght.appgain.it/smartlinks/match?isfirstRun=true'\
    
    
    NSString *urlStringg  = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@", @"https://", [temp getAppSubDomainName], @".appgain.it/smartlinks/match?isfirstRun=" , [temp getFirstRun] , @"&userId=",[temp getParserUserID] , @"&appuserId=",userID];
    
    return urlStringg;

    
   
}
+ (NSString*) getLandingPageUrl{
    //https://api.appgain.io/apps/<AppID>landingpages
    
    NSString *urlString =  [NSString stringWithFormat:@"%@%@%@", @"https://api.appgain.it/apps/", [[SdkKeys new] getAppID], @"/landingpages"];
    
    return urlString;
    
    

}
+ (NSString*) getnotificationTrackUrl{
    
    
    NSString *urlString =  [NSString stringWithFormat:@"%@%@/%@", @"https://notify.appgain.io/", [[SdkKeys new] getAppID], @"/recordstatus"];

    return urlString;

}
+ (NSString*) getAutomatorUrlWithTriggerPoint:(NSString *)trigger{
   // @"https://automator.appgain.io/automessages/<AppID>/firevent/<trigger-point name>/<userId>";

    
//https://automator.appgain.io/automessages/[AppID]/firevent/[trigger
 //   point name]/[userId]
    SdkKeys *temp = [SdkKeys new];

    
    NSString *urlString =  [NSString stringWithFormat:@"%@%@%@%@%@%@", @"https://automator.appgain.it/automessages/", [temp getAppID], @"/firevent/",trigger,@"/",[temp getParserUserID]];
    
    return urlString;
 

}
@end
