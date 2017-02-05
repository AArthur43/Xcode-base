//
//  Camp.h
//  base2
//
//  Created by 歐力文 on 2017/2/2.
//  Copyright © 2017年 歐力文. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Member;

@interface Camp : NSObject

@property (nonatomic, readonly, getter=getName) NSString *campName;
@property (nonatomic, readonly, getter=getMembers) NSArray<Member *> *members;

- (instancetype)initCampWithJsonObject:(NSDictionary *)jsonObject;

@end
