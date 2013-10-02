//
//  ViewController.h
//  Message UI framework
//
//  Created by Misato Tina Alexandre on 10/2/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ViewController : UIViewController<MFMessageComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *text;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
- (IBAction)backgroundTap:(id)sender;

- (IBAction)send:(id)sender;
@end
