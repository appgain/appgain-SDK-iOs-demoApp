//
//  AppGainTracker.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/13/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import "AppGain.h"

@implementation  AppGain



//get app keys and configure data

+(void)initializeAppWithID:(NSString *)appID andApiKey:(NSString *)appApiKey{

  //  [AppGain configuerServerParser];

    
    if ([[[SdkKeys new] getParserUserID]  isEqual: @""] ) {
    
        SdkKeys* tempSdkKeys = [SdkKeys new];
    [tempSdkKeys setAppApiKey:appApiKey];
    [tempSdkKeys setAppID:appID];
    [[ServiceLayer new] getRequestWithURL:[UrlData getAppKeysUrlWithID:appID] didFinish:^(NSURLResponse * response, NSMutableDictionary * result) {
      //done
        //  NSLog(@"- init  response ==%@",response);
       // NSLog(@"- init matcher  result ==%@",result);
        
        if (result != nil){

            [tempSdkKeys setAppSubDomainName: [result objectForKey:@"AppSubDomainName"]];
          
            [tempSdkKeys setParseAppID: [result objectForKey:@"Parse-AppID"]];
            [tempSdkKeys setParseMasterKey:  [result objectForKey:@"Parse-masterKey"]];
            [tempSdkKeys setParseServerUrl:  [result objectForKey:@"Parse-serverUrl"]];
      
                  [AppGain configuerServerParser];
   
        }
        else{
             NSLog(@"AppGain SDK init is fail");
            //NSLog(@"%@",response);
        }
        
    }];
    }
    else{
        [AppGain CreateLinkMactcherWithUserID:@"" whenFinish:^(NSURLResponse * response, NSMutableDictionary *result) {
            
           // NSLog(@"- link matcher  response ==%@",response);
            //NSLog(@"- link matcher  result ==%@",result);
        }];
        
        
    }
    
    
}
//MARK: configure parser server
+(void)configuerServerParser{
//    "AppID": "5a53f622e725ee001719ffd2",
//    "AppSubDomainName": "frstflight",
//    "Parse-AppID": "frstflight",
//    "Parse-masterKey": "MASTER-af03b13ce4b203971574369b322d7963682eed6e5c1cf640df84fea7e9e4d6e2",
//    "Parse-serverUrl": "https://appbackend.appgain.io/594507f927af4d7f96698ef5/frstflight"
//
    // run before fine
   // ppId" : "frstflight"
   // "serverUrl" : "https://appbackend.appgain.io/594507f927af4d7f96698ef5/frstflight"
   // "masterKey" : "MASTER-af03b13ce4b203971574369b322d7963682eed6e5c1cf640df84fea7e9e4d6e2"
    
    
    // If you would like all objects to be private by default, remove this line.
    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {
        
        SdkKeys * tempkeys = [SdkKeys new];
        configuration.applicationId = [tempkeys getAppSubDomainName];
        //configuration.clientKey = @"CLIENT-A0D1-BA39C3D5906A";
        configuration.server =[tempkeys getParseServerUrl];
        configuration.localDatastoreEnabled = YES; // If you need to enable local data store
    }]];
    
    [PFUser enableAutomaticUser];
    PFACL *defaultACL = [PFACL ACL];
    defaultACL.publicReadAccess = YES;
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];

    PFUser *currentUser = [PFUser currentUser];
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    });
   //MARK:create new user for this device
    [AppGain createUserID];
  
}


//then call user id by register new user


+ (void)createUserID {

    
    NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
    // NSTimeInterval is defined as double
    NSString *userTimeStamp = [NSString stringWithFormat:@"%.20lf", timeStamp];

    
    PFUser *user = [PFUser user];
    user.username = userTimeStamp;
    user.password = userTimeStamp;
    [user incrementKey:@"usagecounter"];

    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    });
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        //NSLog(user.objectId);
        [[SdkKeys new] setParserUserID:user.objectId];
        if (!error) {
            if (user) {
                // Match link for first run
                [AppGain CreateLinkMactcherWithUserID:@"" whenFinish:^(NSURLResponse * respose, NSMutableDictionary *result) {
                    }];
            }
        } else {   NSString *errorString = [error userInfo][@"error"];   // Show the
            NSLog(@"AppGain Fail to create your id %@",error);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    }];
}


