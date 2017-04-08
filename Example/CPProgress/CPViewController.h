//
//  CPViewController.h
//  CPProgress
//
//  Created by ElakantiHari on 04/08/2017.
//  Copyright (c) 2017 ElakantiHari. All rights reserved.
//

@import UIKit;
#import "CPProgress.h"

@interface CPViewController : UIViewController<CPProgressDelegate>

@property (weak, nonatomic) IBOutlet CPProgress *hTimer;

@end
