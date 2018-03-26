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
    
    
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString: url]];
    
    
    UIWebView* webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSString* secretAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    
    //create the Method "GET"
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setAllHTTPHeaderFields: @{@"appApiKey": [[SdkKeys new] getAppApiKey] ,@"User-Agent": secretAgent}];
    
    
    //User-Agent
   // NSLog(@"   url get reguest %@",url);
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
            {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:FALSE];
                });
//                if (data != nil){
//                    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                    NSLog(@"json data for get request  : %@", jsonString);
//                    
//                }
                
                                          
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                NSMutableDictionary *responseDictionary;// = [NSMutableDictionary new];
                                          
                if( data != nil )
                {
                 NSError *parseError = nil;
                   // NSLog(@"%@",data);
                 responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
                    // NSLog(@"The response is - %@",responseDictionary);
                    }
                
                onComplete(response,responseDictionary);

                
                }];
    [dataTask resume];
    


}


-(void)postRequestWithURL:(NSString *)url withBodyData:(NSDictionary *)dictionaryBody didFinish:(void (^)(NSURLResponse *, NSMutableDictionary *))onComplete{
// show network indicator
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setAllHTTPHeaderFields: @{@"appApiKey": [[SdkKeys new] getAppApiKey],@"content-type": @"application/json"}];

    
//    NSLog(@"---- url sent r : %@", [dictionaryBody description]);
//
//    
//    NSLog(@"---- url sent r : %@", url);
    NSError *error;
    NSData *bodyData = [NSJSONSerialization dataWithJSONObject:dictionaryBody
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];

//    if (! bodyData) {
//        
//        NSLog(@"error parse data%@",error);
//
//    } else {
//        NSString *jsonString = [[NSString alloc] initWithData:bodyData encoding:NSUTF8StringEncoding];
//        NSLog(@"json data sent : %@", jsonString);
//
//    }
    
    
    [urlRequest setHTTPBody:bodyData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
        {
//            
//            if (! data) {
//                
//                
//            } else {
//                NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                NSLog(@"json data sent : %@", jsonString);
//                
//            }
            
            //hide network indecator 
            dispatch_async(dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:FALSE];
            });
            
            
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            NSMutableDictionary *responseDictionary;// = [NSMutableDictionary new];
            if(data != nil )
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
