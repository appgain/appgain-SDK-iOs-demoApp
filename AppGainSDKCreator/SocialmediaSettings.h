//
//  SocialmediaSettings.h
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/15/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocialmediaSettings : NSObject

//      "socialmedia_settings": { "title": “[input]", "description":    	"[input]","image": "[input]"
//                       },

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *mediaDescription;
@property (nonatomic, strong) NSString *image;

- (id)initWithTitle:(NSString*)title andDescription:(NSString*)description andImage : (NSString*)image ;

-(NSDictionary *)dictionaryValue;
@end
