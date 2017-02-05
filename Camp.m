//
//  Camp.m
//  base2
//
//  Created by 歐力文 on 2017/2/2.
//  Copyright © 2017年 歐力文. All rights reserved.
//

#import "Camp.h"
#import "Member.h"

@interface Camp()

@property (nonatomic, readwrite, getter=getName) NSString *campName;
@property (nonatomic, readwrite, getter=getMembers) NSArray<Member *> *members;

@end

@implementation Camp

- (instancetype)initCampWithJsonObject:(NSDictionary *)jsonObject
{
    self.campName = [jsonObject valueForKey:@"campName"];
    
    NSArray *array = [jsonObject valueForKey:@"members"];
    
    NSMutableArray *memberArray = [[NSMutableArray alloc] initWithCapacity:array.count];
    
    for (NSDictionary* member in array) {
        Member *memberObject = [[Member alloc] initWithJsonObject:member];
        [memberArray addObject:memberObject];
    }
    self.members = [memberArray copy];
    
    return self;
}

@end
