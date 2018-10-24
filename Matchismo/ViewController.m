//
//  ViewController.m
//  Matchismo
//
//  Created by ZJ on 2018/10/13.
//  Copyright © 2018 JZhang. All rights reserved.
//

#import "ViewController.h"
#import "Model/PlayingCardDeck.h"
#import "Model/CardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic, strong) CardMatchingGame *game;
@end

@implementation ViewController

-(Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

-(CardMatchingGame *)game {
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                         usingDeck:[self createDeck]];
    return _game;
}


- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI {
    for(UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score:@%ld", self.game.score];
}

- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.content : @"";
}

- (UIImage *)backImageForCard:(Card *)card {
    return [UIImage imageNamed:(card.isChosen ? @"cardfront" : @"cardback")];
}


@end
