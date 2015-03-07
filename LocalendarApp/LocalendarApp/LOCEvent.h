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
@property (nonatomic, retain) NSNumber *month;
@property (nonatomic, retain) NSNumber *day;
@property (nonatomic, retain) NSString *week;
@property (nonatomic, retain) NSNumber *time;
@property (nonatomic, retain) NSString *place;
@property (nonatomic, retain) NSString *hall;
@property (nonatomic, retain) NSString *contents;
@property (nonatomic, retain) NSString *tel;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSArray *type;

@property (nonatomic, retain) NSNumber *isBookmarked;
@property (nonatomic, retain) NSNumber *lat;
@property (nonatomic, retain) NSNumber *lng;

@end
