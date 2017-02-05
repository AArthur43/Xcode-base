//
//  CharacterTableCell.m
//  base2
//
//  Created by 歐力文 on 2017/1/13.
//  Copyright © 2017年 歐力文. All rights reserved.
//

#import "CharacterTableCell.h"
//#import "Character.h"
#import "Member.h"

@interface CharacterTableCell()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation CharacterTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //圓角（取最小尺寸為基準）
    [self.profileImageView.layer setMasksToBounds:YES];
    CGFloat min = MIN(self.profileImageView.bounds.size.width, self.profileImageView.bounds.size.height);
    //CGFloat diff = max - min;
    CGFloat borderWidth = min;
    [self.profileImageView setBounds:CGRectMake(self.profileImageView.bounds.origin.x, self.profileImageView.bounds.origin.y, borderWidth, borderWidth)];

    [self.profileImageView.layer setCornerRadius:borderWidth/2.f];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//@synthesize character = _character;
//- (void)setCharacter:(Character *)character {
//    _character = character;
//    
//    [self.nameLabel setText:character.name];
//    [self.profileImageView setImage:[UIImage imageNamed:character.profileImageName]];
//    [self.backgroundImageView setImage:[UIImage imageNamed:character.backgroundImageName]];
//}

@synthesize member = _member;
-(void) setMember:(Member *) member{
    [self.backgroundImageView setImage:[member getBackgroundImage]];
    
    [self.profileImageView setImage:[member getProfileImage]];
    //= //[[UIImageView alloc] initWithImage:[member getProfileImage]];
    
    self.nameLabel.text = [member getName];
}

@end
