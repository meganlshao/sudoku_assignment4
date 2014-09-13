//
//  KAMSViewController.m
//  sudoku
//
//  Created by Megan Shao on 9/11/14.
//  Copyright (c) 2014 Kathryn Aplin Megan Shao. All rights reserved.
//

#import "KAMSViewController.h"
#import "KAMSGridView.h"

// Initial grid provided in assignment 4.
int initialGrid[9][9] = {
    {7, 0, 0, 4, 2, 0, 0, 0, 9}, // This is the first column! C does column major order.
    {0, 0, 9, 5, 0, 0 ,0 ,0, 4},
    {0, 2, 0, 6, 9, 0, 5, 0, 0},
    {6, 5, 0, 0, 0, 0, 4, 3, 0},
    {0, 8, 0, 0, 0, 6, 0, 0, 7},
    {0, 1, 0, 0, 4, 5, 6, 0, 0},
    {0, 0, 0, 8, 6, 0, 0, 0, 2},
    {3, 4, 0, 9, 0, 0, 1, 0, 0},
    {8, 0, 0, 3, 0, 2, 7, 4, 0}
};

@interface KAMSViewController () {
    KAMSGridView *_gridView;
}

@end

@implementation KAMSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create black square view. Uses code from ViewTutorial (Assignment 3).
    CGRect frame = self.view.frame;
    CGFloat x = CGRectGetWidth(frame) * .1;
    CGFloat y = CGRectGetHeight(frame) * .1;
    CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame)) * .8;
    CGRect gridFrame = CGRectMake(x, y, size, size);
    
    _gridView = [[KAMSGridView alloc] initWithFrame:gridFrame];
    [_gridView setTarget:self action:@selector(gridCellSelected:)];

    
    [self.view addSubview:_gridView];
    
    // Set initial values
    for (int col = 0; col < 9; ++col) {
        for (int row = 0; row < 9; ++row) {
            int value = initialGrid[col][row];
            if (value != 0) {
                [_gridView setValueAtRow:row column:col to:value];
            }
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gridCellSelected:(NSNumber*)tag
{
    // TODO have this printing in the view controller (needs to set up target action with VC for grid)
    NSLog(@"Button at column %d and row %d was pressed.", [tag intValue] / 10, [tag intValue] % 10);
    //NSLog(@"message");
}

@end
