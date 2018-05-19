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
    
    [self sentMatchLink];
    
    // Do any additional setup after loading the view, typically from a nib.
}



-(void)viewDidAppear:(BOOL)animated{
    
    
    [super viewDidAppear:YES];
    
    
    
    [Appgain CreateLinkMactcherWithUserID:@""
                               whenFinish:^(NSURLResponse *response, NSMutableDictionary *result) {
        if ([result objectForKey:@"smart_link_primary"]){
            
            NSString* targetURL = [result objectForKey:@"smart_link_primary"]; //2
            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:targetURL]];
        }
        
    }];
   
 
}

- (IBAction)showCurrentUserID:(id)sender {
    
     [self.userIdLabel setText:   [Appgain getUserID]];

    
}




-(void)sentMatchLink{
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString: @"https://frstflight.appgain.io/smartlinks/test/match"]];
    UIWebView* webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSString* secretAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    
    //create the Method "GET"
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setAllHTTPHeaderFields: @{@"User-Agent": secretAgent}];
    
    //User-Agent
    // NSLog(@"   url get reguest %@",url);
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
      
              dispatch_async(dispatch_get_main_queue(), ^{
                      [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:FALSE];
                      });
     
          NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
          NSMutableDictionary *responseDictionary;// = [NSMutableDictionary new];
                                          
          if( data != nil )
                  {
              NSError *parseError = nil;
                                              // NSLog(@"%@",data);
              responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
              // NSLog(@"The response is - %@",responseDictionary);
                      
                      dispatch_async(dispatch_get_main_queue(), ^{
                          [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:FALSE];
                          [_matchResultData setText:[responseDictionary description] ];

                      });
                      
                      }
                                         
                                          
      }];
    [dataTask resume];
    
    
    
}



//MARK: create smart link
/////////create smart linkObject


- (IBAction)createSmartLink:(id)sender {
 
    
    TargetPlatform *web = [[TargetPlatform new] initWithPrimary:@"https://techcrunch.com/" withFallBack:@""];
    
    TargetPlatform *android = [[TargetPlatform new] initWithPrimary:@"sms:01125840548&body=test%20creating" withFallBack:@"tel:01125840548"];
    TargetPlatform *ios =   [[TargetPlatform new] initWithPrimary:@ "sms:01125840548&body=test%20creating" withFallBack: @"tel:01125840548"];
    
    
    
    SmartDeepLink *ffff = [[SmartDeepLink new] initWithHeader:@"hello" andImage:@"https://i.imgur.com/HwieXuR.jpg" andDescription:@"welcome to test description" andName:@"ragaie" iosTarget:ios androidTarget:android webTarget:web];
    
    [ffff setSlug:@"jjjjjj"];
    
    
    // NSLog(@"%@", ffff.dictionaryValue);
    
    
    ////------>
    
    [_loadingView setHidden:NO];
        [Appgain CreateSmartLinkWithObject:ffff whenFinish:^(NSURLResponse * response, NSMutableDictionary * result) {
 
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
    MobileLandingPageButton *button1 = [[MobileLandingPageButton alloc] initWithTitle:@"test First" iosTarget:@"sms:01125840548&body=test%20creating" andAndroid:@"tel:01125840548" andWeb:@"Openpopup://param?title=test%20landingpage%20popup&text=this%20is%20my%20test%20data%20to%20test%20popup"];
    
    //create social media butons with it is target
    SocialmediaSettings *socialMediaSetting = [[SocialmediaSettings alloc] initWithTitle:@"appGain" andDescription:@"welcome to test data" andImage:@"https://i.imgur.com/HwieXuR.jpg"];
    
    // create landing page object
    MobileLandingPage *tempLandingPage = [[MobileLandingPage alloc] initWithLogo:@"https://i.imgur.com/HwieXuR.jpg" andHeader:@"test create landingpage" andParagraph:@"this is a test for creating landingpage" withSliderUrlImages:imagesUrl andButtons: [NSArray arrayWithObjects: button1,nil] andSocialMediaSetting:socialMediaSetting language:@"en" andSubscription:@"welcome" andimage:@"" andlabel:@"asdasklads"];
    tempLandingPage.slug = @"hello welcome ";
    
   // /sdk method
    [_loadingView setHidden:NO];

        [Appgain createLandingPageWithObject:tempLandingPage whenFinish:^(NSURLResponse *response, NSMutableDictionary *result) {
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

    [Appgain CreateAutomatorWithTrigger:@"productview" andUserId:@"44" whenFinish:^(NSURLResponse * response, NSMutableDictionary *result) {
        
       
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
