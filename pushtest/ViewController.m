//
//  ViewController.m
//  pushtest
//
//  Created by FlavioSilva on 6/30/14.
//  Copyright (c) 2014 flaviosilva. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
NSString *_pushToken;
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // getting an NSString
    _pushToken = [prefs stringForKey:@"pushToken"];
    [self.labelPushToken setText:_pushToken];
}

- (IBAction)fetchProviderToken;
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // getting an NSString
    _pushToken = [prefs stringForKey:@"pushToken"];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat
                                       : @"http://%@:3000/Users/SetProviderToken?token=%@", self.txtIp.text, _pushToken]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //[request setHTTPMethod:@"POST"];
    NSString *postString = @"token=2323";
    //[request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    //[request setValue:_pushToken forKey:@"token"];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
             self.labelReceivedToken.text = [res objectForKey:@"providerToken"];
         }
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end







