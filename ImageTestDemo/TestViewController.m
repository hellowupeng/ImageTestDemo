//
//  TestViewController.m
//  ImageTestDemo
//
//  Created by gaiaworks on 16/5/2.
//  Copyright © 2016年 gaiaworks. All rights reserved.
//

#import "TestViewController.h"
#import "TestTableViewCell.h"

static NSString *identifer = @"TestTableViewCell";

@interface TestViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation TestViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"测试";
    UINib *nib = [UINib nibWithNibName:@"TestTableViewCell" bundle:nil];
    [self.myTableView registerNib:nib forCellReuseIdentifier:identifer];
    
    self.myTableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[TestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    
    // 拉伸背景图片
    UIImage *image = [UIImage imageNamed:@"1.png"];
    
    CGFloat top = image.size.height * 0.5;
    CGFloat left = image.size.width * 0.5;
    CGFloat bottom = image.size.height * 0.5;
    CGFloat right = image.size.width * 0.5;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    UIImage *newImage = [image resizableImageWithCapInsets:insets];
    
    UIImageView *backImageView = [UIImageView new];
    backImageView.image = newImage;
    cell.backgroundView = backImageView;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 484;
}

@end











