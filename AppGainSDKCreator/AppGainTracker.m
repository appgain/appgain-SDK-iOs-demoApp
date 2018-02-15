//
//  AppGainTracker.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/13/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import "AppGainTracker.h"

@implementation  AppGainTracker



//get app keys and configure data
+(void)ConfigureApp:(NSString *)key{

    [[SdkKeys new] setAppID:key];
    [[ServiceLayer new] getRequestWithURL:[UrlData getAppKeysUrl] didFinish:^(NSURLResponse * reponse, NSMutableDictionary * result) {
        
        
        NSLog(@"%@",result);

        
    }];
}
//Match link open
-(void)matchLink{

    [[ServiceLayer new] getRequestWithURL:[UrlData getmatcherUrl] didFinish:^(NSURLResponse *response, NSMutableDictionary *result) {
     
        NSLog(@"%@",result);
    }];

}


+(void)createLandingPage{


        

}





///create smartLink for app
+(void)CreateSmartLinkWithObject:( SmartLinkObject*)linkObject whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete{

    
   
    [[ServiceLayer new] postRequestWithURL: [UrlData getSmartUrl] withBodyData: linkObject.description didFinish:^(NSURLResponse * response, NSMutableDictionary *result) {
    
        
        NSLog(@"%@",result);

        
    }];
    
}
//MARK:create automator
    
+(void)CreateAutomatorWithTrigger:(NSString *)trigger andUserId:(NSString *)userID{
        
        
        [[ServiceLayer new] getRequestWithURL:[UrlData getAutomatorUrlWithTriggerPoint:trigger] didFinish:^(NSURLResponse *response , NSMutableDictionary * result) {
            
            NSLog(@"%@",result);

            
        }];
        
    }
//Mark track notification
+(void)trackNotification{
    
    NSDictionary *details = @{@"channel" :@"apppush",
                              @"action":
                                  @{@"name":@"",@"value":@"NA"} ,//name could be received", --> or conversion or open
                              @"userId":@"", //
                              @"campaign_id":@"",//"[read it from incomming push]"
                              @"campaign_name":@""//"[read it from incomming push]"
                              };
    
    [[ServiceLayer new] postRequestWithURL:[UrlData getnotificationTrackUrl] withBodyData:details didFinish:^(NSURLResponse *response  , NSMutableDictionary * result) {
        
        NSLog(@"%@",result);

        
    }];
        
    
    }
    
//    
//    curl --request POST
//    --url https://notify.appgain.io/<AppID>/recordstatus
//    --header 'appApiKey: <appApiKey>’, 'content-type: application/json'
//    --data ‘
//    {
//        "channel": "apppush",
//        "action": {
//            ——————————————————————————————————————————————————————
//            ////Record status -Push Received
//            "name": "received", --> or conversion or open
//            OR//Record status -Push Opened
//            "name": "open", --> or conversion or open
//            OR//Record status -Push Conversion
//            "name": "conversion", --> or conversion or open
//            —————————————————————————————————————————————
//            
//            "value": "NA"
//        },
//        "userId":"[userId]",
//        "campaign_id": "[read it from incomming push]",
//        "campaign_name": "[read it from incomming push]"
//    }'
//    
//    
//    




@end
