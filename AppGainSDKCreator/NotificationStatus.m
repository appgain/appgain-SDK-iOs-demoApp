//
//  NotificationStatus.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 3/13/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import "NotificationStatus.h"

@implementation NotificationStatus

//    message = "request JSON is invalid, 'Received' is not one of ['open', 'received', 'conversion'] ``";

+(NSString *)Received{

return @"received";
}

+(NSString *)Opened{
 return @"open";
    
}

+(NSString *)Conversion{

return @"conversion";
}
@end
