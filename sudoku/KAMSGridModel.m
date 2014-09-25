//
//  KAMSGridModel.m
//  sudoku
//
//  Created by Kathryn Aplin on 9/20/14.
//  Copyright (c) 2014 Kathryn Aplin Megan Shao. All rights reserved.
//

#import "KAMSGridModel.h"

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

@interface KAMSGridModel () {
    int _initialGrid[9][9];
    int _currentGrid[9][9];
}

@end

@implementation KAMSGridModel

/**
 * Generates a playable sudoku grid.
 */
-(void) generateGrid
{
    for (int row = 0; row < 9; row++) {
        for (int col = 0; col < 9; col++) {
            // initialGrid is accessible for the entire game.
            // INITIAL_GRID is theoretically not - could be generated.
            _initialGrid[row][col] = INITIAL_GRID[row][col];
            _currentGrid[row][col] = _initialGrid[row][col];
        }
    }
}

/**
 * Gets the value of the current grid at the given coordinates.
 */
-(int) getValueAtRow:(int)row atColumn:(int)column
{
    return _currentGrid[row][column];
}

/**
 * Sets the value of the current grid at the given coordinates to the given
 * value. Assumes the given values are correct, following the architecture
 * discussed in class.
 */
-(void) setValueAtRow:(int)row atColumn:(int)column toValue:(int)value
{
    _currentGrid[row][column] = value;
}

/**
 * Checks whether the coordiantes are of an initial value.
 */
-(BOOL) isMutableAtRow:(int)row atColumn:(int)column
{
    return _initialGrid[row][column] == 0;
}

/**
 * Checks the given value at the given coordiates for consistency with sudoku
 * rules.
 */
-(BOOL) isConsistentAtRow:(int)row atColumn:(int)column forValue:(int)value
{
    BOOL rowConsistent = [self isRowConsistentAtRow:row forValue:value];
    BOOL colConsistent = [self isColumnConsistentAtColumn:column
        forValue:value];
    BOOL blockConsistent = [self isBlockConsistentAtRow:row atColumn:column
        forValue:value];
    
    return rowConsistent && colConsistent && blockConsistent;
}


-(BOOL) isRowConsistentAtRow:(int)row forValue:(int) value
{
    for (int col = 0; col < 9; col++) {
        if ([self getValueAtRow:row atColumn:col] == value) {
            return NO;
        }
    }
    return YES;
}

-(BOOL) isColumnConsistentAtColumn:(int)column forValue:(int) value
{
    for (int row = 0; row < 9; row++) {
        if ([self getValueAtRow:row atColumn:column] == value) {
            return NO;
        }
    }
    return YES;
}

-(BOOL) isBlockConsistentAtRow:(int)row atColumn:(int)column forValue:(int) value
{
    int startingCol = (column / 3) * 3;
    int startingRow = (row / 3) * 3;
    
    for (int row = startingRow; row < (startingRow + 3); row++) {
        for (int col = startingCol; col < (startingCol + 3); col++) {
            if ([self getValueAtRow:row atColumn:col] == value) {
                return NO;
            }
        }
    }
    return YES;
}
@end
