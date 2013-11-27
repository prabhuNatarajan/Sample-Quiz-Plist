//
//  PlayViewController.m
//  Quiz~Sample
//
//  Created by Apple on 26/11/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "PlayViewController.h"
#import "SettingsViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)resourcetype:(NSString *)type
{
    self.questionType = type;
    NSLog(@"Received%@", type);
    [self loadQuestion];
}

- (NSArray *)questions
{
    if (!_questions)
    {
        _questions = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.questionType ofType:@"plist"]];
    }
    else
    {
        _questions = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.questionType ofType:@"plist"]];
    }
    return _questions;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self resourcetype:self.questionType];
    self.backButton.hidden = YES;
    
}

- (void)loadQuestion
{
    NSString *path = [[NSBundle mainBundle]pathForResource:self.questionType ofType:@"plist"];
    NSDictionary *tempDictionary = [[NSDictionary alloc]initWithContentsOfFile:path];
    self.questions = [tempDictionary objectForKey:@"Main"];
    
    self.currentQuestion = -1;
    [self showNextQuestion];
    self.Score = 0;
    self.ScoreLabel.text = [NSString stringWithFormat:@"Score: %i", self.Score];
}

- (void)showNextQuestion
{
    self.currentQuestion ++;
    if (self.currentQuestion < [self.questions count])
    {
        NSDictionary *nextQuestion = [self.questions objectAtIndex:self.currentQuestion];
        self.answer = [nextQuestion objectForKey:@"Ans"];
        self.QuestionTitleButton.text = [nextQuestion objectForKey:@"Title"];
        self.AnswerLabelA.text = [nextQuestion objectForKey:@"A"];
        self.AnswerLabelB.text = [nextQuestion objectForKey:@"B"];
        if ([nextQuestion objectForKey:@"C"])
        {
            self.AnswerLabelC.hidden = NO;
            self.ButtonC.hidden = NO;
            self.AnswerLabelC.text = [nextQuestion objectForKey:@"C"];
        }
        else
        {
            self.AnswerLabelC.hidden = YES;
            self.ButtonC.hidden = YES;
        }
        if ([nextQuestion objectForKey:@"D"])
        {
            self.AnswerLabelD.hidden = NO;
            self.ButtonD.hidden = NO;
            self.AnswerLabelD.text = [nextQuestion objectForKey:@"D"];
        }
        else
        {
            self.AnswerLabelD.hidden = YES;
            self.ButtonD.hidden = YES;
        }
    }
    else
    {
        UIAlertView *gameOver = [[UIAlertView alloc]initWithTitle:@"Finished" message:@"Hurray! No more Questions" delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [gameOver show];
        self.backButton.hidden = NO;
        self.ButtonA.hidden = YES;
        self.ButtonB.hidden = YES;
        self.ButtonC.hidden = YES;
        self.ButtonD.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)AnswerButtonA:(id)sender
{
    if ([self.answer isEqualToString:@"A"])
    {
        self.numberCorrect ++;
        self.Score ++;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score: %i", self.Score];
    }
    [self showNextQuestion];
}

- (IBAction)AnswerButtonB:(id)sender
{
    if ([self.answer isEqualToString:@"B"])
    {
        self.numberCorrect ++;
        self.Score ++;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score: %i", self.Score];
    }
    [self showNextQuestion];
}

- (IBAction)AnswerButtonC:(id)sender
{
    if ([self.answer isEqualToString:@"C"])
    {
        self.numberCorrect ++;
        self.Score ++;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score: %i", self.Score];
    }
    [self showNextQuestion];
}

- (IBAction)AnswerButtonD:(id)sender
{
    if ([self.answer isEqualToString:@"D"])
    {
        self.numberCorrect ++;
        self.Score ++;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score: %i", self.Score];
    }
    [self showNextQuestion];
}

@end