///https://frstflight.appgain.io/s/ihpjU

+(void)RegisterDeviceWithToken:(NSData*)deviceToken{
    
    /// send token to parser server
        PFInstallation *currentInstallation = [PFInstallation currentInstallation];
        [currentInstallation setDeviceTokenFromData:deviceToken];
        [currentInstallation saveInBackground];

    [PFPush subscribeToChannelInBackground:@"" block:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"AppGain ParseStarterProject successfully subscribed to push notifications on the broadcast channel.");
        } else {
            NSLog(@"AppGain ParseStarterProject failed to subscribe to push notifications on the broadcast channel.");
        }
    }];


}
+(void)handlePush:(NSDictionary *)userInfo forApplication:(UIApplication *)application{
  //  [PFPush handlePush:userInfo];
    
    [AppGain trackNotificationWithAction: [NotificationStatus Opened]   andUserInfo:userInfo  whenFinish:^(NSURLResponse *response, NSMutableDictionary *result) {
       // NSLog(@"%@",result);
        
        
    }];
    
    if (application.applicationState == UIApplicationStateInactive) {
        [PFAnalytics trackAppOpenedWithRemoteNotificationPayload:userInfo];
    }

}



///create smartLink for app
+(void)CreateSmartLinkWithObject:( SmartLinkObject*)linkObject whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete{
    
    
    
    [[ServiceLayer new] postRequestWithURL: [UrlData getSmartUrl] withBodyData: linkObject.dictionaryValue didFinish:^(NSURLResponse * response, NSMutableDictionary *result) {
       
        dispatch_async(dispatch_get_main_queue(), ^{
            onComplete(response,result);
        });
   
    }];
    
}


//MARK:create linkMatcher
+(void)CreateLinkMactcherWithUserID :(NSString *)userID whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete{

    [[ServiceLayer new] getRequestWithURL:[UrlData getmatcherUrlWithUserID:userID] didFinish:^(NSURLResponse *response, NSMutableDictionary *result) {
            dispatch_async(dispatch_get_main_queue(), ^{
            onComplete(response,result);
        });

    }];

}




//MARK : create LandingPage for user
+(void)createLandingPageWithObject:(LandingPageObject *)landingPage whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete{
    [[ServiceLayer new] postRequestWithURL:[UrlData getLandingPageUrl] withBodyData: [landingPage dictionaryValue] didFinish:^(NSURLResponse *response, NSMutableDictionary *result) {
                dispatch_async(dispatch_get_main_queue(), ^{
            onComplete(response,result);
        });


    }];


        

}





//MARK:create automator
    
+(void)CreateAutomatorWithTrigger:(NSString *)trigger andUserId:(NSString *)userID whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete{
        
        
        [[ServiceLayer new] getRequestWithURL:[UrlData getAutomatorUrlWithTriggerPoint:trigger] didFinish:^(NSURLResponse *response , NSMutableDictionary * result) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                onComplete(response,result);
            });


            
        }];
        
    }
//Mark track notification

+(void)trackNotificationWithAction :(NSString*)action andUserInfo:(NSDictionary *) userInfo whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete{
//    
//    {
//        aps =     {
//            alert = "hello my user ";
//            sound = default;
//        };
//        campaignName = "Welcome to test ";
//        "campaign_id" = 5ab429976dd3f5007e5c2879;
//    }
    
    NSDictionary *details = @{@"channel" :@"apppush",
                              @"action":
                                  @{@"name":action,@"value":@"NA"} ,//name could be received", --> or conversion or open
                              @"userId":[[SdkKeys new] getParserUserID], //
                              @"campaign_id": [userInfo objectForKey:@"campaignName"],
                              @"campaign_name":[userInfo objectForKey:@"campaign_id"]
                              };
    
    [[ServiceLayer new] postRequestWithURL:[UrlData getnotificationTrackUrl] withBodyData:details didFinish:^(NSURLResponse *response  , NSMutableDictionary * result) {
        
       // NSLog(@"%@",result);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            onComplete(response,result);
        });


        
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
