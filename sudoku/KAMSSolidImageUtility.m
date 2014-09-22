//
//  KAMSSolidImageUtility.m
//  sudoku
//
//  Created by Kathryn Aplin on 9/21/14.
//  Copyright (c) 2014 Kathryn Aplin Megan Shao. All rights reserved.
//

#import "KAMSSolidImageUtility.h"

@implementation KAMSSolidImageUtility

/**
 * Returns an image of a given solid color.
 * Obtained from http://stackoverflow.com/questions/6496441/
 */
+ (UIImage*)imageWithColor:(UIColor*)color
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
