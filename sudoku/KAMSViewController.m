//
//  KAMSViewController.m
//  sudoku
//
//  Created by Megan Shao on 9/11/14.
//  Copyright (c) 2014 Kathryn Aplin Megan Shao. All rights reserved.
//

#import "KAMSViewController.h"

@interface KAMSViewController () {
    UIButton* _button;
}

@end

@implementation KAMSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // create button
    CGRect frame = self.view.frame;
    _button = [[UIButton alloc] initWithFrame:frame];
    [_button setTitle:@"Button" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _button.tag = 1;
    [self.view addSubview: _button];
    
    [_button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonPressed:(id)sender
{
    NSLog(@"Button %d was pressed.", [sender tag]);
}

@end
