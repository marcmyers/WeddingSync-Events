//
//  WeddingSyncFlipsideViewController.h
//  WeddingSync
//
//  Created by Sean Gray on 12/1/13.
//  Copyright (c) 2013 Sean Gray. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeddingSyncFlipsideViewController;

@protocol WeddingSyncFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(WeddingSyncFlipsideViewController *)controller;
@end

@interface WeddingSyncFlipsideViewController : UIViewController

@property (weak, nonatomic) id <WeddingSyncFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
