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
+(void)ConfigureApp:(NSString *)key{

    
    if (![[[SdkKeys new] getParserUserID]  isEqual: @""] ) {
    
   
    
    [[SdkKeys new] setAppID:key];
    [[ServiceLayer new] getRequestWithURL:[UrlData getAppKeysUrl] didFinish:^(NSURLResponse * reponse, NSMutableDictionary * result) {
        
        
        
        //result will have this data
//        {
//            "AppID": "5a805a51673b0f1b4d986bca",
//            "AppSubDomainName": "tyne",
//            "Parse-AppID": "tyne",
//            "Parse-masterKey": "MASTER-0cd774c04194d80602df30b1025422ccf4aa2b49069a2e74b434331656a397f1",
//            "Parse-serverUrl": "http://parse-server-5a79cfc2673b0f650995b8cc-tyne:8036/5a79cfc2673b0f650995b8cc/tyne"
//        }
        
        NSLog(@"%@",result);
/// call this method configuerServerParser
        
    }];
    }
    else{
    
    
    
        [AppGain CreateLinkMactcherWithUserID:@"" whenFinish:^(NSURLResponse * respose, NSMutableDictionary *result) {
        
        }];
        
        
    }
    
    
}

-(void)configuerServerParser{

//    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {
//        configuration.applicationId = @"YOUR_APP_ID";
//        configuration.clientKey = @"YOUR_CLIENT_KEY";
//        configuration.server = @"https://parseapi.back4app.com";
//        configuration.localDatastoreEnabled = YES; // If you need to enable local data store
//    }]];

}


//then call user id by register new user


- (void)myMethod {
//    PFUser *user = [PFUser user];
//    user.username = @"my name";
//    user.password = @"my pass";
//    user.email = @"email@example.com";
//    
//    // other fields can be set just like with PFObject
//    user[@"phone"] = @"415-392-0202";
//    
//    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (!error) {
//            // get current user to save user parser id in nsuserDefault
//            PFUser *currentUser = [PFUser currentUser];
//            if (currentUser) {
//                // do stuff with the user
//                
//                [AppGain CreateLinkMactcherWithUserID:@"" whenFinish:^(NSURLResponse * respose, NSMutableDictionary *result) {
//                    
//                }];
//                
//            } else {
//                // show the signup or login screen
//            }
//            // Hooray! Let them use the app now.
//        } else {   NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
//        }
//    }];
}




+(void)RegisterDeviceWithToken:(NSData*)deviceToken{
    
//    /// send token to parser server
//        PFInstallation *currentInstallation = [PFInstallation currentInstallation];
//        [currentInstallation setDeviceTokenFromData:deviceToken];
//        [currentInstallation saveInBackground];
//        



}




///create smartLink for app
+(void)CreateSmartLinkWithObject:( SmartLinkObject*)linkObject whenFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete{
    
    
    
    [[ServiceLayer new] postRequestWithURL: [UrlData getSmartUrl] withBodyData: linkObject.description didFinish:^(NSURLResponse * response, NSMutableDictionary *result) {
        
        
        NSLog(@"%@",result);
        
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
