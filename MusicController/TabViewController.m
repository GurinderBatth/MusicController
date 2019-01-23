//
//  TabViewController.m
//  MusicController
//
//  Created by Apple on 23/01/19.
//  Copyright © 2019 Batth. All rights reserved.
//

#import "TabViewController.h"
#import "AddedControllerViewController.h"

@interface TabViewController ()<AddedControllerDelegate>{
    __weak IBOutlet NSLayoutConstraint * constarintHeight;
    __weak IBOutlet NSLayoutConstraint * constarintBottom;
    AddedControllerViewController * controller;
    UIViewController * rootController;
    BOOL isUp;
}

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isUp = NO;
}

-(void)addView{
    
    controller = [[self storyboard]instantiateViewControllerWithIdentifier:@"AddedControllerViewController"];
    [controller setAddDelegate:self];
    
    rootController = [[[UIApplication sharedApplication]keyWindow]rootViewController];
    
    [rootController addChildViewController:controller];
    [[rootController view]addSubview:controller.view];
    [[controller view]setTranslatesAutoresizingMaskIntoConstraints:NO];
    constarintBottom = [[[controller view]bottomAnchor]constraintEqualToAnchor:[[[rootController view]safeAreaLayoutGuide]bottomAnchor] constant:-52];
    [constarintBottom setActive:YES];
    [[[[controller view]leadingAnchor]constraintEqualToAnchor:[[rootController view]leadingAnchor]]setActive:YES];
    [[[[controller view]trailingAnchor]constraintEqualToAnchor:[[rootController view]trailingAnchor]]setActive:YES];
    constarintHeight = [[[controller view]heightAnchor]constraintEqualToConstant:50];
    [constarintHeight setActive:YES];
    
    [controller didMoveToParentViewController:rootController];
}

-(void)upView{
    if (!isUp){
        CGFloat safeAreaTop = [self view].safeAreaInsets.top + [self view].safeAreaInsets.bottom;
        
        CGFloat height = [[UIScreen mainScreen]bounds].size.height - safeAreaTop;
        [constarintHeight setConstant:height];
        [constarintBottom setActive:NO];
        constarintBottom = [[[controller view]bottomAnchor]constraintEqualToAnchor:[[[rootController view]safeAreaLayoutGuide]bottomAnchor] constant:0];
        [constarintBottom setActive:YES];
        [UIView animateWithDuration:0.3 animations:^{
            [[self view]layoutIfNeeded];
            [self.tabBar setHidden:YES];
        } completion:^(BOOL finished) {
            self->isUp = YES;
        }];
    }
}

-(void)downView{
    if (isUp){
        CGFloat height = 52;
        [constarintBottom setActive:NO];
        constarintBottom = [[[controller view]bottomAnchor]constraintEqualToAnchor:[[[rootController view]safeAreaLayoutGuide]bottomAnchor] constant:-52];
        [constarintBottom setActive:YES];
        [constarintHeight setConstant:height];
        [UIView animateWithDuration:0.3 animations:^{
            [[self view]layoutIfNeeded];
            [self.tabBar setHidden:NO];
        } completion:^(BOOL finished) {
            self->isUp = NO;
        }];
    }
}

@end
