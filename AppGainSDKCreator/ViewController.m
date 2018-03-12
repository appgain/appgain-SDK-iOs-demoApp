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
    
  //MARK: create smart link
    /////////create smart linkObject

  
    TargetPlatform *web = [[TargetPlatform new] initWithPrimary:@"https://techcrunch.com/" withFallBack:@""];
    
    TargetPlatform *android = [[TargetPlatform new] initWithPrimary:@"sms:01125840548&body=test%20creating" withFallBack:@"tel:01125840548"];
   TargetPlatform *ios =   [[TargetPlatform new] initWithPrimary:@ "sms:01125840548&body=test%20creating" withFallBack: @"tel:01125840548"];
    
    
    
    SmartLinkObject *ffff = [[SmartLinkObject new] initWithHeader:@"hello" andImage:@"https://i.imgur.com/HwieXuR.jpg" andDescription:@"welcome to test description" andName:@"ragaie" iosTarget:ios androidTarget:android webTarget:web];
    
    [ffff setSlug:@"jjjjjj"];
    
    
   // NSLog(@"%@", ffff.dictionaryValue);
    
    
    ////------>
    [AppGain CreateSmartLinkWithObject:ffff whenFinish:^(NSURLResponse * response, NSMutableDictionary * result) {
        
        
        NSLog(@"%@",response);
        
        NSLog(@"%@",result);
        
        
}];
    
    
    [AppGain CreateLinkMactcherWithUserID:@"" whenFinish:^(NSURLResponse *response, NSMutableDictionary *result) {
        NSLog(@"%@",response);
        
        NSLog(@"%@",result);
        
        
    }];
    
  
    //MARK: create Landing page 

   /// create array of your image slider
    //if you want create single page you can send only one image
    NSArray *imagesUrl = [NSArray arrayWithObjects:@"https://i.imgur.com/JcLINOb.png",@"https://i.imgur.com/HwieXuR.jpg",@"https://i.imgur.com/01Ek82M.jpg", nil];
   
    
    //create button that you want to apper
    LandingButton *button1 = [[LandingButton alloc] initWithTitle:@"test First" iosTarget:@"sms:01125840548&body=test%20creating" andAndroid:@"tel:01125840548" andWeb:@"Openpopup://param?title=test%20landingpage%20popup&text=this%20is%20my%20test%20data%20to%20test%20popup"];
    
   //create social media butons with it is target
    SocialmediaSettings *socialMediaSetting = [[SocialmediaSettings alloc] initWithTitle:@"appGain" andDescription:@"welcome to test data" andImage:@"https://i.imgur.com/HwieXuR.jpg"];
    
    // create landing page object
    LandingPageObject *tempLandingPage = [[LandingPageObject alloc] initWithLogo:@"https://i.imgur.com/HwieXuR.jpg" andHeader:@"test create landingpage" andParagraph:@"this is a test for creating landingpage" withSliderUrlImages:imagesUrl andButtons:[NSArray arrayWithObjects:button1 , nil] andSocialMediaSetting:socialMediaSetting language:@"en" andSubscription:@"welcome" andimage:@"" andlabel:@"asdasklads"];
    
    
    ///sdk method
    [AppGain createLandingPageWithObject:tempLandingPage whenFinish:^(NSURLResponse *response, NSMutableDictionary *result) {
        
        NSLog(@"%@",response);
        
        NSLog(@"%@",result);
        
        
    }];
    
   
    //MARK:create for point
    
    [AppGain CreateAutomatorWithTrigger:@"" andUserId:@"" whenFinish:^(NSURLResponse * response, NSMutableDictionary *result) {
        
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
