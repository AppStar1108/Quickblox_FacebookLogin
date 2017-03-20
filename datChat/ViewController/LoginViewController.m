//
//  LoginViewController.m
//  datChat
//
//  Created by administrator on 3/4/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "LoginViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnFBLoginUI;
@property (nonatomic, strong) FBSDKLoginButton *btnFBLogin;
@end

@implementation LoginViewController
- (IBAction)onFacebookLogin:(id)sender {
    FBSDKAccessToken *currentAccessToken = [FBSDKAccessToken currentAccessToken];
    
    if(currentAccessToken == nil) {
        [self.btnFBLogin sendActionsForControlEvents:UIControlEventTouchUpInside];
    } else {
        [self loginWithFBAccessToken:currentAccessToken];
    }
}

- (void) loginWithFBAccessToken:(FBSDKAccessToken *)accessTokenFB {
    [SVProgressHUD showWithStatus:@"Login..."];
    [QBRequest logInWithSocialProvider:@"facebook" accessToken:accessTokenFB.tokenString accessTokenSecret:nil successBlock:^(QBResponse *response, QBUUser *user) {
        // Login succeded
        [SVProgressHUD showSuccessWithStatus:@"Success"];
        UIViewController *vcWelcome = [self.storyboard instantiateViewControllerWithIdentifier:VC_WELCOME];
        [self.navigationController pushViewController:vcWelcome animated:YES];
    } errorBlock:^(QBResponse *response) {
        // Handle error
        [SVProgressHUD showErrorWithStatus:@"Login Failed"];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.btnFBLogin = [[FBSDKLoginButton alloc] init];
    [self.view addSubview:self.btnFBLogin];
    self.btnFBLogin.delegate = self;
    [self.btnFBLogin setHidden:YES];
    
    [self.btnFBLoginUI.layer setMasksToBounds:YES];
    [self.btnFBLoginUI.layer setCornerRadius:30];
    [self.btnFBLoginUI.layer setBorderWidth:3.0];
    [self.btnFBLoginUI.layer setBorderColor:[[UIColor blackColor] CGColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Facebook Login Button Delegate
- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error {
    
    [self loginWithFBAccessToken:result.token];
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
