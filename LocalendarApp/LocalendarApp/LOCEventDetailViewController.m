//
//  LOCEventDetailViewController.m
//  LocalendarApp
//
//  Created by Yoshiyuki Kuga on 2015/02/28.
//  Copyright (c) 2015年 Gruppy. All rights reserved.
//

#import "LOCEventDetailViewController.h"
#import "LOCEventWebViewController.h"

@interface LOCEventDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *firstTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *eventImageView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ticketLabel;
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
    
    self.eventImageView.layer.cornerRadius = 5.0f;
    self.eventImageView.clipsToBounds = YES;
    NSString *eventPlace = [NSString stringWithFormat:@"%@_%@", _event.mainPlace, _event.detailPlace];
    self.eventImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", eventPlace]];
    
    self.dateLabel.text = [NSString stringWithFormat:@"%@/%@ (%@)", _event.startMonth, _event.startDay, NSLocalizedString(_event.startWeek, nil)];
    self.timeLabel.text = [NSString stringWithFormat:@"%@:%@", _event.startHour, _event.startMinute];
    self.placeLabel.text = [NSString stringWithFormat:@"%@ (%@)", NSLocalizedString(_event.mainPlace, nil), NSLocalizedString(_event.detailPlace, nil)];
    if (!_event.ticket) {
        self.ticketLabel.text = NSLocalizedString(@"refer_to_the_HP", nil);
    } else {
        self.ticketLabel.text = _event.ticket;
    }
    self.telLabel.text = _event.tel;
    
    self.showDetailButton.layer.cornerRadius = 5.0f;
    [self.showDetailButton setTitle:[NSString stringWithFormat:@"%@のホームページヘ", NSLocalizedString(_event.mainPlace, nil)] forState:UIControlStateNormal];
}

#pragma mark - Action

- (IBAction)showDetailButtonTapped:(id)sender
{
    [self performSegueWithIdentifier:@"ToEventWebPage" sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ToEventWebPage"]) {
        LOCEventWebViewController *controller = (LOCEventWebViewController *)segue.destinationViewController;
        controller.urlString = _event.url;
    }
}

@end
