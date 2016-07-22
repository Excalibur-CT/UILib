//
//  ViewController.m
//  CTUIDemo
//
//  Created by Admin on 16/7/22.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)NSArray * dataAry;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"UI";
    self.dataAry = @[@{@"title":@"CTLable",@"controller":@"CTLableController"},
                     @{@"title":@"CTButton",@"controller":@"CTButtonController"}];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = _dataAry[indexPath.row][@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString * vcClass = _dataAry[indexPath.row][@"controller"];
    UIViewController * toVC = [[[NSClassFromString(vcClass) class] alloc] init];
    [self.navigationController pushViewController:toVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
