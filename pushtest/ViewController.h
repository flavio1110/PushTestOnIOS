//
//  ViewController.h
//  pushtest
//
//  Created by FlavioSilva on 6/30/14.
//  Copyright (c) 2014 flaviosilva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *labelPushToken;
@property (nonatomic, strong) IBOutlet UITextField *txtIp;
@property (nonatomic, strong) IBOutlet UILabel *labelReceivedToken;

- (IBAction)fetchProviderToken;

@end
