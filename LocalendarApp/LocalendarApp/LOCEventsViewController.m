//
//  LOCEventsViewController.m
//  LocalendarApp
//
//  Created by Yoshiyuki Kuga on 2015/02/11.
//  Copyright (c) 2015年 Gruppy. All rights reserved.
//

#import "LOCEventsViewController.h"
#import "LOCEventTableViewCell.h"

@interface LOCEventsViewController () <UITableViewDataSource, UITabBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *eventsTableView;

@end

@implementation LOCEventsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.eventsTableView registerNib:[UINib nibWithNibName:@"LOCEventTableViewCell" bundle:nil] forCellReuseIdentifier:@"LOCEventTableViewCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LOCEventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LOCEventTableViewCell"];
    
    if (!cell) {
        cell = [[LOCEventTableViewCell alloc] init];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [LOCEventTableViewCell cellHeight];
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
