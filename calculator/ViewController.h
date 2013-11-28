//
//  ViewController.h
//  calculator
//
//  Created by 井上　昌信 on 13/11/07.
//  Copyright (c) 2013年 University of Kitakyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UILabel *label;
    BOOL startInput;
    double CurrentValue;
    int Operation;
}
- (IBAction)NumberButtonPushed:(id)sender;
- (IBAction)ClearButtonPushed:(id)sender;
- (IBAction)EqualButtonPushed:(id)sender;
- (IBAction)OpButtonPushed:(id)sende;


@end
