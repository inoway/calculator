//
//  ViewController.m
//  calculator
//
//  Created by 井上　昌信 on 13/11/07.
//  Copyright (c) 2013年 University of Kitakyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib
 
    startInput = YES; //startInputは押されたキーが最初の一桁か表す変数
    CurrentValue = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)NumberButtonPushed:(id)sender
{
    UIButton *b = (UIButton *)sender; //キャストしてUIButtonのを取り出す。
    
    if(startInput) {
        //最初の1桁目が0なら表示しない。一桁目は0を表示したくないので。
        if(b.tag == 0) return; //ここに具体的な0が入力されたときの処理を書く。returnなら「何も」しないという処理になる。
        //新しく表示する文字列を作成
        label.text = [NSString stringWithFormat:@"%d",b.tag];
        startInput = NO;
    }
else {
    //既に表示されている文字列に連結
    label.text = [NSString stringWithFormat:@"%@%d",label.text,b.tag];
    }
}

-(IBAction)EqualButtonPushed:(id)sender {//イコールボタンが押されたときの処理
    //直前に押された演算子で場合分け。
    if(Operation == 0) {
        CurrentValue += [label.text intValue];
    }
    else if (Operation == 1) {
        CurrentValue -= [label.text intValue];
}
    //表示の更新
    label.text = [NSString stringWithFormat:@"%d",CurrentValue];
    startInput = YES;
}

-(IBAction)OpButtonPushed:(id)sender {//演算子ボタンが押されたときの処理
    UIButton *b = (UIButton *)sender;
    
    //現在値の保存
    CurrentValue = [label.text intValue]; //CurrentValueは現在までの結果をint型で格納する変数
    
    //演算の保存
    Operation = b.tag; //Operationはどの演算子が押されたのかを記憶する変数
    startInput = YES;
}

-(IBAction)ClearButtonPushed:(id)sender {//クリアボタンが押されたときの処理
 label.text = @"0";
    startInput = YES;//入力待ち受け状態にする
}

@end
