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

@property (nonatomic) int total;
@property (nonatomic) int numberAttended;

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"images.jpeg"]];
}

- (void)loadQuestion
{
    NSString *path = [[NSBundle mainBundle]pathForResource:self.questionType ofType:@"plist"];
    NSDictionary *tempDictionary = [[NSDictionary alloc]initWithContentsOfFile:path];
    self.questions = [tempDictionary objectForKey:@"Main"];
    
    self.currentQuestion = -1;
    [self showNextQuestion];
    self.Score = 0;
    self.numberAttended = 0;
    self.total = [self.questions count];
    NSLog(@"Total:%i", self.total);
}

- (void)showNextQuestion
{
    self.currentQuestion ++;
    self.numberAttended ++;
    if (self.currentQuestion < [self.questions count])
    {
        float percent = (((float) self.numberAttended / self.total)*100);
        if (percent == INFINITY)
        {
            self.ScoreLabel.text = [NSString stringWithFormat:@"Score: 0/0  progress: 0.00"];

        }
        else
        {
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score: %i/%i  progress: %.2f", self.Score, self.total, percent];
        }
        
        NSDictionary *nextQuestion = [self.questions objectAtIndex:self.currentQuestion];
        self.answer = [nextQuestion objectForKey:@"Ans"];
        self.QuestionTitleLabel.text = [nextQuestion objectForKey:@"Title"];
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
        float percent = (((float) self.numberAttended / self.total)*100);
        if (percent != INFINITY)
        {
            self.ScoreLabel.text = [NSString stringWithFormat:@"Score: %i/%i  progress: %.2f", self.Score, self.total, percent];
        }
        self.ButtonA.hidden = YES;
        self.ButtonB.hidden = YES;
        self.ButtonC.hidden = YES;
        self.ButtonD.hidden = YES;
        self.backButton.hidden = NO;
        self.skipButton.hidden = YES;
        self.AnswerLabelA.hidden = YES;
        self.AnswerLabelB.hidden = YES;
        self.AnswerLabelC.hidden = YES;
        self.AnswerLabelD.hidden = YES;
        self.QuestionTitleLabel.hidden = YES;
        [self.backButton setTitle:@"Choose Another Subject" forState:UIControlStateNormal];
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
        self.Score ++;
    }
    [self showNextQuestion];
}

- (IBAction)AnswerButtonB:(id)sender
{
    if ([self.answer isEqualToString:@"B"])
    {
        self.Score ++;
    }
    [self showNextQuestion];
}

- (IBAction)AnswerButtonC:(id)sender
{
    if ([self.answer isEqualToString:@"C"])
    {
        self.Score ++;
    }
    [self showNextQuestion];
}

- (IBAction)AnswerButtonD:(id)sender
{
    if ([self.answer isEqualToString:@"D"])
    {
        self.Score ++;
    }
    [self showNextQuestion];
}

- (IBAction)SkipButton:(id)sender
{
    self.numberAttended --;
    [self showNextQuestion];
}

@end
