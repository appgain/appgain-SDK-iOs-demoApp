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
    
    /////////create smart linkObject
    SmartLinkObject *ffff = [[SmartLinkObject new] initWithHeader:@"hello" andImage:@"http://xvxc.xcvxc.cxvx" andDescription:@"welcome to my hotel" andName:@"ragaie"];
    
    [ffff setSlug:@"jjjjjj"];
    [ffff setIosPlatform:[[TargetPlatform new] initWithPrimary:@"iiiiiiooooosss" withFallBack:@"iiii"]];
    
    [ffff setAndroidPlatform:[[TargetPlatform new] initWithPrimary:@"android" withFallBack:@"aaaaaa"]];
    [ffff setWebPlatform: [[TargetPlatform new] initWithPrimary:@"asdas" withFallBack:@"ffffff"]];
    
   // NSLog(@"%@", ffff.dictionaryValue);
    
    
    ////------>
    [AppGainTracker CreateSmartLinkWithObject:ffff whenFinish:^(NSURLResponse * response, NSMutableDictionary * result) {
        
    }];
   
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
