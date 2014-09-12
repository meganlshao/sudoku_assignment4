//
//  KAMSViewController.m
//  sudoku
//
//  Created by Megan Shao on 9/11/14.
//  Copyright (c) 2014 Kathryn Aplin Megan Shao. All rights reserved.
//

#import "KAMSViewController.h"

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
    UIView *_gridView;
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
    
    _gridView = [[UIView alloc] initWithFrame:gridFrame];
    _gridView.backgroundColor = [UIColor blackColor];
    
    CGFloat buttonSize = size / 9.0; // TODO make it so we have black borders. Currently will cover all black;
    
    // Create 81 buttons that each respond when pressed.
    for (int col = 0; col < 9; ++col) {
        for (int row = 0; row < 9; ++row) {
            CGRect buttonFrame = CGRectMake(col * buttonSize, row * buttonSize, buttonSize, buttonSize);
            UIButton* gridButton = [[UIButton alloc] initWithFrame:buttonFrame];
            [gridButton setBackgroundImage:[KAMSViewController imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
            [gridButton setTitle:[NSString stringWithFormat:@"%d", initialGrid[col][row]] forState:UIControlStateNormal];
            [gridButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            // Each button's tag is [col][row]. So 87 means column 8 row 7.
            gridButton.tag = col * 10 + row;
            [gridButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            
            [_gridView addSubview:gridButton];
        }
    }
    
    
    
    [self.view addSubview:_gridView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonPressed:(id)sender
{
    NSLog(@"Button at column %d and row %d was pressed.", [sender tag] / 10, [sender tag] % 10);
}

// obtained from http://stackoverflow.com/questions/6496441/creating-a-uiimage-from-a-uicolor-to-use-as-a-background-image-for-uibutton
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
