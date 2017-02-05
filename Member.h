//
//  Member.h
//  base2
//
//  Created by 歐力文 on 2017/2/2.
//  Copyright © 2017年 歐力文. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface Member : NSObject

@property (nonatomic, readonly, getter=getName) NSString *name;
@property (nonatomic, readonly, getter=getProfileImage) UIImage *profileImage;
@property (nonatomic, readonly, getter=getBackgroundImage) UIImage *backgroundImage;

- (instancetype)initWithJsonObject:(NSDictionary *)jsonObject;

@end
