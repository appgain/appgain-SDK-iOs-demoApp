//
//  LandingTarget.h
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/15/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LandingButton : NSObject


//      "targets": { "ios": “[input]", "android": “[input]", "web": "[input]"}
//
//"type": "basic.btn",
//
//"text": "[input text ]”,  //button title
//"targets": {
//				"ios": “[url when click from iOS ]",
//				"android": "[input]",
//				"web": "[input]"
//}


@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *iosUrlTarget;
@property (nonatomic, strong) NSString *androidUrlTarget;
@property (nonatomic, strong) NSString *webUrlTarget;

- (id)initWithTitle :(NSString*) title iosTarget:(NSString*)iosurlTarget andAndroid:(NSString*)androidUrlTarget andWeb: (NSString*)webUrlTarget ;
-(NSDictionary*)dictionaryValue;


@end
