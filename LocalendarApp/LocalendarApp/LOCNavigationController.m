//
//  LOCNavigationController.m
//  LocalendarApp
//
//  Created by Yoshiyuki Kuga on 2015/03/12.
//  Copyright (c) 2015年 Gruppy. All rights reserved.
//

#import "LOCNavigationController.h"

@interface LOCNavigationController ()

@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;

@end

@implementation LOCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Hiragino Kaku Gothic Pro" size:16.0], NSFontAttributeName, nil];
    [self.navBar setTitleTextAttributes:attributes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
