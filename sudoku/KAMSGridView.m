//
//  KAMSGridView.m
//  sudoku
//
//  Created by Megan Shao on 9/12/14.
//  Copyright (c) 2014 Kathryn Aplin Megan Shao. All rights reserved.
//

#import "KAMSGridView.h"

float OUTER_GRID_RATIO = 0.5;
float INNER_GRID_RATIO = 0.25;

@interface KAMSGridView() {
    NSMutableArray* _cells;
    id _target;
    SEL _action;
}

@end

@implementation KAMSGridView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        CGFloat size = CGRectGetHeight(frame);
        
        CGFloat buttonSize = size / (9 + 4 * OUTER_GRID_RATIO + 6 * INNER_GRID_RATIO);
        
        _cells = [[NSMutableArray alloc] initWithCapacity: 9];
        // Create 81 buttons that each respond when pressed.
        for (int col = 0; col < 9; ++col) {
            NSMutableArray *currentCol = [[NSMutableArray alloc] initWithCapacity: 9];
            for (int row = 0; row < 9; ++row) {
                int offsetX = buttonSize * OUTER_GRID_RATIO + ((col / 3) * (buttonSize * OUTER_GRID_RATIO)) + (((col / 3) * 2) + (col % 3)) * (buttonSize * INNER_GRID_RATIO);
                int offsetY = buttonSize * OUTER_GRID_RATIO + ((row / 3) * (buttonSize * OUTER_GRID_RATIO)) + (((row / 3) * 2) + (row % 3)) * (buttonSize * INNER_GRID_RATIO);
                CGRect buttonFrame = CGRectMake(offsetX + col * buttonSize, offsetY + row * buttonSize, buttonSize, buttonSize);
                UIButton* gridButton = [[UIButton alloc] initWithFrame:buttonFrame];
                [gridButton setBackgroundImage:[KAMSGridView imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
                [gridButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                // Each button's tag is [col][row]. So 87 means column 8 row 7.
                gridButton.tag = col * 10 + row;
                [gridButton addTarget:self action:@selector(cellSelected:) forControlEvents:UIControlEventTouchUpInside];
                
                [self addSubview:gridButton];
                [currentCol addObject:gridButton];
            }
            [_cells addObject:currentCol];
        }
    }
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

// Obtained from http://stackoverflow.com/questions/6496441/creating-a-uiimage-from-a-uicolor-to-use-as-a-background-image-for-uibutton
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

- (void)setValueAtRow:(int)row column:(int)column to:(int)value
{
    UIButton* temp = [[_cells objectAtIndex:column] objectAtIndex:row];
    [temp setTitle:[NSString stringWithFormat:@"%d", value] forState:UIControlStateNormal];
    [temp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

- (void)cellSelected:(id)sender
{
    // Communicating with viewController.
    [_target performSelector:_action withObject:[NSNumber numberWithInt:[sender tag]]];
}

-(void) setTarget:(id)target action:(SEL)action
{
    _target = target;
    _action = action;
}

@end
