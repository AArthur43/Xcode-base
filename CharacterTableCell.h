//
//  CharacterTableCell.h
//  base2
//
//  Created by 歐力文 on 2017/1/13.
//  Copyright © 2017年 歐力文. All rights reserved.
//

#import <UIKit/UIKit.h>

//封裝
//@class Character;
@class Member;

@interface CharacterTableCell : UITableViewCell

//@property (nonatomic, setter=setCharacter:) Character *character;
@property (nonatomic, setter=setMember:) Member* member;

@end
