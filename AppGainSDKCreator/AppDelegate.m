//
//  AppDelegate.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/12/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import "AppDelegate.h"
#import "AppGain.h"

@interface AppDelegate ()

@end



#define SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

    [AppGain initializeAppWithID:@"5a805a51673b0f1b4d986bca" andApiKey:@"b47a061849d5e0104d692dff1544a235628d28e5b55345e57ff715e4b3a5c330"];
    
    
    if(SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(@"10.0")){
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        // center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error){
            if(!error){
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            }
        }];
    }
    else {
        
        UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes  categories:nil];
        [application registerUserNotificationSettings:settings];
        [application registerForRemoteNotifications];
        

        
               // Code for old versions
    }
    
    
  //  [self registerForRemoteNotifications];
    
    

    

    // native notification reciveing
  
    
    return YES;
}



-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{


    NSLog(@"%@", deviceToken);
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"content---%@", token);
   
    [AppGain RegisterDeviceWithToken:deviceToken];
    
}





//
//- (void)registerForRemoteNotifications {
//    if(SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(@"10.0")){
//        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
//       // center.delegate = self;
//        [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error){
//            if(!error){
//                [[UIApplication sharedApplication] registerForRemoteNotifications];
//            }
//        }];
//    }
//    else {
//    
//
//    
//        UIUserNotificationType types = UIUserNotificationTypeBadge |
//        UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
//        
//        UIUserNotificationSettings *mySettings =
//        [UIUserNotificationSettings settingsForTypes:types categories:nil];
//        
//        [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
//
//        // Code for old versions
//    }
//}






//// avilable for is 10
////Called when a notification is delivered to a foreground app.
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    NSLog(@"User Info : %@",notification.request.content.userInfo);
    completionHandler(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge);
    
}

//Called to let your app know which action was selected by the user for a given notification.
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler{
    NSLog(@"User Info : %@",response.notification.request.content.userInfo);
    completionHandler();
    
    [AppGain trackNotificationWithAction: [NotificationStatus Opened]    whenFinish:^(NSURLResponse *response, NSMutableDictionary *result) {
        
        
        
    }];
    NSLog(@"%@",response);
    
    NSLog(@"%@",center);
    
    
    
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    
  
    
    [AppGain handlePush:userInfo forApplication:application];
    
}






- (void)applicationWillResignActive:(UIApplication *)application {
  
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
