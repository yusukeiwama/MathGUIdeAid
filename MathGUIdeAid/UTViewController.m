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
	
	boxView = [[UTBoxView alloc] initWithFrame:CGRectMake(300, 300, 100, 100)];
	boxView.center = self.view.center;
	[self.view addSubview:boxView];
	boxView.backgroundColor = [UIColor redColor];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
