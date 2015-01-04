//
//  Accelerator.m
//  AcceleratorView
//
//  Created by Lynch on 1/4/15.
//  Copyright (c) 2015 Lynch. All rights reserved.
//

#import "Accelerator.h"
#import <HexColors/HexColor.h>

@interface Accelerator ()

@property (strong, nonatomic) UIImage *accButtonImage;
@property (assign, nonatomic) CGPoint accButtonPosition;

@end

@implementation Accelerator

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    self.backgroundColor = [UIColor clearColor];
    self.accButtonImage = [UIImage imageNamed:@"accelerator_but"];
    self.accButtonPosition = CGPointMake((self.bounds.size.width - 54.0f) / 2, 224.0f);
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [super beginTrackingWithTouch:touch withEvent:event];
    
    CGPoint touchLocation = [touch locationInView:self];
    
    if (CGRectContainsPoint(CGRectMake(self.accButtonPosition.x - 73.0f, self.accButtonPosition.y, 200.0f, 32.0f), touchLocation)) {
        NSLog(@"YES");
        return YES;
    } else {
        NSLog(@"NO");
        [self calculatorButtonPosition:touchLocation];
        return YES;
    }
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [super continueTrackingWithTouch:touch withEvent:event];
    CGPoint touchLocation = [touch locationInView:self];
    [self calculatorButtonPosition:touchLocation];
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
}

- (void)calculatorButtonPosition:(CGPoint)touchLocation
{
    CGFloat y = touchLocation.y;
    
    if (y <= 30.0f) {
        self.accButtonPosition = CGPointMake(self.accButtonPosition.x, 4.0f);
    } else if (y > 30.0f && y <= 50.0f) {
        self.accButtonPosition = CGPointMake(self.accButtonPosition.x, 24.0f);
    } else if (y > 50.0f && y <= 70.0f) {
        self.accButtonPosition = CGPointMake(self.accButtonPosition.x, 44.0f);
    } else if (y > 70.0f && y <= 90.0f) {
        self.accButtonPosition = CGPointMake(self.accButtonPosition.x, 64.0f);
    } else if (y > 90.0f && y <= 110.0f) {
        self.accButtonPosition = CGPointMake(self.accButtonPosition.x, 84.0f);
    } else if (y > 110.0f && y <= 130.0f) {
        self.accButtonPosition = CGPointMake(self.accButtonPosition.x, 104.0f);
    } else if (y > 130.0f && y <= 150.0f) {
        self.accButtonPosition = CGPointMake(self.accButtonPosition.x, 124.0f);
    } else if (y > 150.0f && y <= 170.0f) {
        self.accButtonPosition = CGPointMake(self.accButtonPosition.x, 144.0f);
    } else if (y > 170.0f && y <= 190.0f) {
        self.accButtonPosition = CGPointMake(self.accButtonPosition.x, 164.0f);
    } else if (y > 190.0f && y <= 210.0f) {
        self.accButtonPosition = CGPointMake(self.accButtonPosition.x, 184.0f);
    } else if (y > 210.0f && y <= 270.0f) {
        self.accButtonPosition = CGPointMake(self.accButtonPosition.x, 224.0f);
    } else if (y > 270.0f) {
        self.accButtonPosition = CGPointMake(self.accButtonPosition.x, 264.0f);
    }
    
    [self setNeedsDisplay];
}

