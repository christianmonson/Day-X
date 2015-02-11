//
//  DetailViewController.m
//  DayX
//
//  Created by Parker Rushton on 2/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "Entry.h"

static NSString * const entryTitleKey = @"entryTitleKey";
static NSString * const  entryTextKey = @"entryTextKey";
static NSString * const completeJournalEntryKey = @"completeJournalEntryKey";

@interface DetailViewController () <UITextViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;

@property (strong, nonatomic) Entry *entry;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleTextField.clearButtonMode = YES;
    
    NSDictionary *journalEntryDictionary = [[NSUserDefaults standardUserDefaults] objectForKey:completeJournalEntryKey];
    [self updateViewWithJournalDictionary:journalEntryDictionary];
    UIBarButtonItem *saveBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveBarButton;
    
}

- (IBAction)clearButtonPressed:(id)sender {
    self.titleTextField.text = @"";
    self.textView.text = @"";
}
//- (IBAction)saveButtonPressed:(UIButton *)sender {
//    NSMutableDictionary *entryDictionarySaveButton = [NSMutableDictionary new];
//    entryDictionarySaveButton [entryTitleKey] = self.titleTextField.text;
//    entryDictionarySaveButton [entryTextKey] = self.textView.text;
//    entryDictionarySaveButton [@"entryDate"] = [NSDate date];
//    
//    [[NSUserDefaults standardUserDefaults] setObject:entryDictionarySaveButton forKey:completeJournalEntryKey];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//}

- (IBAction)save:(id)sender {
    
    if (!self.entry) {
        self.entry = [[Entry alloc] init];
        self.entry.title = self.titleTextField.text;
        self.entry.text = self.textView.text;
    }
    
    NSMutableArray *entries = [Entry loadEntriesFromDefaults];
    [entries addObject:self.entry];
    
    [Entry storeEntiresInDefaults:entries];
    
    [self.navigationController popViewControllerAnimated:1];
}
- (void) updateViewWithJournalDictionary: (NSDictionary *) journalEntryDictionary {
    self.titleTextField.text = journalEntryDictionary [entryTitleKey];
    self.textView.text = journalEntryDictionary [entryTextKey];
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
