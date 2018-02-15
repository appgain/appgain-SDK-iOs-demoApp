//
//  LaunchPage.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/13/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//
#import "SmartLinkObject.h"




@implementation SmartLinkObject

@synthesize header = _header;


@synthesize imageUrl = _imageUrl;
@synthesize linkDescription = _linkDescription;
@synthesize linkName = _linkName;
@synthesize iosPlatform = _iosPlatform;
@synthesize androidPlatform = _androidPlatform;
@synthesize webPlatform = _webPlatform;
@synthesize slug = _slug;

-(SmartLinkObject *)initWithHeader:(NSString *)header andImage:(NSString *)imageUrl andDescription:(NSString *)description andName:(NSString *)name{


    self = [super init];
    if(self) {
        _header = header;
        _imageUrl = imageUrl;
        _linkDescription = description;
        _linkName = name;
        _slug = @"";
    }
    return self;

}


-(NSDictionary *)dictionaryValue{
//
//    "description": "<INPUT>",
//    "name": "<INPUT>",
//    "targates": {
//        "android": { "primary": “<INPUT>",  "fallback": “<INPUT>" },
//        —need example for every input or it is
//            "web": "<INPUT>",
//            "ios": {  "primary": “<INPUT>”,   "fallback": “<INPUT>”  }
//    },
//    "slug": "<INPUT>",       ———optional
//    "launch_page": { “header": "Please Wait…" },
//        "image": "Product Image URL"
//
    
    NSDictionary *details = @{@"name" :_linkName,
                              @"slug":_slug,
                              @"image":_imageUrl,
                              @"description":_linkDescription,
                              @"launch_page":@{@"header":_header},
            @"targetes":
                    @{@"ios":
                          @{@"primary":_iosPlatform.primary,@"fallback":_iosPlatform.fallback},
                      @"android":@{@"primary":_androidPlatform.primary,@"fallback":_androidPlatform.fallback},
                      @"web":@{@"primary":_webPlatform.primary,@"fallback":_webPlatform.fallback}
                      
                      }//end target
                              }; //end of all dictionary

  


    return details;
}

@end
