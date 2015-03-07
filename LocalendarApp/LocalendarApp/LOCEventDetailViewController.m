//
//  LOCEventDetailViewController.m
//  LocalendarApp
//
//  Created by Yoshiyuki Kuga on 2015/02/28.
//  Copyright (c) 2015年 Gruppy. All rights reserved.
//

#import "LOCEventDetailViewController.h"

@interface LOCEventDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *eventImageView;
@property (weak, nonatomic) IBOutlet UIImageView *dateIcon;
@property (weak, nonatomic) IBOutlet UIImageView *timeIcon;
@property (weak, nonatomic) IBOutlet UIImageView *locationIcon;
@property (weak, nonatomic) IBOutlet UIImageView *urlIcon;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;

@end

@implementation LOCEventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self setupLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void)setupLabels
{
    self.title = _event.title;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:_event.eventImage]];
    self.eventImageView.image = [[UIImage alloc] initWithData:data];
    self.dateLabel.text = _event.date;
    self.timeLabel.text = _event.time;
    self.locationLabel.text = _event.location;
    self.urlLabel.text = _event.url;
}
*/
@end
