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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"%@のイベント", @"長崎県"];
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
        
        [self setupCellImgae:cell withEvent:eventAtIndexPath];
        cell.firstTitleLabel.text = eventAtIndexPath.firstTitle;
        cell.dateLabel.text = [NSString stringWithFormat:@"%@/%@", eventAtIndexPath.startMonth, eventAtIndexPath.startDay];
        cell.timeLabel.text = [NSString stringWithFormat:@"%@:%@", eventAtIndexPath.startHour, eventAtIndexPath.startMinute];
        cell.placeLabel.text = eventAtIndexPath.mainPlace;
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

- (void)setupCellImgae:(LOCEventTableViewCell *)cell
             withEvent:(LOCEvent *)event
{
    NSNumber *eventType = event.type[0];
    switch ([eventType integerValue]) {
        case 0:
            cell.typeImageView.image = [UIImage imageNamed:@"others.png"];
            break;
        case 1:
            cell.typeImageView.image = [UIImage imageNamed:@"student.png"];
            break;
        case 2:
            cell.typeImageView.image = [UIImage imageNamed:@"drama.png"];
            break;
        case 3:
            cell.typeImageView.image = [UIImage imageNamed:@"exhibition.png"];
            break;
        case 4:
            cell.typeImageView.image = [UIImage imageNamed:@"shopping.png"];
            break;
        case 5:
            cell.typeImageView.image = [UIImage imageNamed:@"seminar.png"];
            break;
        case 6:
            cell.typeImageView.image = [UIImage imageNamed:@"music.png"];
            break;
        default:
            break;
    }
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
    
    event.firstTitle = JSONDic[@"contents"];
    event.secondTitle = nil;
    
    event.startMonth = JSONDic[@"month"];
    event.startDay = JSONDic[@"day"];
    event.startWeek = JSONDic[@"week"];
    event.endMonth = nil;
    event.endDay = nil;
    event.endWeek = nil;
    
    event.startHour = JSONDic[@"time"];
    event.startMinute = JSONDic[@"time"];
    event.endHour = nil;
    event.endMinute = nil;
    
    event.mainPlace = JSONDic[@"place"];
    event.detailPlace = JSONDic[@"hall"];
    
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
