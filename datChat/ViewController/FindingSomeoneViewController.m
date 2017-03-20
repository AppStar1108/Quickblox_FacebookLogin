//
//  FindingSomeoneViewController.m
//  datChat
//
//  Created by administrator on 3/4/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "FindingSomeoneViewController.h"

@interface FindingSomeoneViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblTopic;
@property (weak, nonatomic) IBOutlet UIView *viewSearching;
@property (weak, nonatomic) IBOutlet UILabel *lblLoading;
@property (weak, nonatomic) IBOutlet UIView *viewAlert;
@property (weak, nonatomic) IBOutlet UILabel *lblCandidateNameAndAge;
@property (weak, nonatomic) IBOutlet UILabel *lblCandidateInfo;
@property (weak, nonatomic) IBOutlet UIView *viewOK;
@property (weak, nonatomic) IBOutlet UIView *viewCancel;

@end

@implementation FindingSomeoneViewController
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onChatting:(id)sender {
}

- (IBAction)onSelectOK:(id)sender {
    UIViewController *vcChatSomeone = [self.storyboard instantiateViewControllerWithIdentifier:VC_CHAT_SOMEONE];
    [self.navigationController pushViewController:vcChatSomeone animated:YES];
}

- (IBAction)onSelectCancel:(id)sender {
    [self.viewAlert setHidden:YES];
    [self.viewSearching setHidden:NO];
    [self.lblLoading setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    
    // Delay execution of my block for 10 seconds.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self.viewAlert setHidden:NO];
        [self.viewSearching setHidden:YES];
        [self.lblLoading setHidden:NO];
    });
}

- (void) initUI {
    self.lblTopic.text = self.strTopic;
    
    [self.viewSearching setHidden:NO];
    [self.lblLoading setHidden:YES];
    [self.viewAlert setHidden:YES];
    
    [self.viewAlert.layer setMasksToBounds:YES];
    [self.viewAlert.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
    [self.viewAlert.layer setBorderWidth:1.0];
    
    [self.viewOK.layer setMasksToBounds:YES];
    [self.viewOK.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.viewOK.layer setBorderWidth:2.0];
    [self.viewOK.layer setCornerRadius:18];
    
    [self.viewCancel.layer setMasksToBounds:YES];
    [self.viewCancel.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.viewCancel.layer setBorderWidth:2.0];
    [self.viewCancel.layer setCornerRadius:18];
    
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
