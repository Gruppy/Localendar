//
//  LOCEventsViewController.m
//  LocalendarApp
//
//  Created by Yoshiyuki Kuga on 2015/02/11.
//  Copyright (c) 2015年 Gruppy. All rights reserved.
//

#import "LOCEventsViewController.h"
#import "LOCEventDetailViewController.h"
#import "LOCEventTableViewCell.h"
#import "LOCEvent.h"
#import "AFHTTPRequestOperationManager.h"

@interface LOCEventsViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_events;
    LOCEvent *_selectedEvent;
}

@property (weak, nonatomic) IBOutlet UITableView *eventsTableView;

@end

@implementation LOCEventsViewController

static NSString *const kLOCBaseURL = @"http://160.16.104.144:3000/hallinfos.json";
//static NSString *const kLOCBaseURL = @"http://192.168.33.10/events.json";

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"LOCAL";
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
        
//        NSString *eventImageName = [NSString stringWithFormat:@"%@", eventAtIndexPath.type[0]];
//        cell.eventImageView = [UIImage imageNamed:eventImageName];
        
        cell.titleLabel.text = eventAtIndexPath.contents;
        cell.dateLabel.text = [NSString stringWithFormat:@"%@/%@", eventAtIndexPath.month, eventAtIndexPath.day];
        cell.timeLabel.text = [NSString stringWithFormat:@"%@", eventAtIndexPath.time];
        cell.placeLabel.text = eventAtIndexPath.place;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [LOCEventTableViewCell cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedEvent = _events[indexPath.row];
    [self performSegueWithIdentifier:@"ToEventDetail" sender:self];
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
    event.month = JSONDic[@"month"];
    event.day = JSONDic[@"day"];
    event.time = JSONDic[@"time"];
    event.place = JSONDic[@"place"];
    event.hall = JSONDic[@"hall"];
    event.contents = JSONDic[@"contents"];
    event.tel = JSONDic[@"tell"];
    event.url = [JSONDic[@"url"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    event.type = JSONDic[@"type"];

    return event;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ToEventDetail"]) {
        LOCEventDetailViewController *controller = segue.destinationViewController;
        controller.event = _selectedEvent;
    }
}

@end
