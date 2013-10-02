//
//  ViewController.m
//  Message UI framework
//
//  Created by Misato Tina Alexandre on 10/2/13.
//  Copyright (c) 2013 Misato Tina Alexandre. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController 


- (void)viewDidLoad
{
    [super viewDidLoad];
    //Bring out the keyboard when loaded.
    [self.text becomeFirstResponder];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backgroundTap:(id)sender {
    //resign keyboard when tapped the background.
    [self.text resignFirstResponder];
}

- (IBAction)send:(id)sender {
    static NSString *recipentPhoneNumber=@"347-322-9961";
    if ([MFMessageComposeViewController canSendText]) {
        MFMessageComposeViewController *mvc=[[MFMessageComposeViewController alloc]init];
        //array literal
        mvc.recipients=@[recipentPhoneNumber];
        mvc.body=self.text.text;
        mvc.messageComposeDelegate=self;
        [self presentViewController:mvc animated:YES completion:nil];
    }else{
        self.statusLabel.text=@"Device does not support text messages.";
    }
}

#pragma mark- MFMessageComposeViewControllerDelegate methods
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [controller dismissViewControllerAnimated:YES completion:nil];
    switch (result) {
        case MessageComposeResultCancelled:
            self.statusLabel.text=@"Message cancelled.";
            break;
        
        case MessageComposeResultSent:
            self.statusLabel.text=@"Message sent successfully.";
            
        default:
            self.statusLabel.text=@"";
            break;
    }
}


@end
