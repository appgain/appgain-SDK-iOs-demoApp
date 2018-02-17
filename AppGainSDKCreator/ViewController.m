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
    
  
    TargetPlatform *web = [[TargetPlatform new] initWithPrimary:@"iiiiiiooooosss" withFallBack:@""];
    
    TargetPlatform *android = [[TargetPlatform new] initWithPrimary:@"android" withFallBack:@"aaaaaa"];
   TargetPlatform *ios =   [[TargetPlatform new] initWithPrimary:@"asdas" withFallBack:@"ffffff"];
    
    
    
    /////////create smart linkObject
    SmartLinkObject *ffff = [[SmartLinkObject new] initWithHeader:@"hello" andImage:@"http://xvxc.xcvxc.cxvx" andDescription:@"welcome to my hotel" andName:@"ragaie" iosTarget:ios androidTarget:android webTarget:web];
    
    [ffff setSlug:@"jjjjjj"];
    
    
   // NSLog(@"%@", ffff.dictionaryValue);
    
    
    ////------>
    [AppGain CreateSmartLinkWithObject:ffff whenFinish:^(NSURLResponse * response, NSMutableDictionary * result) {
        
    }];
   
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
