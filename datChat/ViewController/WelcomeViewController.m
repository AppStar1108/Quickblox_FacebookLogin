//
//  WelcomeViewController.m
//  datChat
//
//  Created by administrator on 3/4/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnLetsGo;

@end

@implementation WelcomeViewController
- (IBAction)onLetsGo:(id)sender {
    UIViewController *vcTopic = [self.storyboard instantiateViewControllerWithIdentifier:VC_TOPIC_SOMEONE];
    [self.navigationController pushViewController:vcTopic animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.btnLetsGo.layer setMasksToBounds:YES];
    [self.btnLetsGo.layer setCornerRadius:30];
    [self.btnLetsGo.layer setBorderWidth:3.0];
    [self.btnLetsGo.layer setBorderColor:[[UIColor blackColor] CGColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
