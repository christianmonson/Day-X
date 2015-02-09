//
//  DetailViewController.m
//  DayX
//
//  Created by Parker Rushton on 2/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UITextViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)clearButtonPressed:(id)sender {
    self.titleTextField.text = @"";
    self.textView.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)doneBarButtonPressed:(id)sender {
    [self.textView resignFirstResponder];
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
