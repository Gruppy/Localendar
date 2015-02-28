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
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSString *time;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *eventImage;
@property (nonatomic, retain) NSString *descriptionText;

@property (nonatomic, retain) NSNumber *isBookmarked;
@property (nonatomic, retain) NSNumber *lat;
@property (nonatomic, retain) NSNumber *lng;
@property (nonatomic, retain) NSString *tel;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *address;

@end
