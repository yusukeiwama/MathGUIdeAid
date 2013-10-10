//
//  UTBoxView.m
//  MathGUIdeAid
//
//  Created by Yusuke Iwama on 10/10/13.
//  Copyright (c) 2013 COIINS Project Aid. All rights reserved.
//

#import "UTBoxView.h"

@implementation UTBoxView {
	NSMutableArray *boxes;
}

@synthesize x, y, w, h;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		srand((unsigned)time(NULL));
		
		x = frame.origin.x;
		y = frame.origin.y;
		w = frame.size.width;
		h = frame.size.height;
		self.layer.cornerRadius = w / 2.0;
		
		// Prepare boxes
		boxes = [NSMutableArray array];
		for (int i = 0; i < 8; i++) {
			double theta = M_PI / 4.0 * i;
			CGRect rect = CGRectMake(0,
									 0,
									 w, h);
			UIView *aBoxView = [[UIView alloc] initWithFrame:rect];
			aBoxView.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:1.0 alpha:0.9];
			aBoxView.hidden = YES;
			aBoxView.layer.cornerRadius = w / 2.0;
			[self addSubview:aBoxView];
			[boxes addObject:aBoxView];
		}
    }
    return self;
}

- (CGFloat)x
{
	return x;
}

- (void)setX:(CGFloat)newX
{
	x = newX;
	[self updateFrame];
}

- (CGFloat)y
{
	return y;
}

- (void)setY:(CGFloat)newY
{
	y = newY;
	[self updateFrame];
}

- (CGFloat)w
{
	return w;
}

- (void)setW:(CGFloat)newW
{
	w = newW;
	[self updateFrame];
}

- (CGFloat)h
{
	return h;
}

- (void)setH:(CGFloat)newH
{
	h = newH;
	[self updateFrame];
}

- (void)updateFrame
{
	self.frame = CGRectMake(x, y, w, h);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[UIView animateWithDuration:1.0 animations:^{
		for (int i = 0; i < 8; i++) {
			UIView *aBoxView = boxes[i];
			double theta = M_PI / 4.0 * i;
			CGRect rect = CGRectMake(1.5 * w * cos(theta),
									 1.5 * w * sin(theta),
									 w, h);
			aBoxView.frame = rect;
			aBoxView.hidden = NO;
		}

	}];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
