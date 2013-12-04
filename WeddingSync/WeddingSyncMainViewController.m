//
//  WeddingSyncMainViewController.m
//  WeddingSync
//
//  Created by Sean Gray on 12/1/13.
//  Copyright (c) 2013 Sean Gray. All rights reserved.
//

#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
#import "FMResultSet.h"
#import "WeddingSyncMainViewController.h"

@interface WeddingSyncMainViewController ()

@end

@implementation WeddingSyncMainViewController

@synthesize txtVenueName=txtVenueName;
@synthesize scrollView=scrollView;
@synthesize TextViews=TextViews;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //3 Keyboard Hide
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(WeddingSyncFlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

/////////////////
// KONKOL code //
/////////////////

-(void)dismissKeyboard {
    [txtVenueName resignFirstResponder];
    [TextViews resignFirstResponder];
}
- (IBAction)btnSave:(id)sender {
    [txtVenueName resignFirstResponder];
    [TextViews resignFirstResponder];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"WeddingSync.sqlite"];
    
    FMDatabase *database = [FMDatabase databaseWithPath:path];
    [database open];
	// Do any additional setup after loading the view, typically from a nib.
    //Date to write
    CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
    NSString *strDate = [NSString stringWithFormat:@"%02d/%02d/%02d -- %02d:%02d:%2.0f", currentDate.month,currentDate.day,(int)currentDate.year, currentDate.hour, currentDate.minute, currentDate.second];
    [database beginTransaction];
    [database executeUpdate:@"insert into mysugar(date, level, note) values(?,?,?)",
     strDate,txtVenueName.text,TextViews.text];
    [database commit];
    [database close];
    txtVenueName.text=@"";
    TextViews.text = @"";
}
-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
    [scrollView setContentOffset:scrollPoint animated:YES];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [scrollView setContentOffset:CGPointZero animated:YES];
}
- (void)textViewDidBeginEditing:(UITextView *)textView {
    CGPoint scrollPoint = CGPointMake(0, textView.frame.origin.y);
    [scrollView setContentOffset:scrollPoint animated:YES];
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    [scrollView setContentOffset:CGPointZero animated:YES];
}
- (IBAction)btnBack:(id)sender {
    [scrollView setContentOffset:CGPointZero animated:YES];
}
- (void)viewDidUnload {
    
    [super viewDidUnload];
}

@end
