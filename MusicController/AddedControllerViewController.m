//
//  AddedControllerViewController.m
//  MusicController
//
//  Created by Apple on 23/01/19.
//  Copyright © 2019 Batth. All rights reserved.
//

#import "AddedControllerViewController.h"

@interface AddedControllerViewController (){
    __weak IBOutlet UIView * viewPanGesture;
}

@end

@implementation AddedControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer * upGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(slideViewAbove:)];
    [upGesture setDirection:UISwipeGestureRecognizerDirectionUp];
    
    UISwipeGestureRecognizer * downGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(slideViewDown:)];
    [downGesture setDirection:UISwipeGestureRecognizerDirectionDown];
    [viewPanGesture addGestureRecognizer:upGesture];
    [viewPanGesture addGestureRecognizer:downGesture];
}

-(void)slideViewAbove:(UISwipeGestureRecognizer *)gesture{
    [self.addDelegate upView];
}

-(void)slideViewDown:(UISwipeGestureRecognizer *)gesture{
    [self.addDelegate downView];
}

@end
