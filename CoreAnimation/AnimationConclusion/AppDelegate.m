//
//  AppDelegate.m
//  AnimationConclusion
//
//  Created by Kratos on 8/22/15.
//  Copyright (c) 2015 Kratos. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UINavigationController *navCon = [[UINavigationController alloc] init];
    ViewController *viewController = [[ViewController alloc] initWithParentController:navCon];
    [navCon addChildViewController:viewController];
    self.window.rootViewController = navCon;
    [self.window makeKeyAndVisible];
    return YES;
}
@end
