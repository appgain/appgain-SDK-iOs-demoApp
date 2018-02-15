//
//  ServiceLayer.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/13/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import "ServiceLayer.h"

@implementation ServiceLayer


-(void)getRequestWithURL:(NSString *)url didFinish:(void (^)(NSURLResponse *, NSMutableDictionary *))onComplete{

    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    //create the Method "GET"
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setAllHTTPHeaderFields: @{@"appApiKey": [[SdkKeys new] getAppID]}];
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
            {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:FALSE];
                                          
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                NSMutableDictionary *responseDictionary;// = [NSMutableDictionary new];
                                          
                if(httpResponse.statusCode == 200)
                {
                 NSError *parseError = nil;
                 responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
                    // NSLog(@"The response is - %@",responseDictionary);
                    }
                
                onComplete(response,responseDictionary);

                
                }];
    [dataTask resume];
    


}
-(void)postRequestWithURL:(NSString *)url withBodyData:(NSMutableDictionary *)dictionaryBody didFinish:(void (^)(NSURLResponse *, NSMutableDictionary *))onComplete{
// show network indicator
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    //create the Method "GET"
    [urlRequest setHTTPMethod:@"POST"];
    // --header 'appApiKey: <appApiKey>’, 'content-type: application/json'

    [urlRequest setAllHTTPHeaderFields: @{@"appApiKey": [[SdkKeys new] getAppID],@"content-type": @"application/json"}];
    //convert body dictionary to nsdata
    NSData* bodyData =  [NSKeyedArchiver archivedDataWithRootObject:dictionaryBody];
    [urlRequest setHTTPBody:bodyData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
        {
            //hide network indecator 
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:FALSE];
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            NSMutableDictionary *responseDictionary;// = [NSMutableDictionary new];
            if(httpResponse.statusCode == 200)
            {
                NSError *parseError = nil;
                responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
                    // NSLog(@"The response is - %@",responseDictionary);
                    }
                    onComplete(response,responseDictionary);
                    }];
    [dataTask resume];
    


}

@end
