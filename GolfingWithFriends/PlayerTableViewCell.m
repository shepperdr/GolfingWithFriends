//
//  PlayerTableViewCell.m
//  GolfingWithFriends
//
//  Created by Robert Shepperd on 9/2/15.
//  Copyright © 2015 Robert Shepperd. All rights reserved.
//

#import "PlayerTableViewCell.h"
#import "Player.h"
#import "PlayerController.h"

static CGFloat margin = 50;
static CGFloat elementHeight = 44;
static CGFloat titleHeight = -70;

@implementation PlayerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat nameFieldWidth = 120;
        CGFloat holeFieldWidth = 44;
        CGFloat holeStepperButtonWidth = 25;
        CGFloat longDriveFieldWidth = 44;
        CGFloat longDriveStepperButtonWidth = 25;
        CGFloat parThreeFieldWidth = 44;
        CGFloat parThreeStepperButtonWidth = 25;
        CGFloat sideWagerFieldWidth = 44;
        CGFloat sideWagerStepperButtonWidth = 25;
        
        
        
        
        self.playerNameField = [UITextField new];
        self.playerNameField.frame = CGRectMake(margin, margin, nameFieldWidth, elementHeight);
        self.playerNameField.placeholder = @"Name";
        [self.contentView addSubview:self.playerNameField];
        self.playerNameField.font = [UIFont fontWithName:@"Marker Felt" size:20.0];
        
        
        
        
        self.holeLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin + nameFieldWidth -15, margin, holeFieldWidth, elementHeight)];
        self.holeLabel.text = @"0";
        self.holeLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.holeLabel];
        self.holeLabel.tag = 1;
        self.holeLabel.font = [UIFont fontWithName:@"Marker Felt" size:20.0];
        
        self.holeNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin + nameFieldWidth -15, margin, holeFieldWidth, titleHeight)];
        self.holeNameLabel.text = @"Hole";
        self.holeNameLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.holeNameLabel];
        self.holeNameLabel.font = [UIFont fontWithName:@"Marker Felt" size:20.0];
        
        self.holeStepper = [[UIStepper alloc] initWithFrame:CGRectMake(margin + nameFieldWidth -40, 30, holeStepperButtonWidth, 44)];
        self.holeStepper.maximumValue = 1000;
        self.holeStepper.minimumValue = 0;
        _holeStepper.stepValue = 2;
        
        [self.holeStepper addTarget:self action:@selector(holeStepperChanged:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:self.holeStepper];
        self.holeStepper.backgroundColor = [UIColor whiteColor];
        
        
        self.longDriveLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin + nameFieldWidth + 85, margin, longDriveFieldWidth, elementHeight)];
        self.longDriveLabel.text = @"0";
        self.longDriveLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.longDriveLabel];
        self.longDriveLabel.tag = 2;
        self.longDriveLabel.font = [UIFont fontWithName:@"Marker Felt" size:20.0];
        
        self.longDriveNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin + nameFieldWidth + 85, margin, longDriveFieldWidth, titleHeight)];
        self.longDriveNameLabel.text = @"LD";
        self.longDriveNameLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.longDriveNameLabel];
        self.longDriveNameLabel.font = [UIFont fontWithName:@"Marker Felt" size:20.0];
        
        self.longDriveStepper = [[UIStepper alloc] initWithFrame:CGRectMake(65 + nameFieldWidth + longDriveFieldWidth, 30, longDriveStepperButtonWidth, 44)];
        self.longDriveStepper.maximumValue = 1000;
        self.longDriveStepper.minimumValue = 0;
        _longDriveStepper.stepValue = 5;
        
        [self.longDriveStepper addTarget:self action:@selector(longDriveStepperChanged:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:self.longDriveStepper];
        self.longDriveStepper.backgroundColor = [UIColor whiteColor];
        
        
        self.parThreeLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin + nameFieldWidth + 185, margin, parThreeFieldWidth, elementHeight)];
        self.parThreeLabel.text = @"0";
        self.parThreeLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.parThreeLabel];
        self.parThreeLabel.tag = 3;
        self.parThreeLabel.font = [UIFont fontWithName:@"Marker Felt" size:20.0];
        
        self.parThreeStepper = [[UIStepper alloc] initWithFrame:CGRectMake(165 + nameFieldWidth + holeFieldWidth, 30, parThreeStepperButtonWidth, 44)];
        self.parThreeStepper.maximumValue = 1000;
        self.parThreeStepper.minimumValue = 0;
        _parThreeStepper.stepValue = 5;
        
        [self.parThreeStepper addTarget:self action:@selector(parThreeStepperChanged:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:self.parThreeStepper];
        
        self.parThreeNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin + nameFieldWidth + 185, margin, parThreeFieldWidth, titleHeight)];
        self.parThreeNameLabel.text = @"Par3";
        self.parThreeNameLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.parThreeNameLabel];
        self.parThreeStepper.backgroundColor = [UIColor whiteColor];
        self.parThreeNameLabel.font = [UIFont fontWithName:@"Marker Felt" size:20.0];
        
        self.sideWagerLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin + nameFieldWidth + 285, margin, sideWagerFieldWidth, elementHeight)];
        self.sideWagerLabel.text = @"0";
        self.sideWagerLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.sideWagerLabel];
        self.sideWagerLabel.tag = 4;
        self.sideWagerLabel.font = [UIFont fontWithName:@"Marker Felt" size:20.0];
        
        self.sideWagerStepper = [[UIStepper alloc] initWithFrame:CGRectMake(265 + nameFieldWidth + holeFieldWidth, 30, sideWagerStepperButtonWidth, 44)];
        self.sideWagerStepper.maximumValue = 1000;
        self.sideWagerStepper.minimumValue = 0;
        _sideWagerStepper.stepValue = 5;
        
        [self.sideWagerStepper addTarget:self action:@selector(sideWagerStepperChanged:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:self.sideWagerStepper];
        
        self.sideWagerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin + nameFieldWidth + 285, margin, sideWagerFieldWidth, titleHeight)];
        self.sideWagerNameLabel.text = @"Side";
        self.sideWagerNameLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.sideWagerNameLabel];
        self.sideWagerStepper.backgroundColor = [UIColor whiteColor];
        self.sideWagerNameLabel.font = [UIFont fontWithName:@"Marker Felt" size:20.0];
        
        self.playerTotal = [[UILabel alloc]initWithFrame:CGRectMake(margin + nameFieldWidth + 355, margin, nameFieldWidth, titleHeight + 114)];
        self.playerTotal.text = @"0";
        self.playerTotal.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.playerTotal];
        self.playerTotal.font = [UIFont fontWithName:@"Marker Felt" size:20.0];
        
        
        self.playerTotalLabel = [[UILabel alloc]initWithFrame:CGRectMake(margin + nameFieldWidth + 385, margin, sideWagerFieldWidth, titleHeight)];
        self.playerTotalLabel.text = @"Total";
        self.playerTotalLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.playerTotalLabel];
        self.playerTotalLabel.font = [UIFont fontWithName:@"Marker Felt" size:20.0];
        
        
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)holeStepperChanged:(UIStepper *)holeStepper {
    
    int hole = holeStepper.value;
    self.holeLabel.text = [NSString stringWithFormat:@"%d", hole];
    
    
}

