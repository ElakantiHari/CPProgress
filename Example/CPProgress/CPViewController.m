//
//  CPViewController.m
//  CPProgress
//
//  Created by ElakantiHari on 04/08/2017.
//  Copyright (c) 2017 ElakantiHari. All rights reserved.
//

#import "CPViewController.h"

@interface CPViewController ()

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;

@end

@implementation CPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.hTimer.progressColor = [UIColor whiteColor];
    self.hTimer.progressBorderColor = [UIColor redColor];
    self.hTimer.progressCircleColor = [UIColor yellowColor];
    self.hTimer.delegate = self;
    [self.hTimer setProgressDirection:ProgressDirectionUnFillClockwise];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startAction:(id)sender {
    
    if ([self.startButton.titleLabel.text isEqualToString:@"start"]) {
        __block CGFloat i = 0;
        [self.hTimer startWithBlock:^CGFloat{
            CGFloat time = 10*300;
            return i++/time;
        } withTimeInterval:300];
        [self.startButton setTitle:@"stop" forState:UIControlStateNormal];
    } else {
        [self.hTimer stop];
        [self.startButton setTitle:@"start" forState:UIControlStateNormal];
    }
    
    
}

- (IBAction)pauseAction:(id)sender {
    if ([self.pauseButton.titleLabel.text isEqualToString:@"Pause"]) {
        [self.hTimer pause];
        [self.pauseButton setTitle:@"Resume" forState:UIControlStateNormal];
    } else {
        [self.hTimer resume];
        [self.pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
    }
}

#pragma mark - CPProgreddTimer Delegates

- (void)didStopProgressTimer:(CPProgress *)progressTimer percentage:(CGFloat)percentage {
    //    NSLog(@"didStopProgressTimer - Percentage = %f",percentage);
}

- (void)didUpdateProgressTimer:(CPProgress *)progressTimer percentage:(CGFloat)percentage {
    //    NSLog(@"didUpdateProgressTimer - Percentage = %f",percentage);
}

- (void)willUpdateProgressTimer:(CPProgress *)progressTimer percentage:(CGFloat)percentage {
    //    NSLog(@"willUpdateProgressTimer - Percentage = %f",percentage);
}



@end
