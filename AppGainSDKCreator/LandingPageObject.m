//
//  LandingPageObject.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/15/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import "LandingPageObject.h"

@implementation LandingPageObject


@synthesize LogoUrl = _LogoUrl;
@synthesize header = _header;
@synthesize paragraph = _paragraph;
//slider images
@synthesize sliderImages = _sliderImages;
//arry of buttons
@synthesize Buttons = _Buttons;
@synthesize socialSetting = _socialSetting;


@synthesize lang = _lang;
@synthesize web_push_subscription = _web_push_subscription;
@synthesize image_default = _image_default;
@synthesize label = _label;

@synthesize slug = _slug;



-(LandingPageObject *)initWithLogo:(NSString *)logoUrl andHeader:(NSString *)header andParagraph:(NSString *)paragraph withSliderUrlImages:(NSArray *)images andButtons:(NSArray *)buttons andSocialMediaSetting:(SocialmediaSettings *)mediaSetting language:(NSString *)lang andSubscription:(NSString *)sub andimage:(NSString *)image andlabel:(NSString *)label{

    
    self = [super init];
    if(self) {
        _LogoUrl = logoUrl;
        _header = header;
        _paragraph = paragraph;
        _sliderImages = images;
        _Buttons = buttons;
        _socialSetting = mediaSetting;
        _lang = lang;
        _web_push_subscription = sub;
        _image_default = image;
        _label = label;
        _slug = @"";
    }
    return self;


}

-(NSDictionary*)headerPage{
    
    //                       ///
    //                       "type": "basic.h+logo",
    //                       "logo": {
    //                           "src": "[input. Image url ]},
    //                           "header": {
    //                               "text": "[input ]"
    //                           }
    //                       },
    //
    //                       { ////prgraphe data
    //                           "type": "basic.p",
    //                           "content": "[input text ] "
    //                       },
    
    NSDictionary *details = @{@"type":@"basic.h+logo",@"logo":@{@"src":_LogoUrl,@"header":@{@"text":_header}}};
    
    return details;
    
}


-(NSDictionary* )sliderValue{
    
    //    {
    //        "type": "basic.slider",
    //        "slider": [
    //                   {
    //                       "src": “[image url ]"
    //                   },
    //                   {
    //                       "src": "[input]"
    //                   },
    //                   {
    //                       "src": "[input]"
    //                   }
    //                   ],
    //        "speed": 3000,
    //        "direction": "horizontal",
    //        "autoplay": 4000
    //    }
    
    NSMutableArray *images = [NSMutableArray new];
    for (NSString *item in _sliderImages) {
        NSLog(@"%@", item);
        
        [images addObject:@{@"src":item}];
        
        
    }
    
    
    NSDictionary *details = @{@"type":@"basic.slider",@"slider":images,@"speed":@"3000",@"direction":@"horizontal",@"autoplay":@"4000"};
    return details;
}

-(NSDictionary*)buttonsValues{
    NSMutableArray *buttons = [NSMutableArray new];
    for (LandingButton *item in _Buttons) {
        
        
        [buttons addObject:item.dictionaryValue];
        
    }
    
    
    //    {
    //        "type": "basic.btn",
    //
    //        "text": "[input text ]”,  //button title
    //        "targets": {
    //            "ios": “[url when click from iOS ]",
    //            "android": "[input]",
    //            "web": "[input]"
    //        }
    //    }
    
    NSDictionary *details = @{};
    return details;
}

-(NSDictionary *)dictionaryValue{
//    "components": [
//                   {
//                       ///
//                       "type": "basic.h+logo",
//                       "logo": {
//                           "src": "[input. Image url ]},
//                           "header": {
//                               "text": "[input ]"
//                           }
//                       },
//                       
//                       { ////prgraphe data
//                           "type": "basic.p",
//                           "content": "[input text ] "
//                       },
//                       
//                       ////———————————————————————————— this for button maybe more than button—>>> Done
//                       {
//                           "type": "basic.btn",
//                           "text": "[input text ]”,  //button title 
//                           "targets": { 
//                               "ios": “[url when click from iOS ]",
//                               "android": "[input]",
//                               "web": "[input]"
//                           }
//                       },

    NSDictionary *details = @{@"lang" :_lang,@"web_push_subscription":@"true",@"label":_label,@"slug"    :_slug,@"image_default":@"false",
            @"components":
                    @[self.headerPage,@{@"type":@"basic.p",@"content":_paragraph},self.sliderValue,self.buttonsValues],

            @"socialmedia_settings":_socialSetting.dictionaryValue,
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
