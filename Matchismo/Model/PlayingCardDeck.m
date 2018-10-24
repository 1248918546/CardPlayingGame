//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by ZJ on 2018/10/13.
//  Copyright © 2018 JZhang. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface PlayingCardDeck()

@end

@implementation PlayingCardDeck

-(instancetype)init {
    self = [super init];
    
    if(self) {
        for(NSString *suit in [PlayingCard validSuits]) {
            for(NSInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
