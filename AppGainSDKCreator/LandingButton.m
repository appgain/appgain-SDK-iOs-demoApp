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
        _title = title;
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
    
    
//    
//    {
//        "type": "basic.btn",
//        "text": "test first button",
//        "alt-text": "test first button",
//        "targets": {
//            "ios": "sms:01125840548&body=test%20creating",
//            "android": "tel:01125840548",
//            "web": "Openpopup://param?title=test%20landingpage%20popup&text=this%20is%20my%20test%20data%20to%20test%20popup"
//        }
//    },
    
    NSDictionary *details = @{@"type":_type,@"text":_title,@"targets":@{@"ios":_iosUrlTarget,@"android":_androidUrlTarget,@"web":_webUrlTarget}};
    
    
    return details;
    
}

@end
