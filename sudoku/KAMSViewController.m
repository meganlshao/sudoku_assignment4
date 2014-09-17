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
// Note that we access this grid in row major order. This means that our
// displayed grid is the transpose of the screenshot in assignment 4. However,
// the screenshot assumed column major order, which C is not. Our grid then
// displays the transpose of the grid in the screenshot, so it is still a valid
// grid.
static int INITIAL_GRID[9][9] = {
    {7, 0, 0, 4, 2, 0, 0, 0, 9},
    {0, 0, 9, 5, 0, 0 ,0 ,0, 4},
    {0, 2, 0, 6, 9, 0, 5, 0, 0},
    {6, 5, 0, 0, 0, 0, 4, 3, 0},
    {0, 8, 0, 0, 0, 6, 0, 0, 7},
    {0, 1, 0, 0, 4, 5, 6, 0, 0},
    {0, 0, 0, 8, 6, 0, 0, 0, 2},
    {3, 4, 0, 9, 0, 0, 1, 0, 0},
    {8, 0, 0, 3, 0, 2, 7, 4, 0}
};

static float GRID_FRAME_SIZE_FACTOR = 0.8;

@interface KAMSViewController () {
    KAMSGridView *_gridView;
}

@end

@implementation KAMSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initializeGridView];
    
    [self setInitialGridValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gridCellSelectedAtRow:(NSNumber*)row column:(NSNumber*)column
{
    NSLog(@"Button at column %@ and row %@ was pressed.", column, row);
}

/*
 * Create gridView frame. Uses code from ViewTutorial (Assignment 3).
 */
- (void)initializeGridView
{
    float offsetFactor = (1 - GRID_FRAME_SIZE_FACTOR) / 2.0;
    
    CGRect frame = self.view.frame;
    CGFloat x = CGRectGetWidth(frame) * offsetFactor;
    CGFloat y = CGRectGetHeight(frame) * offsetFactor;
    CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame))
        * GRID_FRAME_SIZE_FACTOR;
    CGRect gridFrame = CGRectMake(x, y, size, size);
    
    _gridView = [[KAMSGridView alloc] initWithFrame:gridFrame];
    
    [_gridView setTarget:self action:@selector(gridCellSelectedAtRow:column:)];
    [self.view addSubview:_gridView];
}

- (void)setInitialGridValues
{
    for (int col = 0; col < 9; ++col) {
        for (int row = 0; row < 9; ++row) {
            int value = INITIAL_GRID[row][col];
            // 0 represents an empty cell
            if (value != 0) {
                [_gridView setValueAtRow:row atColumn:col toValue:value];
            }
        }
    }
}

@end
