//
//  ViewController.m
//  base2
//
//  Created by 歐力文 on 2017/1/13.
//  Copyright © 2017年 歐力文. All rights reserved.
//

#import "ViewController.h"
#import "CharacterTableCell.h"
#import "Character.h"

#import "MarvelCharacterProvider.h"
#import "Camp.h"
#import "Member.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark  Status

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[MarvelCharacterProvider sharedProvider].camps count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[[[MarvelCharacterProvider sharedProvider].camps objectAtIndex:section] getMembers] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //製作可重複利用的表格欄位Cell
    CharacterTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CharacterCell"];
    
    if (!cell) {
//        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell = [[CharacterTableCell alloc] init];
    }
    
//    Character *character = ((NSArray *) _sides[indexPath.section])[indexPath.row];
    
//    cell.character = character;
    
    NSArray<Camp*> *array = [MarvelCharacterProvider sharedProvider].camps;
    Camp *camp = array[indexPath.section];
    NSArray *memberArray = [camp getMembers];
    Member *m = memberArray[indexPath.row];
    [cell setMember:m];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

//    NSMutableArray *characters = _sides[indexPath.section];
    NSArray<Camp*> *array = [MarvelCharacterProvider sharedProvider].camps;
    Camp *camp = array[indexPath.section];
    NSMutableArray *memberArray = [NSMutableArray arrayWithArray:[camp getMembers]];
    [memberArray removeObjectAtIndex:indexPath.row];
    //tes1
}

- (void)tableView:(UITableView*)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath*)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray<Camp*> *array = [MarvelCharacterProvider sharedProvider].camps;
    Camp *camp = array[section];
    return [camp getName];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0f;
}

@end
