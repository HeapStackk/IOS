//
//  KeyFrameController.m
//  AnimationConclusion
//
//  Created by Kratos on 8/22/15.
//  Copyright (c) 2015 Kratos. All rights reserved.
//

#import "KeyFrameController.h"

@interface KeyFrameController ()
@property (nonatomic,strong) UIView *testView;
@end

@implementation KeyFrameController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"KeyFrame Animation";
    _testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    _testView.center = self.view.center;
    _testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_testView];
    NSArray *titles = @[@"关键帧",@"路径",@"抖动"];
    self.title = @"KeyFrame Animation";
    for (int i = 0; i<[titles count]; i++) {
        UIButton *btn = [self buttonWithTitle:[titles objectAtIndex:i] at:CGPointMake(40.0+i%4*75, 400.0+i/4*40) withTag:i];
        [self.view addSubview:btn];
    }

}



-(UIButton *)buttonWithTitle:(NSString *)title at:(CGPoint)center withTag:(NSInteger)tag {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, 50, 40);
    btn.center = center;
    btn.tag = tag;
    return btn;
}



-(void)clickBtn : (UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self keyFrameAnimation];
            break;
        case 1:
            [self pathAnimation];
            break;
        case 2:
            [self shakeAnimation];
                       break;
        case 3:
                       break;
        case 4:
                       break;
        default:
            break;
    }
}

-(void)keyFrameAnimation{

    
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGPoint center = self.view.center;
    NSValue *value0 = [NSValue valueWithCGPoint:_testView.center];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(center.x,100)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(20,100)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(20,center.y)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(297,center.y)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(297,100)];
    NSValue *value6 = [NSValue valueWithCGPoint:CGPointMake(center.x,100)];
    NSValue *value7 = [NSValue valueWithCGPoint:center];
    anima.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5,value6,value7,nil];
    anima.duration = 3.0f;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];//设置动画的节奏
    [_testView.layer addAnimation:anima forKey:@"keyFrameAnimation"];

}


-(void)pathAnimation{
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(60, 134, 100, 300)];
    anima.path = path.CGPath;
    anima.duration = 3.0f;
    [_testView.layer addAnimation:anima forKey:@"pathAnimation"];
}

-(void)shakeAnimation{
    static BOOL flag=NO;
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSValue *value1 = [NSNumber numberWithFloat:-M_PI/180*4];
    NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*4];
    NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*4];
    anima.values = @[value1,value2,value3];
    flag =!flag;
    if (flag) {
        anima.repeatCount=MAXFLOAT;
    }else{
        anima.repeatCount=0;
    }
    [_testView.layer addAnimation:anima forKey:@"shakeAnimation"];

}

@end
