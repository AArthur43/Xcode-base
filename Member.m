//
//  Member.m
//  base2
//
//  Created by 歐力文 on 2017/2/2.
//  Copyright © 2017年 歐力文. All rights reserved.
//

#import "Member.h"

@interface Member ()

@property (nonatomic, readwrite, getter=getName) NSString *name;
@property (nonatomic, readwrite, getter=getProfileImage) UIImage *profileImage;
@property (nonatomic, readwrite, getter=getBackgroundImage) UIImage *backgroundImage;

@end

@implementation Member

- (instancetype)initWithJsonObject:(NSDictionary *)jsonObject
{
    self = [super init];
    self.name = [jsonObject objectForKey:@"name"];
    self.profileImage = [UIImage imageNamed:[jsonObject objectForKey:@"profileImageName"]];
    self.backgroundImage = [UIImage imageNamed:[jsonObject objectForKey:@"backgroundImageName"]];
    return self;
}

@end
