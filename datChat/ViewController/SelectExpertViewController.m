//
//  SelectExpertViewController.m
//  datChat
//
//  Created by administrator on 3/4/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "SelectExpertViewController.h"

@interface SelectExpertViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblTopic;

@end

@implementation SelectExpertViewController
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onChatting:(id)sender {
    [self goNextWithPerson];
}

- (IBAction)onSelectPerson1:(id)sender {
    [self goNextWithPerson];
}

- (IBAction)onSelectPerson2:(id)sender {
    [self goNextWithPerson];
}

- (IBAction)onSelectPerson3:(id)sender {
    [self goNextWithPerson];
}

- (IBAction)onSelectPerson4:(id)sender {
    [self goNextWithPerson];
}

- (void) goNextWithPerson {
    UIViewController *vcExpertProfile = [self.storyboard instantiateViewControllerWithIdentifier:VC_EXPERT_PROFILE];
    [self.navigationController pushViewController:vcExpertProfile animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lblTopic.text = self.strTopic;
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
