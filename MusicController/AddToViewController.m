//
//  AddToViewController.m
//  MusicController
//
//  Created by Apple on 23/01/19.
//  Copyright © 2019 Batth. All rights reserved.
//

#import "AddToViewController.h"
#import "TabViewController.h"

@interface AddToViewController ()

@end

@implementation AddToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)btnAddChildController:(id)sender{
    TabViewController * tabController = (TabViewController *)[[[UIApplication sharedApplication]keyWindow]rootViewController];
    [tabController addView];
}


@end
