//
//  PlayerController.m
//  GolfingWithFriends
//
//  Created by Robert Shepperd on 9/2/15.
//  Copyright © 2015 Robert Shepperd. All rights reserved.
//

#import "PlayerController.h"
#import "Player.h"

@implementation PlayerController

- (instancetype)init;
{
    self = [super init];
    if (self) {
        Player *playerOne = [Player new];
        playerOne.name = @"";
        playerOne.hole = 0;
        playerOne.longDrive = 0;
        playerOne.parThree = 0;
        playerOne.sideWager = 0;
        playerOne.playerTotal = 0;
        
        Player *playerTwo = [Player new];
        playerTwo.name = @"";
        playerTwo.hole = 0;
        playerTwo.longDrive = 0;
        playerTwo.parThree = 0;
        playerTwo.sideWager = 0;
        playerTwo.playerTotal = 0;
        
        Player *playerThree = [Player new];
        playerThree.name = @"";
        playerThree.hole = 0;
        playerThree.longDrive = 0;
        playerThree.parThree = 0;
        playerThree.sideWager = 0;
        playerThree.playerTotal= 0;
        
        Player *playerFour = [Player new];
        playerFour.name = @"";
        playerFour.hole = 0;
        playerFour.longDrive = 0;
        playerFour.parThree = 0;
        playerFour.sideWager = 0;
        playerFour.playerTotal = 0;

        self.players = @[playerOne, playerTwo, playerThree, playerFour];
        
    }
    
    return self;
}

@end
