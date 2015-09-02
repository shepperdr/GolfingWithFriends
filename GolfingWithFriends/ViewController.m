//
//  ViewController.m
//  GolfingWithFriends
//
//  Created by Robert Shepperd on 9/2/15.
//  Copyright © 2015 Robert Shepperd. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"
#import "PlayerController.h"
#import "PlayerTableViewCell.h"

static NSString * const PlayerCellKey = @"playerCell";


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) PlayerController *playerController;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Golf Bet Tracker";
    
    self.playerController = [PlayerController new];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width + 355, self.view.frame.size.height +100)];
    //    self.tableView.frame = self.view.frame;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.allowsSelection = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[PlayerTableViewCell class] forCellReuseIdentifier:PlayerCellKey];
    
    [self.view addSubview:self.tableView];
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    PlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PlayerCellKey];
    [cell updateWithPlayer:self.playerController.players[indexPath.row]];
    cell.backgroundColor = [UIColor greenColor];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.playerController.players.count;
}

- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}@end
