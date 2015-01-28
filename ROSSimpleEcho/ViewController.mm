//
//  ViewController.m
//  ROSSimpleEcho
//
//  Created by aginika scarlet on 2015/01/24.
//  Copyright (c) 2015年 aginika scarlet. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    ros_debugger_node_ = new ROSSimpleEchoNode();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)publishTopic:(UIButton *)sender {
    if (self.topic_text.text.length == 0) {
        self.messageZoneLabel.text = @"Please Enter the Topic Name";
        CABasicAnimation *fadeAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
        fadeAnim.fromValue = [NSNumber numberWithFloat:0.0];
        fadeAnim.toValue   = [NSNumber numberWithFloat:1.0];
        fadeAnim.duration = 2.0;
        CABasicAnimation *fadeOutAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
        fadeOutAnim.fromValue = [NSNumber numberWithFloat:1.0];
        fadeOutAnim.toValue   = [NSNumber numberWithFloat:0.0];
        fadeOutAnim.duration = 4.0;
        
        CAAnimationGroup *group = [CAAnimationGroup animation];
        group.animations = [NSArray arrayWithObjects:fadeAnim,  fadeOutAnim, nil];
        group.duration = 10.0f;
        self.messageZoneLabel.layer.opacity = 0;
        [self.messageZoneLabel.layer addAnimation:group forKey:@"fadeout"];

        
        [self.topic_text becomeFirstResponder];
        return;
    }else{
        self.messageZoneLabel.text = @"";
    }
    switch (self.segmented_buttons.selectedSegmentIndex) {
        case 0:
            NSLog(@"Empty");
            ros_debugger_node_->publishEmpty(std::string([self.topic_text.text UTF8String]));
            break;
        case 1:
            NSLog(@"String");
            ros_debugger_node_->publishString(std::string([self.topic_text.text UTF8String]), std::string([self.content_text.text UTF8String]));
            break;
        case 2:
            NSLog(@"Int");
            ros_debugger_node_->publishInt(std::string([self.topic_text.text UTF8String]), [self.content_text.text integerValue]);
            break;
        case 3:
            NSLog(@"Float");
            ros_debugger_node_->publishFloat([self.content_text.text UTF8String], [self.content_text.text floatValue]);
            break;
        default:
            self.messageZoneLabel.text = @"Please Select Type";
            break;
    }
    
}

- (IBAction)changeMsgType:(UISegmentedControl *)sender {
    }

@end
