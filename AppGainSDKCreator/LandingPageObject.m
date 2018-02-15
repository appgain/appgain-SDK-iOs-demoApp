//
//  LandingPageObject.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/15/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import "LandingPageObject.h"

@implementation LandingPageObject



@synthesize lang = _lang;
@synthesize web_push_subscription = _web_push_subscription;
@synthesize image_default = _image_default;
@synthesize label = _label;

@synthesize slug = _slug;

@synthesize socialSetting = _socialSetting;
@synthesize pageTarget  = _pageTarget;

-(LandingPageObject *)initWithLanguage:(NSString *)lang andSubscription:(NSString *)sub andimage:(NSString *)image andlabel:(NSString *)label{

    self = [super init];
    if(self) {
        _lang = lang;
        _web_push_subscription = sub;
        _image_default = image;
        _label = label;
        _slug = @"";
    }
    return self;


}


-(NSDictionary *)dictionaryValue{

    NSDictionary *details = @{@"lang" :_lang,@"web_push_subscription":@"true",@"label":_label,@"slug":_slug,@"image_default":@"false",
//"socialmedia_settings": { "title": “[input]", "description":    	"[input]","image": "[input]"
                              //                       },
                              @"socialmedia_settings":@{@"title":_socialSetting.title,@"description":_socialSetting.description,@"image":_socialSetting.image},
// "targets": { "ios": “[input]", "android": “[input]", "web": "[input]"}
                              @"targets":@{@"ios": _pageTarget.ios,@"android":_pageTarget.android,@"web":_pageTarget.web}
                              
                              
                              
                              };
                              
                              
    return details;


}
//{
//    "lang": "en",
//    "web_push_subscription": true,
//    "components": [
//                   { "type": “basic.h+logo", "logo": { "src": “[Array of what]” },"header": 			{ "text": "Product Name “ }
//                   },
//                   { "type": "basic.p", "content": "[input] "},
//                   { "type": "basic.btn","text": "[input]", "alt-text":"[input]",
//                       "targets": { "ios": “[input]", "android": “[input]", "web": "[input]"}
//                   },
//                   {  "type": “basic.slider", "slider": [
//                       {  "src": “[input]" }, { "src": "[input]"},{"src": "[input]"} ],
//                           "speed": 3000,
//                           "direction": "horizontal",
//                           "autoplay": 4000
//                       } ],
//                       
//                       
//                       "socialmedia_settings": { "title": “[input]", "description":    	"[input]","image": "[input]"
//                       },
//                       "label": "[input]",
//                       "image_default":false,
//                       "slug":"[input]"-->Optional
//}’


@end
