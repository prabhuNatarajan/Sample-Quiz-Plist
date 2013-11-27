//
//  SettingsViewController.m
//  Quiz~Sample
//
//  Created by Apple on 26/11/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "SettingsViewController.h"
#import "PlayViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mathameticsButton:(id)sender
{
    NSString * storyboardName = @"Main";
    NSString * viewControllerID = @"PlayViewController";
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    PlayViewController * controller = (PlayViewController *)[storyboard instantiateViewControllerWithIdentifier:viewControllerID];
    controller.questionType= [NSString stringWithFormat:@"Maths"];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)scienceButton:(id)sender
{
    NSString * storyboardName = @"Main";
    NSString * viewControllerID = @"PlayViewController";
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    PlayViewController * controller = (PlayViewController *)[storyboard instantiateViewControllerWithIdentifier:viewControllerID];
    controller.questionType= [NSString stringWithFormat:@"Science"];
    [self presentViewController:controller animated:YES completion:nil];
}

@end
