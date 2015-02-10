//
//  NoXibDetailViewController.m
//  DayX
//
//  Created by Parker Rushton on 2/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "NoXibDetailViewController.h"

@interface NoXibDetailViewController () <UITextFieldDelegate, UITextViewDelegate>
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
    CGFloat currentTop = 0;
    CGFloat screenWidth = self.view.frame.size.width;

    //Set Title Text Field
    self.titleTextField = [[UITextField alloc] initWithFrame: CGRectMake(margin, margin + 64, screenWidth - (margin *2), itemHeight)];
    self.titleTextField.backgroundColor = [UIColor lightGrayColor];
    self.titleTextField.delegate = self;
    self.titleTextField.placeholder = @"Enter Entry Title";
    self.titleTextField.clearButtonMode = YES;
    [self.view addSubview:self.titleTextField];
    
    currentTop = 144;
    
    //Set Text View
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(margin, currentTop, screenWidth - (margin *2), self.view.frame.size.height / 2)];
    self.textView.backgroundColor = [UIColor cyanColor];
    self.textView.delegate = self;
    [self.view addSubview:self.textView];
    
//    //Set Clear Button
//    self.clearButton = [[UIButton alloc] initWithFrame:CGRectMake(textFieldWidth + margin + 10, margin + 64, 70, itemHeight)];
//    //self.clearButton.backgroundColor = [UIColor blueColor];
//    [self.clearButton setTitle:@"Clear" forState:UIControlStateNormal];
//    [self.clearButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [self.clearButton addTarget:self action:@selector(clearButtonPressed) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.clearButton];
    
}

- (void)clearButtonPressed {
    self.titleTextField.text = @"cookies!!!";
    self.textView.text = @"YUMM YUMM!";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    [textView resignFirstResponder];

    return YES;
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
