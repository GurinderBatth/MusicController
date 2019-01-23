//
//  AddedControllerViewController.h
//  MusicController
//
//  Created by Apple on 23/01/19.
//  Copyright © 2019 Batth. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol AddedControllerDelegate <NSObject>

-(void)upView;
-(void)downView;

@end

@interface AddedControllerViewController : UIViewController

@property (nonatomic, weak) id <AddedControllerDelegate> addDelegate;

@end

NS_ASSUME_NONNULL_END
