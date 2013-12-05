//
//  ViewController.h
//  calculator
//
//  Created by 井上　昌信 on 13/11/07.
//  Copyright (c) 2013年 University of Kitakyu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ADD 0
#define SUB 1
#define MULT 2
#define DIV 3

@interface ViewController : UIViewController {
    IBOutlet UILabel *label;
    BOOL startInput;
    double currentValue;
    int operation;
}
- (IBAction)numberButtonPushed:(id)sender;
- (IBAction)clearButtonPushed:(id)sender;
- (IBAction)equalButtonPushed:(id)sender;
- (IBAction)opButtonPushed:(id)sende;


@end
