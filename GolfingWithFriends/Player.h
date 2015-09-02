//
//  Player.h
//  GolfingWithFriends
//
//  Created by Robert Shepperd on 9/2/15.
//  Copyright © 2015 Robert Shepperd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger hole;
@property (nonatomic) NSInteger longDrive;
@property (nonatomic) NSInteger parThree;
@property (nonatomic) NSInteger sideWager;
@property (nonatomic) NSInteger playerTotal;


@end
