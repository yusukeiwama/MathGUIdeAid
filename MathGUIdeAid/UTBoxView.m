//
//  UTBoxView.m
//  MathGUIdeAid
//
//  Created by Yusuke Iwama on 10/10/13.
//  Copyright (c) 2013 COIINS Project Aid. All rights reserved.
//

#import "UTBoxView.h"

#define BUTTON_COUNT 9
#define DURATION 0.4

@implementation UTBoxView {
	NSMutableArray *buttons;
	BOOL selectingCommand;
}

@synthesize x, y, w, h;
@synthesize label;

- (id)initWithFrame:(CGRect)frame delegate:(id)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		srand((unsigned)time(NULL));
		
		self.layer.cornerRadius = w / 2.0;
		self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
		self.layer.borderWidth = 0.5;
		
		x = frame.origin.x;
		y = frame.origin.y;
		w = frame.size.width;
		h = frame.size.height;
		
		label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, w, h)];
		label.textAlignment = NSTextAlignmentCenter;
		label.adjustsFontSizeToFitWidth = YES;
		label.font = [UIFont fontWithName:@"Courier" size:48.0]; // Baskerville-SemiBoldItalic is also good
		[self addSubview:label];
		label.text = @"3x";
		
		// Prepare boxes
		buttons = [NSMutableArray array];
		for (int i = 0; i < BUTTON_COUNT; i++) {
			CGRect rect = CGRectMake(x, y, w, h);
			UIButton *aButton = [UIButton buttonWithType:UIButtonTypeSystem];
			aButton.frame = rect;
			[aButton setTitle:[self buttonTitleWithIndex:i] forState:UIControlStateNormal];
			[aButton addTarget:self action:[self buttonActionWithIndes:i] forControlEvents:UIControlEventTouchUpInside];
			aButton.backgroundColor = [UIColor colorWithRed:0.4 green:0.8 blue:1.0 alpha:0.3];
			aButton.layer.cornerRadius = w / 2.0;
			aButton.showsTouchWhenHighlighted = YES;
			aButton.hidden = YES;
			[((UIViewController *)delegate).view addSubview:aButton];
			[buttons addObject:aButton];
		}
    }
    return self;
}

- (NSString *)buttonTitleWithIndex:(NSInteger)i
{
	switch (i) {
		case 0: return @"next";
		case 1: return @"index";
		case 2: return @"denominator";
		case 3: return @"attribute";
		case 4: return @"previous";
		case 5: return @"attribute";
		case 6: return @"numerator";
		case 7: return @"power";
		case 8: return @"";
		default: return @"error";
	}
}

- (SEL)buttonActionWithIndes:(NSInteger)i
{
	switch (i) {
		case 0: return @selector(touchesBegan:withEvent:);
		case 1: return @selector(touchesBegan:withEvent:);
		case 2: return @selector(denominator);
		case 3: return @selector(touchesBegan:withEvent:);
		case 4: return @selector(touchesBegan:withEvent:);
		case 5: return @selector(touchesBegan:withEvent:);
		case 6: return @selector(numerator);
		case 7: return @selector(power);
		case 8: return @selector(touchesBegan:withEvent:);
		default: return nil;
	}
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
	if (selectingCommand) {
		selectingCommand = NO;
		[UIView animateWithDuration:DURATION animations:^{
			for (int i = 0; i < BUTTON_COUNT; i++) {
				UIView *aBoxView = buttons[i];
				CGRect rect = CGRectMake(x, y, w, h);
				aBoxView.frame = rect;
			}
		} completion:^(BOOL finished){
			for (int i = 0; i < BUTTON_COUNT; i++) {
				UIView *aBoxView = buttons[i];
				aBoxView.hidden = YES;
			}
		}];
	} else {
		[UIView animateWithDuration:DURATION animations:^{
			for (int i = 0; i < BUTTON_COUNT; i++) {
				UIView *aBoxView = buttons[i];
				double theta = M_PI / 4.0 * i;
				CGRect rect = CGRectMake(x + 1.5 * w * cos(theta),
										 y + 1.5 * w * sin(theta),
										 w, h);
				if (i != 8) aBoxView.frame = rect;
				aBoxView.hidden = NO;
			}
		}];
		selectingCommand = YES;
	}
}

- (void)denominator
{
	
}

- (void)numerator
{
	
}

- (void)power
{
	
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
