//
//  FirstViewController.h
//  DxApp
//
//  Created by Martin Kang on 9/13/14.
//  Copyright (c) 2014 Martin Kang. All rights reserved.
//

#import <Parse/Parse.h>
#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *MoodValue;
@property (weak, nonatomic) IBOutlet UISlider *MoodSlider;
@property (weak, nonatomic) IBOutlet UITextView *AdditionalComplaint;
@property (weak, nonatomic) IBOutlet UIView *QuestionnaireView;
@property (weak, nonatomic) IBOutlet UIButton *Submit;
@property (weak, nonatomic) IBOutlet UISegmentedControl *YesNoQ;
@property (weak, nonatomic) IBOutlet UISegmentedControl *TFQ;



@end
