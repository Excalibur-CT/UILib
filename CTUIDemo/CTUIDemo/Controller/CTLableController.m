//
//  CTLableController.m
//  CTUIDemo
//
//  Created by Admin on 16/7/22.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "CTLableController.h"
#import "CTLable.h"

@interface CTLableController ()

@end

@implementation CTLableController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CTLable * lable = [[CTLable alloc] initWithFrame:CGRectMake(10, 70, 300, 200)];
    lable.text = @"恩额二凤我绯闻绯闻访问服务范围分为";
    lable.numberOfLines = 0;
    lable.verticalAlignment = NSTextVerticalAlignmentTop;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:lable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
