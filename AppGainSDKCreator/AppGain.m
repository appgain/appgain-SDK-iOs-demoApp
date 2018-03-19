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


    
    if ([[[SdkKeys new] getParserUserID]  isEqual: @""] ) {
    
        SdkKeys* tempSdkKeys = [SdkKeys new];
    [tempSdkKeys setAppApiKey:appApiKey];
    [tempSdkKeys setAppID:appID];
    [[ServiceLayer new] getRequestWithURL:[UrlData getAppKeysUrlWithID:appID] didFinish:^(NSURLResponse * response, NSMutableDictionary * result) {
      //done
        //  NSLog(@"- init  response ==%@",response);
      //  NSLog(@"- init matcher  result ==%@",result);
        
        if (result != nil){

            [tempSdkKeys setAppSubDomainName: [result objectForKey:@"AppSubDomainName"]];
          
            [tempSdkKeys setParseAppID: [result objectForKey:@"Parse-AppID"]];
            [tempSdkKeys setParseMasterKey:  [result objectForKey:@"Parse-masterKey"]];
            [tempSdkKeys setParseServerUrl:  [result objectForKey:@"Parse-serverUrl"]];
            [AppGain configuerServerParser];
            
        }
        else{
             NSLog(@"AppGain init application is fail");
            NSLog(@"%@",response);
        }
        
    }];
    }
    else{
        [AppGain CreateLinkMactcherWithUserID:[[SdkKeys new] getParserUserID] whenFinish:^(NSURLResponse * response, NSMutableDictionary *result) {
            
            NSLog(@"- link matcher  response ==%@",response);
            NSLog(@"- link matcher  result ==%@",result);
        }];
        
        
    }
    
    
}

+(void)configuerServerParser{

    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {
        
        SdkKeys * tempkeys = [SdkKeys new];
        
        configuration.applicationId = [tempkeys getAppID];
        configuration.clientKey = [tempkeys getParseMasterKey];//@"YOUR_CLIENT_KEY";
        configuration.server = [tempkeys getParseServerUrl];//@"https://parseapi.back4app.com";
        configuration.localDatastoreEnabled = YES; // If you need to enable local data store
        
      
    }]];
    
    [PFUser enableAutomaticUser];
    
    
     [[PFUser new] objectId];
    
    
    PFACL *defaultACL = [PFACL ACL];
    
//
//    // If you would like all objects to be private by default, remove this line.
    defaultACL.publicReadAccess = YES;
//    
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];

    PFUser *currentUser = [PFUser currentUser];
    ///[5316:118939]
    //[5381:119745]
    NSString *tempUsrParserID = [currentUser getUserID];
    NSLog(@"--parser id %@", tempUsrParserID);
    
    
    [[SdkKeys new] setParserUserID:tempUsrParserID];
  // after get user id send matcher link for app
    
    [AppGain CreateLinkMactcherWithUserID:[[SdkKeys new] getParserUserID] whenFinish:^(NSURLResponse * response, NSMutableDictionary *result) {
        
        
        
        NSLog(@"%@",response);
        
        NSLog(@"%@",result);
    }];
    
    
    
}


//then call user id by register new user


+ (void)createUserID {
    PFUser *user = [PFUser new];
    
    PFUser *currentUser = [PFUser currentUser];
///[5316:118939]
    //[5381:119745] 
    NSLog(@"%@", [currentUser sessionToken]);
    
    [currentUser getUserID];
    user.username = @"ragaie";
    user.password = @"werwerwer";
    user.email = @"ragaie@gmail.com";
    
    // other fields can be set just like with PFObject
    user[@"phone"] = @"3920202";
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

    [[PFUser currentUser] signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        PFUser *currentUser = [PFUser currentUser];

        NSLog(@"%@", [currentUser description] );

        
        if (!error) {
            // get current user to save user parser id in nsuserDefault
            PFUser *currentUser = [PFUser currentUser];
            if (currentUser) {
                // do stuff with the user
                [AppGain CreateLinkMactcherWithUserID:[[SdkKeys new] getParserUserID] whenFinish:^(NSURLResponse * respose, NSMutableDictionary *result) {
                    
                }];
                
            }
            
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

        } else {   NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
            
            NSLog(@"AppGain Fail to create your id %@",error);
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

        }
    }];
}




+(void)RegisterDeviceWithToken:(NSData*)deviceToken{
    
    /// send token to parser server
        PFInstallation *currentInstallation = [PFInstallation currentInstallation];
        [currentInstallation setDeviceTokenFromData:deviceToken];
        [currentInstallation saveInBackground];
        
    [PFPush subscribeToChannelInBackground:@"" block:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"ParseStarterProject successfully subscribed to push notifications on the broadcast channel.");
        } else {
            NSLog(@"ParseStarterProject failed to subscribe to push notifications on the broadcast channel.");
        }
    }];


}
+(void)handlePush:(NSDictionary *)userInfo forApplication:(UIApplication *)application{
    [PFPush handlePush:userInfo];
    
    [AppGain trackNotificationWithAction: [NotificationStatus Opened]    whenFinish:^(NSURLResponse *response, NSMutableDictionary *result) {
        
        
        
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


////create linkMatcher
+(void)CreateLinkMactcherWithUserID :(NSString *)userID whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete{


    
    
    [[ServiceLayer new] getRequestWithURL:[UrlData getmatcherUrlWithUserID:userID] didFinish:^(NSURLResponse *response, NSMutableDictionary *result) {
        
        NSLog(@"%@",result);
        dispatch_async(dispatch_get_main_queue(), ^{
            onComplete(response,result);
        });

    }];
    

}





+(void)createLandingPageWithObject:(LandingPageObject *)landingPage whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete{
    [[ServiceLayer new] postRequestWithURL:[UrlData getLandingPageUrl] withBodyData: [landingPage dictionaryValue] didFinish:^(NSURLResponse *response, NSMutableDictionary *result) {
        
        NSLog(@"%@",result);
        dispatch_async(dispatch_get_main_queue(), ^{
            onComplete(response,result);
        });


    }];


        

}





//MARK:create automator
    
+(void)CreateAutomatorWithTrigger:(NSString *)trigger andUserId:(NSString *)userID whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete{
        
        
        [[ServiceLayer new] getRequestWithURL:[UrlData getAutomatorUrlWithTriggerPoint:trigger] didFinish:^(NSURLResponse *response , NSMutableDictionary * result) {
            
            NSLog(@"%@",result);
            dispatch_async(dispatch_get_main_queue(), ^{
                onComplete(response,result);
            });


            
        }];
        
    }
//Mark track notification

+(void)trackNotificationWithAction :(NSString*)action whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete{
    
    NSDictionary *details = @{@"channel" :@"apppush",
                              @"action":
                                  @{@"name":@"",@"value":@"NA"} ,//name could be received", --> or conversion or open
                              @"userId":@"", //
                              @"campaign_id":@"",//"[read it from incomming push]"
                              @"campaign_name":@""//"[read it from incomming push]"
                              };
    
    [[ServiceLayer new] postRequestWithURL:[UrlData getnotificationTrackUrl] withBodyData:details didFinish:^(NSURLResponse *response  , NSMutableDictionary * result) {
        
        NSLog(@"%@",result);
        
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
