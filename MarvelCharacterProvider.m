//
//  MarvelCharacterProvider.m
//  base2
//
//  Created by 歐力文 on 2017/2/2.
//  Copyright © 2017年 歐力文. All rights reserved.
//

#import "MarvelCharacterProvider.h"
#import "Camp.h"

@interface MarvelCharacterProvider()

@property (nonatomic, readwrite) NSArray<Camp *> *campArray;

@end

@implementation MarvelCharacterProvider

- (instancetype)init
{
    self = [super init];
    
    return self;
}

+ (MarvelCharacterProvider *)sharedProvider
{
    static MarvelCharacterProvider *provider;
    if(!provider)
    {
        provider = [[MarvelCharacterProvider alloc] init];
    }
    
    return provider;
}

- (NSArray<Camp *> *)camps
{
    if(self.campArray)
    {
        return self.campArray;
    }
    NSDictionary *json = [self readFile];
    
    NSMutableArray *campArray = [[NSMutableArray alloc] initWithCapacity:json.count];
    for (NSDictionary* camp in json) {
        Camp *campObject = [[Camp alloc] initCampWithJsonObject:camp];
        [campArray addObject:campObject];
    }
    self.campArray = campArray;
    return [campArray copy];
}

- (NSDictionary *)readFile
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Week1_Character" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    return json;
}

@end
