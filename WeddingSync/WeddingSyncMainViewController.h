//
//  WeddingSyncMainViewController.h
//  WeddingSync
//
//  Created by Sean Gray on 12/1/13.
//  Copyright (c) 2013 Sean Gray. All rights reserved.
//

#import "WeddingSyncFlipsideViewController.h"

@interface WeddingSyncMainViewController : UIViewController <WeddingSyncFlipsideViewControllerDelegate>
{
    IBOutlet UIScrollView *scrollView;
    IBOutlet UITextView *TextViews;
}

@property (strong, nonatomic) IBOutlet UITextField *txtVenueName;
- (IBAction)btnSave:(id)sender;
-(IBAction) doneEditing:(id) sender;

//keyboard hide when bg touched
@property (nonatomic, retain) UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITextView *TextViews;

@end
