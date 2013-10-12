//
//  UTBoxView.h
//  MathGUIdeAid
//
//  Created by Yusuke Iwama on 10/10/13.
//  Copyright (c) 2013 COIINS Project Aid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UTBoxView : UIView

@property CGFloat x;
@property CGFloat y;
@property CGFloat w;
@property CGFloat h;

@property id parentBox;

@property UILabel *label;

- (id)initWithFrame:(CGRect)frame delegate:(id)delegate;

@end
