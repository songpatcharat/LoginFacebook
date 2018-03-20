//
//  ViewController.m
//  LoginFacebook
//
//  Created by patcharat on 16/3/2561 BE.
//  Copyright © 2561 patcharats. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loginFacebook];
}
    
- (void)loginFacebook{
    FBSDKLoginManager *fbLoginManager = [[FBSDKLoginManager alloc] init];
    [fbLoginManager logInWithReadPermissions:@[@"email"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            NSLog(@"Process error");
        } else if (result.isCancelled) {
            NSLog(@"Cancelled");
        } else {
            NSLog(@"Logged in");
            
            [self getFacebookUserData];
//            FBSDKLoginManagerLoginResult *fbLoginResult = [[FBSDKLoginManagerLoginResult alloc] init];
//            fbLoginResult = result;
//            if([fbLoginResult grantedPermissions] != nil){
//                if([[fbLoginResult grantedPermissions] containsObject:@"email"]){
//                    
//                }
//            }
        }
    }];
}

- (void)getFacebookUserData{
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id, name, first_name, last_name, picture.type(large), email"}]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         if (!error) {
             NSLog(@"fetched user:%@  and Email : %@", result,result[@"email"]);
         }}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
