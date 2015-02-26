//
//  LOCEventsViewController.m
//  LocalendarApp
//
//  Created by Yoshiyuki Kuga on 2015/02/11.
//  Copyright (c) 2015年 Gruppy. All rights reserved.
//

#import "LOCEventsViewController.h"
#import "LOCEventTableViewCell.h"
#import "LOCEvent.h"
#import "AFHTTPRequestOperationManager.h"

@interface LOCEventsViewController () <UITableViewDataSource, UITabBarDelegate>
{
    NSMutableArray *_events;
    LOCEvent *_event;
    NSMutableArray *_properties;
}

@property (weak, nonatomic) IBOutlet UITableView *eventsTableView;

@end

@implementation LOCEventsViewController

//static NSString *const kLOCBaseURL = @"http://160.16.104.144:3000/users";
static NSString *const kLOCBaseURL = @"http://192.168.33.10/events.json";

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.eventsTableView registerNib:[UINib nibWithNibName:@"LOCEventTableViewCell" bundle:nil] forCellReuseIdentifier:@"LOCEventTableViewCell"];
    [self loadEvents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LOCEventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LOCEventTableViewCell"];
    if (!cell) {
        cell = [[LOCEventTableViewCell alloc] init];
    }
    
    if (_events) {
        LOCEvent *eventAtIndexPath = _events[indexPath.row];
        cell.titleLabel.text = eventAtIndexPath.title;
        cell.dateLabel.text = eventAtIndexPath.date;
        cell.timeLabel.text = eventAtIndexPath.time;
        cell.locationLabel.text = eventAtIndexPath.location;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [LOCEventTableViewCell cellHeight];
}

#pragma mark - Data

- (void)loadEvents
{
    _events = [[NSMutableArray alloc] init];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *urlString = [NSString stringWithFormat:@"%@", kLOCBaseURL];
    [manager GET:urlString
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             for (NSDictionary *object in responseObject) {
                 LOCEvent *event = [self createEventWithJSONDic:object];
                 [_events addObject:event];
             }
             [self.eventsTableView reloadData];
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"error:%@", error);
         }];
}

- (LOCEvent *)createEventWithJSONDic:(NSMutableDictionary *)JSONDic
{
    LOCEvent *event = [[LOCEvent alloc] init];

    event.identifier = JSONDic[@"id"];
    event.title = JSONDic[@"title"];
    event.date = JSONDic[@"date"];
    event.time = JSONDic[@"time"];
    event.location = JSONDic[@"location"];
    event.coverImageURL = JSONDic[@"cover_image"];
    event.url = [JSONDic[@"url"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    return event;
}

@end
