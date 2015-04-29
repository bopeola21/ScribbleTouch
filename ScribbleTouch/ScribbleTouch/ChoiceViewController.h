//
//  ChoiceViewController.h
//  ScribbleTouch
//
//  Created by Jide Opeola on 1/16/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import <UIKit/UIKit.h>

// sending information back up

@protocol ChoiceViewControllerDelegate;


@interface ChoiceViewController : UIViewController

@property (nonatomic) NSArray * choices;
@property (nonatomic) NSString * group;

@property (nonatomic,assign) id <ChoiceViewControllerDelegate> delegate;

@end

@protocol ChoiceViewControllerDelegate <NSObject>

-(void)choice:(NSString *)choice forGroupp:(NSString *)group;


@end
