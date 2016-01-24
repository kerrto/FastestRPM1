//
//  ViewController.m
//  FastestRPM1
//
//  Created by Kerry Toonen on 2016-01-21.
//  Copyright © 2016 Kerry Toonen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic, weak) IBOutlet UIImageView *needleView;

- (IBAction)handlePan:(UIPanGestureRecognizer*)sender;



@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
        CGFloat intialPos = 145;
    self.needleView.transform = CGAffineTransformMakeRotation(intialPos * M_PI / 180.0);
    
    [self.view addSubview:self.needleView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)handlePan:(UIPanGestureRecognizer*)sender {
            if (sender.state == UIGestureRecognizerStateChanged ||
                sender.state == UIGestureRecognizerStateBegan)
            {
                CGPoint vel = [sender velocityInView:self.view];
                CGPoint newVel =CGPointMake(fabs(vel.x), fabs(vel.y));
                NSLog(@"%@", NSStringFromCGPoint(newVel));
                
                CGAffineTransform translate = CGAffineTransformMakeTranslation(self.needleView.frame.origin.x,self.needleView.frame.origin.y - self.needleView.frame.size.height * 0.25);
                CGAffineTransform scale = CGAffineTransformMakeScale(0.6, 0.6);
                CGAffineTransform transform =  CGAffineTransformConcat(translate, scale);
                CGFloat newPos=200;
                transform = CGAffineTransformMakeRotation(newPos *M_PI / 180.0);
                
                // animation using block code
                [UIView animateWithDuration:2.0
                                      delay:0.0
                                    options:UIViewAnimationOptionCurveEaseIn
                                 animations:^{
                                     self.needleView.transform = transform;
                                 }completion:^(BOOL finished){
                                       }];
                
                if (fabs(vel.x)>500 || fabs(vel.y)>500){
                    CGFloat newPos=300;
                    transform = CGAffineTransformMakeRotation(newPos *M_PI / 180.0);
                    
                    // animation using block code
                    [UIView animateWithDuration:2.0
                                          delay:0.0
                                        options:UIViewAnimationOptionCurveEaseIn
                                     animations:^{
                                         self.needleView.transform = transform;
                                     }completion:^(BOOL finished){
                                     }];}
                if (fabs(vel.x)>900 || fabs(vel.y)>900){
                    CGFloat newPos=360;
                    transform = CGAffineTransformMakeRotation(newPos *M_PI / 180.0);
                    
                    // animation using block code
                    [UIView animateWithDuration:2.0
                                          delay:0.0
                                        options:UIViewAnimationOptionCurveEaseIn
                                     animations:^{
                                         self.needleView.transform = transform;
                                     }completion:^(BOOL finished){
                                     }];}
                if (sender.state ==UIGestureRecognizerStateEnded) {
                CGFloat newPos = 100;
                self.needleView.transform = CGAffineTransformMakeRotation(newPos * M_PI / 180.0);
                [UIView animateWithDuration:2.0
                                      delay:0.0
                                    options:UIViewAnimationOptionCurveEaseIn
                                     animations:^{
                                         self.needleView.transform = transform;
                                     }completion:^(BOOL finished){
                                     }];}
                    
                }
}





@end
