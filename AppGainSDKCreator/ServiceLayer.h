//
//  ServiceLayer.h
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/13/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SdkKeys.h"
@interface ServiceLayer : NSObject

-(void)getRequestWithURL :(NSString*) url didFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete  ;
-(void)postRequestWithURL :(NSString*) url withBodyData :(NSMutableDictionary* ) dictionaryBody  didFinish:(void (^)(NSURLResponse*, NSMutableDictionary*))onComplete ;

@end
