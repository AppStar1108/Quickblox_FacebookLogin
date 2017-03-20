//
//  TopicSomeoneViewController.m
//  datChat
//
//  Created by administrator on 3/4/17.
//  Copyright © 2017 administrator. All rights reserved.
//

#import "TopicSomeoneViewController.h"
#import "FindingSomeoneViewController.h"
#import "SelectExpertViewController.h"

@interface TopicSomeoneViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblMiles;
@property (weak, nonatomic) IBOutlet UISlider *sliderDistance;
@property (weak, nonatomic) IBOutlet UIImageView *imgvSwitchButtonBG;
@property (weak, nonatomic) IBOutlet UIView *viewTab1;
@property (weak, nonatomic) IBOutlet UIView *viewTab2;
@property (weak, nonatomic) IBOutlet UIView *viewTab3;
@property (weak, nonatomic) IBOutlet UIButton *btnTab1Post;
@property (weak, nonatomic) IBOutlet UIButton *btnTab2Post;
@property (weak, nonatomic) IBOutlet UIButton *btnTab3Post;
@property (weak, nonatomic) IBOutlet UITableView *tblTopicSomeone;
@property (weak, nonatomic) IBOutlet UITableView *tblTopicExpert;
@property (nonatomic) NSInteger nSelectedTabIndex;
@property (nonatomic, strong) NSMutableArray *arrTopicSomeone;
@property (nonatomic, strong) NSMutableArray *arrTopicExpert;
@end

@implementation TopicSomeoneViewController
- (IBAction)onSwitchTab1Select:(id)sender {
    self.nSelectedTabIndex = 0;
    [self.imgvSwitchButtonBG setImage:[UIImage imageNamed:@"ic_switch_tab_1"]];
    
    [self hideAllViewTabs];
    [self.viewTab1 setHidden:NO];
}

- (IBAction)onSwitchTab2Select:(id)sender {
    self.nSelectedTabIndex = 1;
    [self.imgvSwitchButtonBG setImage:[UIImage imageNamed:@"ic_switch_tab_2"]];
    
    [self hideAllViewTabs];
    [self.viewTab2 setHidden:NO];
}

- (IBAction)onSwitchTab3Select:(id)sender {
    self.nSelectedTabIndex = 2;
    [self.imgvSwitchButtonBG setImage:[UIImage imageNamed:@"ic_switch_tab_3"]];
    
    [self hideAllViewTabs];
    [self.viewTab3 setHidden:NO];
}

- (IBAction)onButtonPost1:(id)sender {
}

- (IBAction)onButtonPost2:(id)sender {
}

- (IBAction)onButtonPost3:(id)sender {
    UIViewController *vcApplication = [self.storyboard instantiateViewControllerWithIdentifier:VC_EXPERT_PRO_APPLICATION];
    [self.navigationController pushViewController:vcApplication animated:YES];
}

- (IBAction)onSetting:(id)sender {
    
}

- (IBAction)onChatting:(id)sender {
}

- (IBAction)onSliderDistanceChange:(id)sender {
    int nVal = self.sliderDistance.value;
    int nMiles = 5;
    
    if(nVal < 3) {
        nVal = 0;
    } else if (nVal < 8) {
        nVal = 5;
        nMiles = 20;
    } else {
        nVal = 10;
        nMiles = 50;
    }
    
    NSString *strText = [NSString stringWithFormat:@"%d mi", nMiles];
    self.lblMiles.text = strText;
    
    [self.sliderDistance setValue:nVal];
}

- (void)goNextWithTopic:(NSString *)strTopic mode:(NSInteger) nMode{
    if(nMode == 0) {
        FindingSomeoneViewController *vcFindingSomeone = (FindingSomeoneViewController *)[self.storyboard instantiateViewControllerWithIdentifier:VC_FINDING_SOMEONE];
        vcFindingSomeone.strTopic = strTopic;
        
        [self.navigationController pushViewController:vcFindingSomeone animated:YES];
    } else {
        SelectExpertViewController *vcSelectExpert = (SelectExpertViewController *)[self.storyboard instantiateViewControllerWithIdentifier:VC_SELECT_EXPERT];
        vcSelectExpert.strTopic = strTopic;
        
        [self.navigationController pushViewController:vcSelectExpert animated:YES];
    }
    
}

- (void) hideAllViewTabs {
    [self.viewTab1 setHidden:YES];
    [self.viewTab2 setHidden:YES];
    [self.viewTab3 setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    [self initUI];
    
}

- (void) initData {
    self.arrTopicSomeone = [[NSMutableArray alloc] initWithArray:@[@"#anything", @"#food", @"#politics", @"#friends", @"#trump"]];
    self.arrTopicExpert = [[NSMutableArray alloc] initWithArray:@[@"#dating coach", @"#math tutor", @"#Lawyer", @"#Doctor", @"#Therapist"]];
}

- (void) initUI {
    self.btnTab1Post.layer.cornerRadius = 25;
    self.btnTab1Post.layer.borderColor = [[UIColor blackColor] CGColor];
    self.btnTab1Post.layer.borderWidth = 3.0;
    self.btnTab1Post.layer.masksToBounds = YES;
    
    self.btnTab2Post.layer.cornerRadius = 25;
    self.btnTab2Post.layer.borderColor = [[UIColor blackColor] CGColor];
    self.btnTab2Post.layer.borderWidth = 3.0;
    self.btnTab2Post.layer.masksToBounds = YES;
    
    self.btnTab3Post.layer.cornerRadius = 25;
    self.btnTab3Post.layer.borderColor = [[UIColor blackColor] CGColor];
    self.btnTab3Post.layer.borderWidth = 3.0;
    self.btnTab3Post.layer.masksToBounds = YES;
    
    self.tblTopicSomeone.delegate = self;
    self.tblTopicSomeone.dataSource = self;
    
    self.tblTopicExpert.delegate = self;
    self.tblTopicExpert.dataSource = self;
    
    [self onSwitchTab1Select:nil];
    [self onSliderDistanceChange:nil];
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

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.tblTopicSomeone) {
        return [self.arrTopicSomeone count];
    }
    return [self.arrTopicExpert count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    NSString *strTopic;
    
    if(tableView == self.tblTopicSomeone) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:CELL_TOPIC_SOMEONE];
        
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_TOPIC_SOMEONE];
            
        }
        
        strTopic = [self.arrTopicSomeone objectAtIndex:indexPath.row];
        
    } else {
        
        cell = [tableView dequeueReusableCellWithIdentifier:CELL_TOPIC_EXPERT];
        
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_TOPIC_EXPERT];
            
        }
        
        strTopic = [self.arrTopicExpert objectAtIndex:indexPath.row];
        
    }
    
    UILabel *lblTitle = (UILabel *)[cell.contentView viewWithTag:1];
    [lblTitle setText:strTopic];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor clearColor];
    [cell setSelectedBackgroundView:bgColorView];
    
    return cell;
}


#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView == self.tblTopicSomeone) {
        NSString *strTopic = [self.arrTopicSomeone objectAtIndex:indexPath.row];
        [self goNextWithTopic:strTopic mode:0];
    } else {
        NSString *strTopic = [self.arrTopicExpert objectAtIndex:indexPath.row];
        [self goNextWithTopic:strTopic mode:1];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


@end
