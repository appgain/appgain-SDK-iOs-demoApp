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


//smart link result

//{
//    "extra_data" =     {
//        userId = aOA0Dp6d8e;
//    };
//    "smart_link_primary" = "appgain://deeplink";
//}




- (void)viewDidLoad {
    [super viewDidLoad];
    

  
    
    // Do any additional setup after loading the view, typically from a nib.
}


//MARK: create smart link
/////////create smart linkObject


- (IBAction)createSmartLink:(id)sender {
 
    
    TargetPlatform *web = [[TargetPlatform new] initWithPrimary:@"https://techcrunch.com/" withFallBack:@""];
    
    TargetPlatform *android = [[TargetPlatform new] initWithPrimary:@"sms:01125840548&body=test%20creating" withFallBack:@"tel:01125840548"];
    TargetPlatform *ios =   [[TargetPlatform new] initWithPrimary:@ "sms:01125840548&body=test%20creating" withFallBack: @"tel:01125840548"];
    
    
    
    SmartLinkObject *ffff = [[SmartLinkObject new] initWithHeader:@"hello" andImage:@"https://i.imgur.com/HwieXuR.jpg" andDescription:@"welcome to test description" andName:@"ragaie" iosTarget:ios androidTarget:android webTarget:web];
    
    [ffff setSlug:@"jjjjjj"];
    
    
    // NSLog(@"%@", ffff.dictionaryValue);
    
    
    ////------>
    
    [_loadingView setHidden:NO];
        [AppGain CreateSmartLinkWithObject:ffff whenFinish:^(NSURLResponse * response, NSMutableDictionary * result) {
 
        if( [result objectForKey:@"smartlink"] != NULL){
                
            UIAlertController * alert=[UIAlertController alertControllerWithTitle:@"successfully created" message: [result objectForKey:@"smartlink"] preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* yesButton = [UIAlertAction actionWithTitle:@"Open"
                                                                    style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                    {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [result objectForKey:@"smartlink"]]];
                                                
                    }];
                
                UIAlertAction* noButton = [UIAlertAction actionWithTitle:@"No, thanks"
                                                                   style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                {
                                               
                                               
                [alert dismissViewControllerAnimated:true completion:nil];
                                           }];
                
                [alert addAction:yesButton];
                [alert addAction:noButton];
                
                [self presentViewController:alert animated:YES completion:nil];
        
            }
            
            
            
            
            [_loadingView setHidden:YES];

            
    }];
}
- (IBAction)createLandingPage:(id)sender {
    
    
    
    //MARK: create Landing page
    
    /// create array of your image slider
    //if you want create single page you can send only one image
    NSArray *imagesUrl = [NSArray arrayWithObjects:@"https://i.imgur.com/JcLINOb.png",@"https://i.imgur.com/HwieXuR.jpg",@"https://i.imgur.com/01Ek82M.jpg", nil];
    
    
    //create button that you want to apper
    LandingButton *button1 = [[LandingButton alloc] initWithTitle:@"test First" iosTarget:@"sms:01125840548&body=test%20creating" andAndroid:@"tel:01125840548" andWeb:@"Openpopup://param?title=test%20landingpage%20popup&text=this%20is%20my%20test%20data%20to%20test%20popup"];
    
    //create social media butons with it is target
    SocialmediaSettings *socialMediaSetting = [[SocialmediaSettings alloc] initWithTitle:@"appGain" andDescription:@"welcome to test data" andImage:@"https://i.imgur.com/HwieXuR.jpg"];
    
    // create landing page object
    LandingPageObject *tempLandingPage = [[LandingPageObject alloc] initWithLogo:@"https://i.imgur.com/HwieXuR.jpg" andHeader:@"test create landingpage" andParagraph:@"this is a test for creating landingpage" withSliderUrlImages:imagesUrl andButtons: [NSArray arrayWithObjects: button1,nil] andSocialMediaSetting:socialMediaSetting language:@"en" andSubscription:@"welcome" andimage:@"" andlabel:@"asdasklads"];
    
    
   // /sdk method
    [_loadingView setHidden:NO];

        [AppGain createLandingPageWithObject:tempLandingPage whenFinish:^(NSURLResponse *response, NSMutableDictionary *result) {
//    
//            NSLog(@"%@",response);
//    
//            NSLog(@"%@",result);
//            
            
           if( [result objectForKey:@"link"] != NULL){
            
               UIAlertController * alert=[UIAlertController alertControllerWithTitle:@"successfully created" message: [result objectForKey:@"link"] preferredStyle:UIAlertControllerStyleAlert];
               
               UIAlertAction* yesButton = [UIAlertAction actionWithTitle:@"Open"
                    style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
               {
                   [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [result objectForKey:@"link"]]];

               }];
               
               UIAlertAction* noButton = [UIAlertAction actionWithTitle:@"No, thanks"
                style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
               {
                  
                   
                   [alert dismissViewControllerAnimated:true completion:nil];
               }];
               
               [alert addAction:yesButton];
               [alert addAction:noButton];
               
               [self presentViewController:alert animated:YES completion:nil];
               
               
               
               
            }
            
//            
//            {
//                link = "https://frstflight.appgain.io/ml/F17uP";
//                message = "successfully created";
//                status = success;
//            }
    
            [_loadingView setHidden:YES];

        }];
    

    
}

- (IBAction)createAutomater:(id)sender {
    

//MARK:create automater with trigger for point
    [_loadingView setHidden:NO];

    [AppGain CreateAutomatorWithTrigger:@"productview" andUserId:@"44" whenFinish:^(NSURLResponse * response, NSMutableDictionary *result) {
        
       
        [[[UIAlertView alloc] initWithTitle:@"Alert" message: @"Create Automater is done " delegate:NULL cancelButtonTitle:@"Dismis" otherButtonTitles:NULL, nil] show];
        
        [_loadingView setHidden:YES];

    }];
}
- (IBAction)tracknotification:(id)sender {
    
   
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)APPGainHomePage:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://www.appgain.io"]];

    
}

@end
