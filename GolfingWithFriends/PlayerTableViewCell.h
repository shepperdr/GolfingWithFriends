//
//  PlayerTableViewCell.h
//  GolfingWithFriends
//
//  Created by Robert Shepperd on 9/2/15.
//  Copyright © 2015 Robert Shepperd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface PlayerTableViewCell : UITableViewCell

@property (strong, nonatomic) UITextField *playerNameField;

@property (strong, nonatomic) UILabel *playerTotal;
@property (strong, nonatomic) UILabel *playerTotalLabel;


@property (nonatomic) double stepValue;

@property (strong, nonatomic) UILabel *holeLabel;
@property (strong, nonatomic) UIStepper *holeStepper;
//@property (nonatomic) double holeStepValue;

@property (strong, nonatomic) UILabel *longDriveLabel;
@property (strong, nonatomic) UIStepper *longDriveStepper;
//@property (nonatomic) double longDriveStepValue;

@property (strong, nonatomic) UILabel *parThreeLabel;
@property (strong, nonatomic) UIStepper *parThreeStepper;
//@property (nonatomic) double parThreeStepValue;

@property (strong, nonatomic) UILabel *sideWagerLabel;
@property (strong, nonatomic) UIStepper *sideWagerStepper;
//@property (nonatomic) double sideWagerStepValue;

@property (strong, nonatomic) UILabel *holeNameLabel;
@property (strong, nonatomic) UILabel *longDriveNameLabel;
@property (strong, nonatomic) UILabel *parThreeNameLabel;
@property (strong, nonatomic) UILabel *sideWagerNameLabel;

- (void)updateWithPlayer:(Player *)player;


@end
