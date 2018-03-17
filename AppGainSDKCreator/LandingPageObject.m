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
//    
//    {
//        "type": "basic.h+logo",
//        "logo": {
//            "src": "https://i.imgur.com/HwieXuR.jpg"
//        },
//        "header": {
//            "text": "test create landingpage"
//        }
//    },
    NSDictionary *details = @{@"type":@"basic.h+logo",@"logo":@{@"src":_LogoUrl},@"header":@{@"text":_header}};
    
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
    
    
    NSDictionary *details = @{@"type":@"basic.slider",@"slider":images,@"speed":@3000,@"direction":@"horizontal",@"autoplay":@4000};
    return details;
}

-(NSArray*)buttonsValues{
    
    // return first object only
   // return  [_Buttons.firstObject dictionaryValue];
    
    NSMutableArray *buttons = [NSMutableArray new];

    for (LandingButton *item in _Buttons) {
        
        
        [buttons addObject:item.dictionaryValue];
        
    }
    
    

    return buttons;
}

-(NSDictionary *)dictionaryValue{
    {
//        "lang": "en",
//        "web_push_subscription": true,
//        "components": [
//                       {
//                           "type": "basic.h+logo",
//                           "logo": {
//                               "src": "https://i.imgur.com/HwieXuR.jpg"
//                           },
//                           "header": {
//                               "text": "test create landingpage"
//                           }
//                       },
//                       {
//                           "type": "basic.p",
//                           "content": "this is a test for creating landingpage"
//                       },
//                       {
//                           "type": "basic.btn",
//                           "text": "test first button",
//                           "alt-text": "test first button",
//                           "targets": {
//                               "ios": "sms:01125840548&body=test%20creating",
//                               "android": "tel:01125840548",
//                               "web": "Openpopup://param?title=test%20landingpage%20popup&text=this%20is%20my%20test%20data%20to%20test%20popup"
//                           }
//                       },
//                       {
//                           "type": "basic.slider",
//                           "slider": [
//                                      {
//                                          "src": "https://i.imgur.com/JcLINOb.png",
//                                          "text": "first photo"
//                                      },
//                                      {
//                                          "src": "https://i.imgur.com/HwieXuR.jpg",
//                                          "text": "second photo"
//                                      },
//                                      {
//                                          "src": "https://i.imgur.com/01Ek82M.jpg",
//                                          "text": "third photo"
//                                      }
//                                      ],
//                           "speed": 3000,
//                           "direction": "horizontal",
//                           "autoplay": 4000
//                       }
//                       ],
//        "socialmedia_settings": {
//            "title": "test create",
//            "description": "test create landingpage",
//            "image": "https://i.imgur.com/HwieXuR.jpg"
//        },
//        "label": "testcreate",
//        "image_default": false
//    }
//    

        NSMutableArray * components = [NSMutableArray arrayWithObjects:self.headerPage,@{@"type":@"basic.p",@"content":_paragraph}, self.sliderValue, nil];
        
        
        [components addObjectsFromArray:[self buttonsValues]];
        
        
        
    NSDictionary *details = @{@"lang" :_lang,
                              @"web_push_subscription":@YES,
                              @"label":_label,
                              //@"slug"    :_slug,
                              @"image_default":@NO,
            @"components": components,
            @"socialmedia_settings":_socialSetting.dictionaryValue,
        };
        
        
        //[[NSMutableArray arrayWithObjects:@"", nil] ]
                              
    return details;


}
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
