//
//  LandingTarget.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/15/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import "LandingButton.h"

@implementation LandingButton



@synthesize title = _title;
@synthesize type = _type;

@synthesize iosUrlTarget = _iosUrlTarget;
@synthesize androidUrlTarget = _androidUrlTarget;
@synthesize webUrlTarget = _webUrlTarget;


- (id)initWithTitle:(NSString *)title iosTarget:(NSString *)iosurlTarget andAndroid:(NSString *)androidUrlTarget andWeb:(NSString *)webUrlTarget{
    
    self = [super init];
    if(self) {
        _title = iosurlTarget;
        _type = @"basic.btn";
        _iosUrlTarget = iosurlTarget;
        _androidUrlTarget = androidUrlTarget;
        _webUrlTarget = webUrlTarget;
    }
    return self;

}


//
//{"type": "basic.btn",
//
//"text": "[input text ]”,  //button title
//"targets": {
//				"ios": “[url when click from iOS ]",
//				"android": "[input]",
//				"web": "[input]"
//}}
-(NSDictionary *)dictionaryValue{
    
    NSDictionary *details = @{@"type":_type,@"text":_title,@"targets":@{@"ios":_iosUrlTarget,@"android":_androidUrlTarget,@"web":_webUrlTarget}};
    
    
    return details;
    
}

@end
