//
//  MarvelCharacterProvider.h
//  base2
//
//  Created by 歐力文 on 2017/2/2.
//  Copyright © 2017年 歐力文. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Camp;

@interface MarvelCharacterProvider : NSObject

+ (MarvelCharacterProvider *)sharedProvider;
- (NSArray<Camp *> *)camps;

@end
