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
    currentValue = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)numberButtonPushed:(id)sender
{
    UIButton *b = (UIButton *)sender; //キャストしてUIButtonのを取り出す。bはButtonの意味
    
    if(startInput) {
        //最初の1桁目が0なら表示しない。一桁目は0を表示したくないので。
        //if(b.tag == 0) return; //ここに具体的な0が入力されたときの処理を書く。returnなら「何も」しないという処理になる。
        //if (b.tag==100) { // 小数点の処理
            //label.text = [NSString stringWithFormat:@"0."];
        //}
        
        //新しく表示する文字列を作成
        label.text = [NSString stringWithFormat:@"%d",b.tag];
        
        //数字が入力されたので、startInputをNOにして
        startInput = NO;
        
//        isInputStarted = NO;
    } else {
        //既に表示されている文字列に連結
        label.text = [NSString stringWithFormat:@"%@%d",label.text,b.tag];
    }
}



/*
enum {
    ADD,
    SUB,
}
*/
 
-(IBAction)equalButtonPushed:(id)sender {//イコールボタンが押されたときの処理
    //直前に押された演算子で場合分け。
    // if(Operation == ADD) {
    if(operation == ADD) {//add
        currentValue += [label.text intValue];
    }
    else if (operation == SUB) {//sub
        currentValue -= [label.text intValue];
}
    
    else if (operation == MULT) {//mult
        currentValue *= [label.text intValue];
    }
    
    else {//div
        currentValue /= [label.text intValue];
    }
    
    //表示の更新
    label.text = [NSString stringWithFormat:@"%f",currentValue];
    currentValue=0; //計算後、重複で計算することを防ぐためにCurrentValueを初期化する
    startInput = YES;
}

-(IBAction)opButtonPushed:(id)sender {//演算子ボタンが押されたときの処理
    UIButton *b = (UIButton *)sender;
    
    //現在値の保存
    currentValue = [label.text intValue]; //CurrentValueは現在までの結果をint型で格納する変数
    
    //演算の保存
    operation = b.tag; //Operationはどの演算子が押されたのかを記憶する変数
    startInput = YES;
}

-(IBAction)clearButtonPushed:(id)sender {//クリアボタンが押されたときの処理
 label.text = @"0";
    startInput = YES;//入力待ち受け状態にする
}

@end