- (void)longDriveStepperChanged:(UIStepper *)longDriveStepper {
    
    int longDriveScore = longDriveStepper.value;
    self.longDriveLabel.text = [NSString stringWithFormat:@"%d", longDriveScore];
    
    
}

- (void)parThreeStepperChanged:(UIStepper *)parThreeStepper {
    
    int parThreeScore = parThreeStepper.value;
    self.parThreeLabel.text = [NSString stringWithFormat:@"%d", parThreeScore];
    
}

- (void)sideWagerStepperChanged:(UIStepper *)sideWagerStepper {
    int sideWagerScore = sideWagerStepper.value;
    self.sideWagerLabel.text = [NSString stringWithFormat:@"%d", sideWagerScore];
    
    
    
}

//- (void)allSteppersAdded:(UILabel *)playerTotal {
//    int playerTotal = ;
//    self.playerTotal.text = [NSString stringWithFormat:@"%@", playerTotal];
//
//}



- (void)updateWithPlayer:(Player *)player {
    self.playerNameField.text = player.name;
    self.holeLabel.text = [NSString stringWithFormat:@"%ld", (long)player.hole];
    self.holeStepper.value = player.hole;
    
    self.longDriveLabel.text = [NSString stringWithFormat:@"%ld", (long)player.longDrive];
    self.longDriveStepper.value = player.longDrive;
    
    self.parThreeLabel.text = [NSString stringWithFormat:@"%ld", (long)player.parThree];
    self.parThreeStepper.value = player.parThree;
    
    self.sideWagerLabel.text = [NSString stringWithFormat:@"%ld", (long)player.sideWager];
    self.sideWagerStepper.value = player.sideWager;
    
    //    NSMutableArray *totalArray = @[player.hole, player.longDrive, player.parThree, player.sideWager];
    //
    //    self.playerTotal.text = [NSString stringWithFormat:@"%@", totalArray];
    //
    
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
