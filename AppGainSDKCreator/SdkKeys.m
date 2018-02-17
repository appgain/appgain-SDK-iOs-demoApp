//
//  SdkKeys.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/12/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import "SdkKeys.h"

@implementation SdkKeys

//appApiKey   <—- that will create from your account in server side .
//Response AppID
//AppSubDomainName
//Parse-AppID
//AppSubDomainName
//appApiKey
//parse-serverUrl
//parse-masterKey
//

//appApiKey
-(NSString*) getAppApiKey{
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *theKey = [defaults stringForKey:@"appApiKey"];
    if (theKey == NULL ){
        return @"";
    }
    return theKey;
    
}
-(void) setAppApiKey :(NSString*)  key{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:key forKey:@"appApiKey"];
    [defaults synchronize];
}
//AppID
-(NSString*) getAppID{
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *theKey = [defaults stringForKey:@"AppID"];
    if (theKey == NULL ){
        return @"";
    }
    return theKey;
    
}
-(void) setAppID :(NSString*)  key{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:key forKey:@"AppID"];
    [defaults synchronize];
}

//AppSubDomainName
-(NSString*) getAppSubDomainName{
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *theKey = [defaults stringForKey:@"AppSubDomainName"];
    if (theKey == NULL ){
        return @"";
    }
    return theKey;
    
}

-(void) setAppSubDomainName :(NSString*)  key{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:key forKey:@"AppSubDomainName"];
    [defaults synchronize];
}

//Parse-AppID
-(NSString*) getParseAppID{
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *theKey = [defaults stringForKey:@"Parse-AppID"];
    if (theKey == NULL ){
        return @"";
    }
    return theKey;
    
}
-(void) setParseAppID :(NSString*)  key{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:key forKey:@"Parse-AppID"];
    [defaults synchronize];
}


//parse-serverUrl
-(NSString*) getParseServerUrl{
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *theKey = [defaults stringForKey:@"parse-serverUrl"];
    if (theKey == NULL ){
        return @"";
    }
    return theKey;
    
}
-(void) setParseServerUrl :(NSString*)  key{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:key forKey:@"parse-serverUrl"];
    [defaults synchronize];
}

//parse-masterKey
-(NSString*) getParseMasterKey{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *theKey = [defaults stringForKey:@"parse-masterKey"];
    
    
    if (theKey == NULL ){
        return @"";
    }
    return theKey;
    
}
-(void) setParseMasterKey :(NSString*)  key{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue: key forKey:@"parse-masterKey"];
    [defaults synchronize];
}

///in first time will be null so return true and set first run false
-(NSString *)getFirstRun{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *theKey = [defaults stringForKey:@"firstRunApp"];
    
    
    if (theKey == NULL ){
        
        [self setFirstRun:@"false"];
        return @"true";
    }
    return theKey;
}


-(void)setFirstRun:(NSString *)key{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:key forKey:@"firstRunApp"];
    [defaults synchronize];
}




///userID in parser server

-(NSString *)getParserUserID{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *theKey = [defaults stringForKey:@"userParserID"];
    
    
    if (theKey == NULL ){
        return @"";
    }
    return theKey;
}


-(void)setParserUserID:(NSString *)key{
    
    

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:key forKey:@"userParserID"];
    [defaults synchronize];
}

-(NSString *)getDeviceUDID{


        return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}


@end
