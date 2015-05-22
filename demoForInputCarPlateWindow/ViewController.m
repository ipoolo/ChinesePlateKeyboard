//
//  ViewController.m
//  demoForInputCarPlateWindow
//
//  Created by liu poolo on 15/4/3.
//  Copyright (c) 2015年 liu poolo. All rights reserved.
//

#import "ViewController.h"
#import "PLLInputCarPlateWindow.h"

@interface ViewController ()<PLLInputCarPlateWindowDelegate>{
    UIButton *bt;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

-(void)viewDidAppear:(BOOL)animated{
    bt = [[UIButton alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:bt];
    [bt setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bt setTitle:@"test" forState:UIControlStateNormal];
    [bt setTitle:@"bbb" forState:UIControlStateHighlighted];
    [bt addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)test:(id) sender{
    [[PLLInputCarPlateWindow showWithPlateStr:[bt titleForState:UIControlStateNormal]] setResultDelegate:self];
//    [[PLLInputCarPlateWindow shareInputCarPlateWindow] showWithPlateStr:@"陕A"];
}

#pragma mark - PLLInputCarPlateWindowDelegate
-(void)resultPlateStr:(NSString *)str{
    [bt setTitle:str forState:UIControlStateNormal];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
