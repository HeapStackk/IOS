//
//  BaseAnimationControllerViewController.m
//  AnimationConclusion
//
//  Created by Kratos on 8/22/15.
//  Copyright (c) 2015 Kratos. All rights reserved.
//

#import "BasicAnimationController.h"


@interface BasicAnimationControllerViewController ()
@property (nonatomic,strong) UIView *testView;
@end

@implementation BasicAnimationControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    _testView.center = self.view.center;
    _testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_testView];
    NSArray *titles = @[@"位移",@"透明度",@"缩放",@"旋转",@"背景色"];
    self.title = @"Basic Animation";
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
            [self positionAnimation];
            break;
        case 1:
            [self opacityAnimation];
            break;
        case 2:
            [self scaleAnimation];
            break;
        case 3:
            [self rotationAnimation];
            break;
        case 4:
            [self backgroundAnimation];
            break;
        default:
            break;
    }
}




-(void)positionAnimation{
    //使用CABasicAnimation创建基础动画
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue = [NSValue valueWithCGPoint:self.view.center];
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x-100, self.view.center.y-100)];
    anima.duration = 1.0f;
    [_testView.layer addAnimation:anima forKey:@"positionAnimation"];
    //如果注释下句，动画结束后，回归原位，所以动画完成之后必须 更新当前属性
   _testView.center = CGPointMake(self.view.center.x-100 , self.view.center.y-100);
    }

-(void)opacityAnimation{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.fromValue =[NSNumber numberWithFloat:1];
    anima.toValue = [NSNumber numberWithFloat:0];
    anima.duration = 1.0f;
    [_testView.layer addAnimation:anima forKey:@"opacityAnimation"];
}

-(void)scaleAnimation{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform"];
    anima.fromValue = [NSValue valueWithCATransform3D:_testView.layer.transform];
    anima.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(_testView.layer.transform,1.5, 1.5, 1)];
    anima.duration = 1.0f;
    //添加以下两句动画完成时保留动画效果
    //anima.fillMode = kCAFillModeForwards;
    //anima.removedOnCompletion = NO;
    [_testView.layer addAnimation:anima forKey:@"scaleAnimation"];
   [_testView.layer setTransform:CATransform3DScale(_testView.layer.transform,1.5, 1.5, 1)];
    //使用UIView Animation 代码块调用
//    [UIView animateWithDuration:1.0f animations:^{
//        _testView.layer.transform = CATransform3DMakeScale(2, 2, 1);
//    } completion:^(BOOL finished){
//        _testView.layer.transform = CATransform3DMakeScale(1, 1, 1);
//    }];
}


-(void)rotationAnimation{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform"];
    anima.fromValue = [NSValue valueWithCATransform3D:CATransform3DRotate(_testView.layer.transform,0, 0, 0, 1)];
    anima.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(_testView.layer.transform,M_PI_4*3, 0, 0, 1)];
    anima.duration = 1.0f;
    [_testView.layer addAnimation:anima forKey:@"rotationAnimation"];
    [_testView.layer setTransform:CATransform3DRotate(_testView.layer.transform,M_PI_4*3, 0, 0, 1)];

}

-(void)backgroundAnimation{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anima.fromValue = (id)[UIColor redColor].CGColor;
    anima.toValue = (id)[UIColor greenColor].CGColor;
    anima.duration = 1.0f;
    [_testView.layer addAnimation:anima forKey:@"backgroundColorAnimation"];
    _testView.layer.backgroundColor = [UIColor greenColor].CGColor;

}




@end
