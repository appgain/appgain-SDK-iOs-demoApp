//
//  SdkKeys.h
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/12/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

//appApiKey   <—- that will create from your account in server side .

//AppID
//AppSubDomainName
//Parse-AppID
//AppSubDomainName
//appApiKey
//parse-serverUrl
//parse-masterKey
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SdkKeys : NSObject
//appApiKey
-(NSString*) getAppApiKey;
-(void) setAppApiKey :(NSString*)  key;
//AppID
-(NSString*) getAppID;
-(void) setAppID :(NSString*)  key;

//AppSubDomainName
-(NSString*) getAppSubDomainName;
-(void) setAppSubDomainName :(NSString*)  key;

//Parse-AppID
-(NSString*) getParseAppID;
-(void) setParseAppID :(NSString*)  key;


//parse-serverUrl
-(NSString*) getParseServerUrl;
-(void) setParseServerUrl :(NSString*)  key;

//parse-masterKey
-(NSString*) getParseMasterKey;
-(void) setParseMasterKey :(NSString*)  key;

//first run

-(NSString*) getFirstRun;
-(void) setFirstRun :(NSString*)  key;


//UDID value

-(NSString*) getDeviceUDID;


@end
