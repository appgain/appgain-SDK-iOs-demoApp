//
//  UrlData.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/12/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import "UrlData.h"



@implementation UrlData


+(NSString *)getAppKeysUrlWithID:(NSString *)appID{

    NSString *urlString =  [NSString stringWithFormat:@"%@%@%@", @"https://api.appgain.io/", appID, @"/initSDK"];


    return urlString;
}

+ (NSString*) getSmartUrl{
    NSString *urlString =  [NSString stringWithFormat:@"%@%@%@", @"https://api.appgain.io/apps/", [[SdkKeys new] getAppID], @"/smartlinks"];

    return urlString;

}
+ (NSString*) getmatcherUrlWithUserID :(NSString*)userID{
    
    SdkKeys *temp = [SdkKeys new];
    

    NSString *userIDD = userID;
    if ( [userID isEqualToString:@""]){
        
        userIDD = [temp getParserUserID];
        
    }
 
    NSString *urlStringg  = [NSString stringWithFormat:@"%@%@%@%@%@%@", @"https://", [temp getAppSubDomainName], @".appgain.io/smartlinks/match?isfirstRun=" , [temp getFirstRun] , @"&userId=",userIDD];

    
//    NSString *urlStringg  = [NSString stringWithFormat:@"%@%@%@%@", @"https://frstflght.appgain.io/smartlinks/match?isfirstRun=" , [temp getFirstRun] , @"&userId=",userIDD];
//    
//    
    return urlStringg;

    
   
}
+ (NSString*) getLandingPageUrl{
    //https://api.appgain.io/apps/<AppID>landingpages
    
    NSString *urlString =  [NSString stringWithFormat:@"%@%@%@", @"https://api.appgain.io/apps/", [[SdkKeys new] getAppID], @"/landingpages"];
    
    return urlString;
    
    

}
+ (NSString*) getnotificationTrackUrl{
    
    
    NSString *urlString =  [NSString stringWithFormat:@"%@%@%@", @"https://notify.appgain.io/", [[SdkKeys new] getAppID], @"/recordstatus"];

    return urlString;

}
+ (NSString*) getAutomatorUrlWithTriggerPoint:(NSString *)trigger{
   // @"https://automator.appgain.io/automessages/<AppID>/firevent/<trigger-point name>/<userId>";

    
//https://automator.appgain.io/automessages/[AppID]/firevent/[trigger
 //   point name]/[userId]
    SdkKeys *temp = [SdkKeys new];


    NSString *urlString =  [NSString stringWithFormat:@"%@%@%@%@%@%@", @"https://automator.appgain.io/automessages/", [temp getAppID], @"/firevent/",trigger,@"/",[temp getParserUserID]];
    
    return urlString;
 

}
@end
