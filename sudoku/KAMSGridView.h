//
//  KAMSGridView.h
//  sudoku
//
//  Created by Megan Shao on 9/12/14.
//  Copyright (c) 2014 Kathryn Aplin Megan Shao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KAMSGridView : UIView

-(void)setValueAtRow:(int)row column:(int)column to:(int)value;
-(void) setTarget:(id)target action:(SEL)action;

@end
