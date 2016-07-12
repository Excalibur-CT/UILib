//
//  ViewController.m
//  CTButtonDemo
//
//  Created by Admin on 16/7/11.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "ViewController.h"
#import "CTButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CTButton * btn = [CTButton buttonWithPlainType:CTButtonPlainVerticalInvertType];
    btn.backgroundColor = [UIColor orangeColor];
    btn.frame = CGRectMake(100, 100, 80, 80);
    [btn setTitle:@"城市" forState:UIControlStateNormal];
    [btn setImageForNormal:[UIImage imageNamed:@"account_center"]
               highlighted:nil
                  selected:nil
                  disabled:nil];
    [btn setTitleColorForNormal:[UIColor whiteColor]
                    highlighted:[UIColor orangeColor]
                       selected:[UIColor blueColor]
                       disabled:[UIColor lightGrayColor]];
    [btn setBorderColor:[UIColor purpleColor] borderWidth:1 cornerRadius:10];
    [self.view addSubview:btn];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
