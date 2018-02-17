//
//  SocialmediaSettings.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/15/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import "SocialmediaSettings.h"

@implementation SocialmediaSettings

@synthesize title = _title;
@synthesize mediaDescription = _mediaDescription;
@synthesize image = _image;



-(id)initWithTitle:(NSString *)title andDescription:(NSString *)description andImage:(NSString *)image{
    self = [super init];
    if(self) {
        _title = title;
        _mediaDescription = description;
        _image = image;
    }
    return self;

    
    
    
}

-(NSDictionary *)dictionaryValue{
//    "socialmedia_settings": { // represent all data that will show in social media
//        "title": "[input]",
//        "description": "[input]",
//        "image": “[input]"
//    },
    
    NSDictionary *details = @{@"title":_title,@"description":_mediaDescription,@"image":_image};
    
    
    return details;
    
}

@end
