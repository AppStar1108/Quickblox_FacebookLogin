//
//  ExpertProfileViewController.m
//  datChat
//
//  Created by administrator on 3/5/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "ExpertProfileViewController.h"

@interface ExpertProfileViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnPay;

@end

@implementation ExpertProfileViewController
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onPay:(id)sender {
    UIViewController *vcChatExeprt = [self.storyboard instantiateViewControllerWithIdentifier:VC_CHAT_EXPERT];
    [self.navigationController pushViewController:vcChatExeprt animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.btnPay.layer.borderColor = [[UIColor blackColor] CGColor];
    self.btnPay.layer.borderWidth = 3;
    self.btnPay.layer.cornerRadius = 25;
    self.btnPay.layer.masksToBounds = YES;
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
