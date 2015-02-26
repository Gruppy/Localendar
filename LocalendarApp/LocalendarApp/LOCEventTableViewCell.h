//
//  LOCEventTableViewCell.h
//  LocalendarApp
//
//  Created by Yoshiyuki Kuga on 2015/02/11.
//  Copyright (c) 2015年 Gruppy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LOCEventTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *eventImageView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

+ (float)cellHeight;

@end
