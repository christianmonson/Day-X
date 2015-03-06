//
//  DetailViewController.m
//  DayX
//
//  Created by Parker Rushton on 2/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import <DayXKit/DayXKit.h>

static NSString * const entryTitleKey = @"entryTitleKey";
static NSString * const  entryTextKey = @"entryTextKey";
static NSString * const completeJournalEntryKey = @"completeJournalEntryKey";

@interface DetailViewController () <UITextViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) Entry *entry;

@end

@implementation DetailViewController

- (void)updateWithEntry:(Entry *)entry {
    self.entry = entry;
    
    self.textField.text = entry.title;
    self.textView.text = entry.text;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.delegate = self;
    self.textView.delegate = self;
    
    self.textField.text = self.entry.title;
    self.textView.text = self.entry.text;
    
    self.textField.clearButtonMode = YES;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.803 green:0.921 blue:1.000 alpha:1.000];
   
    UIBarButtonItem *saveBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveBarButton;
    
}

- (IBAction)clearButtonPressed:(id)sender {
    self.textField.text = @"";
    self.textView.text = @"";
}


- (void)save:(id)sender {
    
    if (self.entry) {
        
        self.entry.title = self.textField.text;
        self.entry.text = self.textView.text;
        self.entry.timestamp = [NSDate date];
        
        [[EntryController sharedInstance] synchronize];
    } else {
        [[EntryController sharedInstance] addEntryWithTitle:self.textField.text text:self.textView.text andDate:[NSDate date]];
    }
    
    [self.navigationController popViewControllerAnimated:1];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
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
