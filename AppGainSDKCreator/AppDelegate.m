//
//  AppDelegate.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/12/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import "AppDelegate.h"
#import "Appgain.h"
#import <Crashlytics/Crashlytics.h>
#import <Fabric/Fabric.h>

@interface AppDelegate () <UIAlertViewDelegate>

@end



#define SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
@implementation AppDelegate

NSDictionary * tempUserInfo ;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

    [Fabric with:@[[Crashlytics class]]];

    //Ikhair test 5ad3a65b758ddf000ddd51c9
    // 73b89df614cb0d7a7ba645990d9822159c048332506dd4f60ed503463a8292df
    
    
    
    /// old test
    //  5a53f622e725ee001719ffd2
    //  08a19262a242a074b0cd2f143df75c8971f121af9c50a39fa9c32eb605dfc388
    
    
    [Appgain initializeAppWithID:@"5ad3a65b758ddf000ddd51c9" andApiKey:@"73b89df614cb0d7a7ba645990d9822159c048332506dd4f60ed503463a8292df" whenFinish:^(NSURLResponse *response, NSMutableDictionary *result) {
        //"smart_link_primary" = "firstflight://";
        // MARK: response for match link data
        
       
            NSLog(@"%@",result);
             NSLog(@"%@",response);
            
            
            
      

    }];
    

    
   //MARK: setting for push notification
    if(SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(@"10.0")){
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        // center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error){
            if(!error){
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[UIApplication sharedApplication] registerForRemoteNotifications];
                });
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
 
    return YES;
}





- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([[[url absoluteString] lowercaseString] containsString:@"ikhair"]) {
     
        return YES;
    }
    return YES;

}



-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
   return YES;

}






- (void)registerApplicationForPushNotifications:(UIApplication *)application
{
    // Set up push notifications
    // For more information about Push, check out:
    // https://developer.layer.com/docs/ios/guides#push-notification
    
    // Checking if app is running iOS 8
    if ([application respondsToSelector:@selector(registerForRemoteNotifications)]) {
        // Register device for iOS8
        UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
        [application registerUserNotificationSettings:notificationSettings];
        [application registerForRemoteNotifications];
    } else {
        // Register device for iOS7
        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeBadge];
    }
    
}




-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{


    NSLog(@"%@", deviceToken);
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"content---%@", token);
   
    [Appgain RegisterDeviceWithToken:deviceToken];
    
}




//// avilable for is 10
////Called when a notification is delivered to a foreground app.
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    NSLog(@"User Info : %@",notification.request.content.userInfo);
    completionHandler(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge);
    
    tempUserInfo = notification.request.content.userInfo;
   
    
    [Appgain trackNotificationWithAction:[NotificationStatus Opened] andUserInfo:tempUserInfo whenFinish:^(NSURLResponse *respone, NSMutableDictionary *result) {
        
        
    }];
    
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:nil message:[[tempUserInfo objectForKey:@"aps"] objectForKey:@"alert"] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Open", nil];
    [alert show];
    
}




//Called to let your app know which action was selected by the user for a given notification.


// system push notifications callback, delegate to pushManager
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler{
    tempUserInfo = userInfo;
    
    [Appgain handlePush:userInfo forApplication:application];
//    [[[UIAlertView alloc] initWithTitle:@"Alert" message: [[userInfo objectForKey:@"aps"] objectForKey:@"alert"] delegate:NULL cancelButtonTitle:@"Dismis" otherButtonTitles:NULL, nil] show];
//    

    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:nil message:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Open", nil];
    [alert show];
    
}





-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    
    NSLog(@"User Info : %@",userInfo);
    
    tempUserInfo = userInfo;
    [Appgain handlePush:userInfo forApplication:application];
//    
//    [[[UIAlertView alloc] initWithTitle:@"Alert" message: [[userInfo objectForKey:@"aps"] objectForKey:@"alert"]delegate:NULL cancelButtonTitle:@"Dismis" otherButtonTitles:NULL, nil] show];
//    
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:nil message:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Open", nil];
    [alert show];
    
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

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        
        
        
        [Appgain trackNotificationWithAction:[NotificationStatus Conversion] andUserInfo:tempUserInfo whenFinish:^(NSURLResponse *respone, NSMutableDictionary *result) {
            
            
        }];
        
    }
}



@end
