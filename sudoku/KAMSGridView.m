//
//  KAMSGridView.m
//  sudoku
//
//  Created by Megan Shao on 9/12/14.
//  Copyright (c) 2014 Kathryn Aplin Megan Shao. All rights reserved.
//

#import "KAMSGridView.h"

@interface KAMSGridView() {
    NSMutableArray *_cells; // TODO add buttons to the cells. Have it be nested (rows and cols)
}

@end

@implementation KAMSGridView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        CGFloat size = CGRectGetHeight(frame);
        
        CGFloat buttonSize = size / 9.0; // TODO make it so we have black borders. Currently will cover all black;
        
        // Create 81 buttons that each respond when pressed.
        for (int col = 0; col < 9; ++col) {
            NSMutableArray *currentCol;
            for (int row = 0; row < 9; ++row) {
                CGRect buttonFrame = CGRectMake(col * buttonSize, row * buttonSize, buttonSize, buttonSize);
                UIButton* gridButton = [[UIButton alloc] initWithFrame:buttonFrame];
                [gridButton setBackgroundImage:[KAMSGridView imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
                [gridButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                // Each button's tag is [col][row]. So 87 means column 8 row 7.
                gridButton.tag = col * 10 + row;
                [gridButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
                
                [self addSubview:gridButton];
                [currentCol addObject:gridButton];
            }
            [_cells addObject:currentCol];
        }    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

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

- (void)buttonPressed:(id)sender
{
    // TODO have this printing in the view controller (needs to set up target action with VC for grid)
    NSLog(@"Button at column %d and row %d was pressed.", [sender tag] / 10, [sender tag] % 10);
}

// TODO set titles of each button to give them a value                 [gridButton setTitle:[NSString stringWithFormat:@"%d", initialGrid[col][row]] forState:UIControlStateNormal];
- (void)setValueAtRow:(int)row column:(int)column to:(int)value
{
    [(UIButton*) _cells[column][row] setTitle:[NSString stringWithFormat:@"%d", value] forState:UIControlStateNormal];
}


@end
