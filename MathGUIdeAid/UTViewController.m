//
//  UTViewController.m
//  MathGUIdeAid
//
//  Created by Yusuke Iwama on 10/9/13.
//  Copyright (c) 2013 COIINS Project Aid. All rights reserved.
//

#import "UTViewController.h"
#import "UTBoxView.h"

@interface UTViewController ()

@end

@implementation UTViewController {
	UTBoxView *boxView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	boxView = [[UTBoxView alloc] initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, 100) delegate:self];
	[self.view addSubview:boxView];
//	boxView.backgroundColor = [UIColor redColor];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// If touches don't hit any BoxView, then VC's touchesBegan:withEvent is called. Deselection goes here.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[boxView touchesBegan:touches withEvent:event];
}

@end
