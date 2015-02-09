//
//  NoXibDetailViewController.m
//  DayX
//
//  Created by Parker Rushton on 2/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "NoXibDetailViewController.h"

@interface NoXibDetailViewController ()
@property (nonatomic,strong) UITextField *titleTextField;
@property (nonatomic,strong) UIButton *clearButton;
@property (nonatomic,strong) UITextView *textView;



@end


static CGFloat margin = 20;
static CGFloat itemHeight = 40;



@implementation NoXibDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat textFieldWidth = self.view.frame.size.width / 1.5;

    self.titleTextField = [[UITextField alloc] initWithFrame: CGRectMake(margin, margin + 64, textFieldWidth, itemHeight)];
    self.titleTextField.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.titleTextField];
    
    
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
