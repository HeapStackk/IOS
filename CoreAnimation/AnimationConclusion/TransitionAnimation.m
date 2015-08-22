//
//  TransitionAnimation.m
//  AnimationConclusion
//
//  Created by Kratos on 8/22/15.
//  Copyright (c) 2015 Kratos. All rights reserved.
//

#import "TransitionAnimation.h"

@interface TransitionAnimation ()
@property (nonatomic,strong) UIView *testView;
@property (nonatomic , assign) NSInteger index;
@end

@implementation TransitionAnimation



- (void)viewDidLoad {
    [super viewDidLoad];
    _index = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    _testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _testView.center = self.view.center;
    _testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_testView];
    NSArray *titles = @[@"fade",@"mvIn",@"push",@"reveal",@"cube",@"suck",@"oglFlip",@"ripple",@"Curl",@"UnCurl",@"Open",@"Close"];
    self.title = @"Transition Animation";
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
            [self fadeAnimation];
            break;
        case 1:
            [self moveInAnimation];
            break;
        case 2:
            [self pushAnimation];
            break;
        case 3:
            [self revealAnimation];
            break;
        case 4:
            [self cubeAnimation];
            break;
        case 5:
            [self suckEffectAnimation];
            break;
        case 6:
            [self oglFlipAnimation];
            break;
        case 7:
            [self rippleEffectAnimation];
            break;
        case 8:
            [self pageCurlAnimation];
            break;
        case 9:
            [self pageUnCurlAnimation];
            break;
        case 10:
            [self cameraIrisHollowOpenAnimation];
            break;
        case 11:
            [self cameraIrisHollowCloseAnimation];
            break;
        default:
            break;
    }
}



-(void)fadeAnimation{
    [self changeView];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionFade;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    //anima.startProgress = 0.3;//设置动画起点
    //anima.endProgress = 0.8;//设置动画终点
    anima.duration =  0.7f;

    [_testView.layer addAnimation:anima forKey:@"fadeAnimation"];
}

-(void)moveInAnimation{
    [self changeView];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionMoveIn;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration =  0.7f;

    [_testView.layer addAnimation:anima forKey:@"moveInAnimation"];
}

-(void)pushAnimation{
    [self changeView];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionPush;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration =  0.7f;

    [_testView.layer addAnimation:anima forKey:@"pushAnimation"];
}

-(void)revealAnimation{
    [self changeView];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionReveal;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration =  0.7f;

    [_testView.layer addAnimation:anima forKey:@"revealAnimation"];
}




/**
 *  立体翻滚效果
 */
-(void)cubeAnimation{
    [self changeView];
    CATransition *anima = [CATransition animation];
    anima.type = @"cube";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration =  0.7f;

    [_testView.layer addAnimation:anima forKey:@"revealAnimation"];
}


-(void)suckEffectAnimation{
    [self changeView];
    CATransition *anima = [CATransition animation];
    anima.type = @"suckEffect";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration =  0.7f;

    [_testView.layer addAnimation:anima forKey:@"suckEffectAnimation"];
}

-(void)oglFlipAnimation{
    [self changeView];
    CATransition *anima = [CATransition animation];
    anima.type = @"oglFlip";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration =  0.7f;

    [_testView.layer addAnimation:anima forKey:@"oglFlipAnimation"];
}

-(void)rippleEffectAnimation{
    [self changeView];
    CATransition *anima = [CATransition animation];
    anima.type = @"rippleEffect";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration =  0.7f;

    [_testView.layer addAnimation:anima forKey:@"rippleEffectAnimation"];
}

-(void)pageCurlAnimation{
    [self changeView];
    CATransition *anima = [CATransition animation];
    anima.type = @"pageCurl";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration =  0.7f;

    [_testView.layer addAnimation:anima forKey:@"pageCurlAnimation"];
}

-(void)pageUnCurlAnimation{
    [self changeView];
    CATransition *anima = [CATransition animation];
    anima.type = @"pageUnCurl";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration =  0.7f;

    [_testView.layer addAnimation:anima forKey:@"pageUnCurlAnimation"];
}

-(void)cameraIrisHollowOpenAnimation{
    [self changeView];
    CATransition *anima = [CATransition animation];
    anima.type = @"cameraIrisHollowOpen";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration =  0.7f;

    [_testView.layer addAnimation:anima forKey:@"cameraIrisHollowOpenAnimation"];
}

-(void)cameraIrisHollowCloseAnimation{
    [self changeView];
    CATransition *anima = [CATransition animation];
    anima.type = @"cameraIrisHollowClose";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration =  0.7f;

    [_testView.layer addAnimation:anima forKey:@"cameraIrisHollowCloseAnimation"];
}

/**
 *   设置view的值
 */
-(void)changeView {
    _index=++_index>3?0:_index;

    NSArray *colors = [NSArray arrayWithObjects:[UIColor cyanColor],[UIColor magentaColor],[UIColor orangeColor],[UIColor purpleColor], nil];

    _testView.backgroundColor = [colors objectAtIndex:_index];

}




@end