- (int)calculatorLineIndex:(CGPoint)buttonPosition
{
    CGFloat y = buttonPosition.y + 16.0f;
    int index = 0;
    
    if (y <= 30.0f) {
        index = 0;
    } else if (y > 30.0f && y <= 50.0f) {
        index = 1;
    } else if (y > 50.0f && y <= 70.0f) {
        index = 2;
    } else if (y > 70.0f && y <= 90.0f) {
        index = 3;
    } else if (y > 90.0f && y <= 110.0f) {
        index = 4;
    } else if (y > 110.0f && y <= 130.0f) {
        index = 5;
    } else if (y > 130.0f && y <= 150.0f) {
        index = 6;
    } else if (y > 150.0f && y <= 170.0f) {
        index = 7;
    } else if (y > 170.0f && y <= 190.0f) {
        index = 8;
    } else if (y > 190.0f && y <= 210.0f) {
        index = 9;
    } else if (y > 210.0f && y <= 270.0f) {
        index = 10;
    } else if (y > 270.0f) {
        index = 11;
    }
    
    return index;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    NSLog(@"drawRect");
    int buttonIndex = [self calculatorLineIndex:self.accButtonPosition];
    //NSLog(@"buttonIndex : %d", buttonIndex);
    
    [[UIColor whiteColor] set];
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(currentContext, 1.0f);
    
    for (int i = 0; i < 12; i++) {
        
        if (i < 10) {
            
            if (i >= buttonIndex) {
                if (i == 0) {
                    [[UIColor colorWithHexString:@"#ff0000"] set];
                } else if (i == 1) {
                    [[UIColor colorWithHexString:@"#ed5002"] set];
                } else if (i == 2) {
                    [[UIColor colorWithHexString:@"#f25102"] set];
                } else if (i == 3) {
                    [[UIColor colorWithHexString:@"#ed5d03"] set];
                } else if (i == 4) {
                    [[UIColor colorWithHexString:@"#f27202"] set];
                } else if (i == 5) {
                    [[UIColor colorWithHexString:@"#f18a02"] set];
                } else if (i == 6) {
                    [[UIColor colorWithHexString:@"#f2a102"] set];
                } else if (i == 7) {
                    [[UIColor colorWithHexString:@"#f2b702"] set];
                } else if (i == 8) {
                    [[UIColor colorWithHexString:@"#ecc202"] set];
                } else if (i == 9) {
                    [[UIColor colorWithHexString:@"#f2c602"] set];
                }
            } else {
                [[UIColor whiteColor] set];
            }
            
            CGFloat leftStartX = 0.0f;
            CGFloat rightEndX = 0.0f;
            
            if (i != 9) {
                leftStartX = 42.5f;
                rightEndX = 157.5f;
            } else {
                leftStartX = 2.5f;
                rightEndX = 197.5f;
            }
            
            CGContextMoveToPoint(currentContext, leftStartX, 20.0f * (i + 1));
            CGContextAddLineToPoint(currentContext, 87.5f, 20.0f * (i + 1));
            CGContextStrokePath(currentContext);
            
            CGContextMoveToPoint(currentContext, 112.5f, 20.0f * (i + 1));
            CGContextAddLineToPoint(currentContext, rightEndX, 20.0f * (i + 1));
            CGContextStrokePath(currentContext);
        } else {
            if (i == 10) {
                
                if (i == buttonIndex) {
                    [[UIColor colorWithHexString:@"#ff0000"] set];
                } else {
                    [[UIColor whiteColor] set];
                }
                NSString *string = @"N";
                [string drawAtPoint:CGPointMake(20.0f, 10.0f + 20.0f * (i  + 1)) withFont:[UIFont systemFontOfSize:20.0f]];
                [string drawAtPoint:CGPointMake(165.5f, 10.0f + 20.0f * (i  + 1)) withFont:[UIFont systemFontOfSize:20.0f]];
                
                CGContextMoveToPoint(currentContext, 42.5f, 20.0f * (i  + 2));
                CGContextAddLineToPoint(currentContext, 87.5f, 20.0f * (i  + 2));
                CGContextStrokePath(currentContext);
                
                CGContextMoveToPoint(currentContext, 112.5f, 20.0f * (i  + 2));
                CGContextAddLineToPoint(currentContext, 157.5f, 20.0f * (i  + 2));
                CGContextStrokePath(currentContext);
            }
            if (i == 11) {
                
                if (i == buttonIndex) {
                    [[UIColor colorWithHexString:@"#00ff00"] set];
                } else {
                    [[UIColor whiteColor] set];
                }
                
                NSString *string = @"R";
                [string drawAtPoint:CGPointMake(20.0f, 10.0f + 20.0f * (i  + 2)) withFont:[UIFont systemFontOfSize:20.0f]];
                [string drawAtPoint:CGPointMake(165.5f, 10.0f + 20.0f * (i  + 2)) withFont:[UIFont systemFontOfSize:20.0f]];
                
                CGContextMoveToPoint(currentContext, 42.5f, 20.0f * (i  + 3));
                CGContextAddLineToPoint(currentContext, 87.5f, 20.0f * (i  + 3));
                CGContextStrokePath(currentContext);
                
                CGContextMoveToPoint(currentContext, 112.5f, 20.0f * (i  + 3));
                CGContextAddLineToPoint(currentContext, 157.5f, 20.0f * (i  + 3));
                CGContextStrokePath(currentContext);
            }
        }
    }
    [self.accButtonImage drawAtPoint:self.accButtonPosition];
}

@end
