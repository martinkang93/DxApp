//
//  FirstViewController.m
//  DxApp
//
//  Created by Martin Kang on 9/13/14.
//  Copyright (c) 2014 Martin Kang. All rights reserved.
//

#import <Parse/Parse.h>
#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name: UIKeyboardDidHideNotification object:nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)MoodSliderChanged:(id)sender {
    
    if(self.MoodSlider.value <= 2){
        self.MoodValue.text = [NSString stringWithFormat:@"%0.0F%@", self.MoodSlider.value, @"-Depressed"];
    }
    
    if((self.MoodSlider.value > 2) &&
       (self.MoodSlider.value <= 5)){
        self.MoodValue.text = [NSString stringWithFormat:@"%0.0F%@", self.MoodSlider.value, @"-Unhappy"];
    }
    
    if(self.MoodSlider.value == 5){
        self.MoodValue.text = [NSString stringWithFormat:@"%0.0F%@", self.MoodSlider.value, @"-Neutral"];
    }
    
    if((self.MoodSlider.value >5) && (self.MoodSlider.value <=8)){
        self.MoodValue.text = [NSString stringWithFormat:@"%0.0F%@", self.MoodSlider.value, @"-Feeling Good"];
    }
    
    if((self.MoodSlider.value > 8) && (self.MoodSlider.value <=10)){
        self.MoodValue.text = [NSString stringWithFormat:@"%0.0F%@", self.MoodSlider.value, @"-Very Happy"];
    }
       
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.AdditionalComplaint resignFirstResponder];
}


-(void)keyboardWillShow:(NSNotification *)note{
    [UIView animateWithDuration:0.2f animations:^{
        self.QuestionnaireView.frame = CGRectMake(0, -180, 320, 480);
    }];
}

-(void)keyboardWillHide:(NSNotification *)note{
    [UIView animateWithDuration:0.2f animations:^{
        self.QuestionnaireView.frame = CGRectMake(0, 0, 320, 480);
    }];

}


- (IBAction)ClickSubmit:(id)sender {
    PFObject *PatientRecord = [PFObject objectWithClassName:@"PatientRecord"];
    PatientRecord[@"PatientID"] = @"Patient No. 1";
    PatientRecord[@"MoodRating"] = [NSString stringWithFormat:@"%0.0F", self.MoodSlider.value];
    PatientRecord[@"Q1Ans"] = [NSString stringWithFormat:@"%0.0ld", (long)self.YesNoQ.selectedSegmentIndex];
    PatientRecord[@"Q2Ans"] = [NSString stringWithFormat:@"%0.0ld", (long)self.TFQ.selectedSegmentIndex];
    PatientRecord[@"Message"] = self.AdditionalComplaint.text;
    [PatientRecord saveInBackground];
    //send data packet to parse
}





@end
