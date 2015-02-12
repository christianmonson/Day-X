//
//  DetailViewController.m
//  DayX
//
//  Created by Parker Rushton on 2/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "EntryController.h"

static NSString * const entryTitleKey = @"entryTitleKey";
static NSString * const  entryTextKey = @"entryTextKey";
static NSString * const completeJournalEntryKey = @"completeJournalEntryKey";

@interface DetailViewController () <UITextViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) Entry *entry;

@end

@implementation DetailViewController

- (void) updateWithEntry:(Entry *)entry {
    self.entry = entry;
    
    self.titleTextField.text = entry.title;
    self.textView.text = entry.text;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleTextField.clearButtonMode = YES;
    
    self.titleTextField.delegate = self;
    self.textView.delegate = self;
    
    self.titleTextField.text = self.entry.title;
    self.textView.text = self.entry.text;
    
    UIBarButtonItem *saveBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveBarButton;
    
}

- (IBAction)clearButtonPressed:(id)sender {
    self.titleTextField.text = @"";
    self.textView.text = @"";
}


- (IBAction)save:(id)sender {
    
    Entry *entry = [[Entry alloc]initWithDictionary:@{titleKey:self.titleTextField.text, textKey: self.textView.text}];
    
    if (self.entry) {
        [[EntryController sharedInstance] replaceEntry:self.entry withEntry:entry];
    } else {
        [[EntryController sharedInstance] addEntry:entry];

    }
    
    [self.navigationController popViewControllerAnimated:1];
}

- (void) updateViewWithJournalDictionary: (NSDictionary *) journalEntryDictionary {
    self.titleTextField.text = journalEntryDictionary [titleKey];
    self.textView.text = journalEntryDictionary [textKey];
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
