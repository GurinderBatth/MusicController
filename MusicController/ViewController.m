//
//  ViewController.m
//  MusicController
//
//  Created by Apple on 23/01/19.
//  Copyright © 2019 Batth. All rights reserved.
//

#import "ViewController.h"
#import "TabViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)setRootController:(id)sender{
    TabViewController * tabController = [self.storyboard instantiateViewControllerWithIdentifier:@"TabViewController"];
    [[[UIApplication sharedApplication]keyWindow]setRootViewController:tabController];
    [[[UIApplication sharedApplication]keyWindow]makeKeyAndVisible];
}

@end
