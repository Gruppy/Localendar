//
//  LOCEvent.h
//  LocalendarApp
//
//  Created by Yoshiyuki Kuga on 2015/02/21.
//  Copyright (c) 2015年 Gruppy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOCEvent : NSObject

@property (nonatomic, retain) NSNumber *identifier;
@property (nonatomic, retain) NSString *prefecture;
@property (nonatomic, retain) NSString *firstTitle;
@property (nonatomic, retain) NSString *secondTitle;
@property (nonatomic, retain) NSNumber *startYear;
@property (nonatomic, retain) NSNumber *startMonth;
@property (nonatomic, retain) NSNumber *startDay;
@property (nonatomic, retain) NSString *startWeek;
@property (nonatomic, retain) NSNumber *endYear;
@property (nonatomic, retain) NSNumber *endMonth;
@property (nonatomic, retain) NSNumber *endDay;
@property (nonatomic, retain) NSString *endWeek;
@property (nonatomic, retain) NSNumber *startHour;
@property (nonatomic, retain) NSNumber *startMinute;
@property (nonatomic, retain) NSNumber *endHour;
@property (nonatomic, retain) NSNumber *endMinute;
@property (nonatomic, retain) NSString *mainPlace;
@property (nonatomic, retain) NSString *detailPlace;
@property (nonatomic, retain) NSString *ticket;
@property (nonatomic, retain) NSString *tel;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSArray *type;

@end
