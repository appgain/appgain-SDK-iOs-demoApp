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

-(SmartLinkObject *)initWithHeader:(NSString *)header andImage:(NSString *)imageUrl andDescription:(NSString *)description andName:(NSString *)name iosTarget:(TargetPlatform *)ios androidTarget:(TargetPlatform *)android webTarget:(TargetPlatform *)web{


    self = [super init];
    if(self) {
        _header = header;
        _imageUrl = imageUrl;
        _linkDescription = description;
        _linkName = name;
        _iosPlatform = ios;
        _androidPlatform = android;
        _webPlatform = web;
        _slug = @"";
    }
    return self;

}

//MARK:Create Dictionary value for object
-(NSDictionary *)dictionaryValue{
 
    NSDictionary *details = @{@"name" :_linkName,
                             // @"slug":_slug,
                              @"image":_imageUrl,
                              @"description":_linkDescription,
                              @"launch_page":@{@"header":_header},
            @"targates":
                    @{@"ios":
                      @{@"primary":_iosPlatform.primary,@"fallback":_iosPlatform.fallback},
                      @"android":@{@"primary":_androidPlatform.primary,@"fallback":_androidPlatform.fallback},
                      @"web":_webPlatform.primary
                      
                      }//end target
                              }; //end of all dictionary

    return details;
}

@end
