//
//  ViewController.m
//  AnimationConclusion
//
//  Created by Kratos on 8/22/15.
//  Copyright (c) 2015 Kratos. All rights reserved.
//

#import "ViewController.h"
#import "BasicAnimationController.h"
#import "KeyFrameController.h"
#import "TransitionAnimation.h"
@interface ViewController ()
@property (nonatomic,weak) UINavigationController *parentController;
@property (nonatomic,strong) NSArray *entries;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Animation Conclusion";
    _entries = @[@"基础动画",@"关键帧动画",@"过渡动画"];
}


-(instancetype)initWithParentController:(UINavigationController *)nav{
    if (self = [super init]) {
        _parentController = nav;
    }
    return self;
}


#pragma mark delegate method
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_entries count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Identifier = @"Cells";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.textLabel.text = [_entries objectAtIndex:indexPath.row];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [_parentController pushViewController:[[BasicAnimationControllerViewController alloc] init]animated:YES];
            break;
        case 1:
            [_parentController pushViewController:[[KeyFrameController alloc] init]animated:YES];
            break;
        default:
            [_parentController pushViewController:[[TransitionAnimation alloc] init]animated:YES];
            break;
    }
}

@end
