//
//  CPProgress.h
//  Pods
//
//  Created by Apple on 08/04/17.
//  Copyright © 2016 Apptitude. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CPProgressDelegate;

typedef CGFloat (^CPProgressBlock)();

@interface CPProgress : UIView

@property(nonatomic, weak) id <CPProgressDelegate> delegate;

typedef NS_ENUM(NSInteger, ProgressDirection) {
    ProgressDirectionFillClockwise,
    ProgressDirectionFillAntiClockwise,
    ProgressDirectionUnFillClockwise,
    ProgressDirectionUnFillAntiClockwise,
};

@property(nonatomic, weak) UIColor *progressColor;
@property(nonatomic, weak) UIColor *progressBorderColor;
@property(nonatomic, weak) UIColor *progressCircleColor;
@property(nonatomic) CGFloat frameWidth;
@property(nonatomic) ProgressDirection progressDirection;

- (void)startWithBlock:(CPProgressBlock)block withTimeInterval:(int)timedDuration;
- (void)stop;
- (void)resume;
- (void)pause;
- (void)invalidateBackgroundTimer;
- (void)setTimeLabelWithDuration:(int)lTimeDuration;

@end

@protocol CPProgressDelegate <NSObject>
@optional
- (void)willUpdateProgressTimer:(CPProgress *)progressTimer percentage:(CGFloat)percentage;
- (void)didUpdateProgressTimer:(CPProgress *)progressTimer percentage:(CGFloat)percentage;
- (void)didStopProgressTimer:(CPProgress *)progressTimer percentage:(CGFloat)percentage;
@end
