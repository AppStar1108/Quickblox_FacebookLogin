//
//  ExpertProApplicationViewController.m
//  datChat
//
//  Created by administrator on 3/9/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "ExpertProApplicationViewController.h"

@interface ExpertProApplicationViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnAreaOfExperience;
@property (weak, nonatomic) IBOutlet UIButton *btnFirstAndLastName;
@property (weak, nonatomic) IBOutlet UIButton *btnLinkedinURL;
@property (weak, nonatomic) IBOutlet UIButton *btnApply;


@end

@implementation ExpertProApplicationViewController
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onAreaOfExperience:(id)sender {
}

- (IBAction)onFirstAndLastName:(id)sender {
}

- (IBAction)onLinkedinURL:(id)sender {
}

- (IBAction)onApply:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.btnAreaOfExperience.layer.masksToBounds = YES;
    self.btnAreaOfExperience.layer.borderWidth = 3;
    self.btnAreaOfExperience.layer.cornerRadius = 25;
    self.btnAreaOfExperience.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.btnFirstAndLastName.layer.masksToBounds = YES;
    self.btnFirstAndLastName.layer.borderWidth = 3;
    self.btnFirstAndLastName.layer.cornerRadius = 25;
    self.btnFirstAndLastName.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.btnLinkedinURL.layer.masksToBounds = YES;
    self.btnLinkedinURL.layer.borderWidth = 3;
    self.btnLinkedinURL.layer.cornerRadius = 25;
    self.btnLinkedinURL.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.btnApply.layer.masksToBounds = YES;
    self.btnApply.layer.borderWidth = 3;
    self.btnApply.layer.cornerRadius = 25;
    self.btnApply.layer.borderColor = [[UIColor blackColor] CGColor];
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
