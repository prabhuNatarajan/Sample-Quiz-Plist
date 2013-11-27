//
//  PlayViewController.h
//  Quiz~Sample
//
//  Created by Apple on 26/11/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayViewController : UIViewController
- (IBAction)Back:(id)sender;
- (IBAction)AnswerButtonA:(id)sender;
- (IBAction)AnswerButtonB:(id)sender;
- (IBAction)AnswerButtonC:(id)sender;
- (IBAction)AnswerButtonD:(id)sender;
- (IBAction)SkipButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *skipButton;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UILabel *QuestionTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *AnswerLabelA;
@property (strong, nonatomic) IBOutlet UILabel *AnswerLabelB;
@property (strong, nonatomic) IBOutlet UILabel *AnswerLabelC;
@property (strong, nonatomic) IBOutlet UILabel *AnswerLabelD;
@property (strong, nonatomic) IBOutlet UIButton *ButtonA;
@property (strong, nonatomic) IBOutlet UIButton *ButtonB;
@property (strong, nonatomic) IBOutlet UIButton *ButtonC;
@property (strong, nonatomic) IBOutlet UIButton *ButtonD;
@property (strong, nonatomic) IBOutlet UILabel *ScoreLabel;

@property (strong, nonatomic) NSString *questionType;
@property (strong, nonatomic) NSArray *questions;
@property (strong, nonatomic) NSString *answer;
@property (nonatomic) int currentQuestion;
@property (nonatomic) int Score;

- (void)showNextQuestion;
- (void)resourcetype:(NSString *)type;

@end
