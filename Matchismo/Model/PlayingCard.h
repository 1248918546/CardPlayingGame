//
//  PlayingCard.h
//  Matchismo
//
//  Created by ZJ on 2018/10/13.
//  Copyright © 2018 JZhang. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSInteger rank;

+ (NSArray *)validSuits;
+ (NSInteger)maxRank;

@end
