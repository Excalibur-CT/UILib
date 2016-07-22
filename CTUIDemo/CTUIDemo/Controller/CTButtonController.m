//
//  CTButtonController.m
//  CTUIDemo
//
//  Created by Admin on 16/7/22.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "CTButtonController.h"
#import "CTButton.h"

@interface CTButtonController ()

@end

@implementation CTButtonController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CTButton * btn = [CTButton buttonWithPlainType:CTButtonPlainVerticalInvertType];
    btn.backgroundColor = [UIColor whiteColor];
    btn.frame = CGRectMake(100, 100, 80, 80);
    [btn setTitle:@"城市" forState:UIControlStateNormal];
    [btn setImageForNormal:[UIImage imageNamed:@"account_center"]
               highlighted:nil
                  selected:nil
                  disabled:nil];
    [btn setTitleColorForNormal:[UIColor grayColor]
                    highlighted:[UIColor orangeColor]
                       selected:[UIColor blueColor]
                       disabled:[UIColor lightGrayColor]];
    [btn setBorderColor:[UIColor redColor] borderWidth:1 cornerRadius:10];
    [self.view addSubview:btn];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
