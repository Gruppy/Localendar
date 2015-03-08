//
//  LOCEventDetailViewController.m
//  LocalendarApp
//
//  Created by Yoshiyuki Kuga on 2015/02/28.
//  Copyright (c) 2015年 Gruppy. All rights reserved.
//

#import "LOCEventDetailViewController.h"

@interface LOCEventDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *firstTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *eventImageView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UIButton *showDetailButton;

@end

@implementation LOCEventDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup
{
    self.firstTitleLabel.text = _event.firstTitle;
    self.secondTitleLabel.text = _event.secondTitle;
    [self setupImage];
    self.dateLabel.text = [NSString stringWithFormat:@"%@/%@", _event.startMonth, _event.startDay];
    self.timeLabel.text = [NSString stringWithFormat:@"%@:%@", _event.startHour, _event.startMinute];
    self.placeLabel.text = [NSString stringWithFormat:@"%@（%@）", _event.mainPlace, _event.detailPlace];
    self.telLabel.text = _event.tel;
    self.showDetailButton.layer.cornerRadius = 5.0f;
}

- (void)setupImage
{
    self.eventImageView.layer.cornerRadius = 5.0f;
    self.eventImageView.clipsToBounds = YES;
    
    if ([_event.mainPlace isEqualToString:@"アルカス佐世保"]) {
        if ([_event.detailPlace isEqualToString:@"大ホール"]) {
            self.eventImageView.image = [UIImage imageNamed:@"arukas_lerge_hall.jpg"];
        } else if ([_event.detailPlace isEqualToString:@"中ホール"]) {
            self.eventImageView.image = [UIImage imageNamed:@"arukas_medium_hall.jpg"];
        } else if ([_event.detailPlace isEqualToString:@"イベントホール"]) {
            self.eventImageView.image = [UIImage imageNamed:@"arukas_event_hall.jpg"];
        }
    } else if ([_event.mainPlace isEqualToString:@"長崎ブリックホール"]) {
        if ([_event.detailPlace isEqualToString:@"大ホール"]) {
            self.eventImageView.image = [UIImage imageNamed:@"brick_lerge_hall.jpg"];
        } else if ([_event.detailPlace isEqualToString:@"国際会議場"]) {
            self.eventImageView.image = [UIImage imageNamed:@"brick_international_discussion_room.jpg"];
        }
    }
}

@end
