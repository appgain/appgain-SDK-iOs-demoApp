//
//  ViewController.m
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/12/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
  
    TargetPlatform *web = [[TargetPlatform new] initWithPrimary:@"https://techcrunch.com/" withFallBack:@""];
    
    TargetPlatform *android = [[TargetPlatform new] initWithPrimary:@"sms:01125840548&body=test%20creating" withFallBack:@"tel:01125840548"];
   TargetPlatform *ios =   [[TargetPlatform new] initWithPrimary:@ "sms:01125840548&body=test%20creating" withFallBack: @"tel:01125840548"];
    
    
    
    /////////create smart linkObject
    SmartLinkObject *ffff = [[SmartLinkObject new] initWithHeader:@"hello" andImage:@"https://i.imgur.com/HwieXuR.jpg" andDescription:@"welcome to test description" andName:@"ragaie" iosTarget:ios androidTarget:android webTarget:web];
    
    [ffff setSlug:@"jjjjjj"];
    
    
   // NSLog(@"%@", ffff.dictionaryValue);
    
    
    ////------>
    [AppGain CreateSmartLinkWithObject:ffff whenFinish:^(NSURLResponse * response, NSMutableDictionary * result) {
        
        
        NSLog(@"%@",response);
        
        NSLog(@"%@",result);
        
        
}];
   
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
