//
//  ViewController.h
//  AppGainSDKCreator
//
//  Created by Ragaie Alfy on 2/12/18.
//  Copyright © 2018 Ragaie Alfy. All rights reserved.
//

#import <UIKit/UIKit.h>




#import <Crashlytics/Crashlytics.h>
#import "AppGain.h"
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UITextView *matchResultData;

@property (weak, nonatomic) IBOutlet UILabel *userIdLabel;



@end

