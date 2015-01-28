//
//  ViewController.h
//  ROSSimpleEcho
//
//  Created by aginika scarlet on 2015/01/24.
//  Copyright (c) 2015年 aginika scarlet. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "std_msgs/Empty.h"
//#import "std_msgs/Float32.h"
//#import "std_msgs/String.h"
#import "ROSSimpleEchoNode.h"


@interface ViewController : UIViewController
{
    ROSSimpleEchoNode* ros_debugger_node_;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented_buttons;

@property (weak, nonatomic) IBOutlet UITextField *topic_text;

@property (weak, nonatomic) IBOutlet UITextField *content_text;
@property (weak, nonatomic) IBOutlet UIButton *publish_button;
@property (weak, nonatomic) IBOutlet UILabel *messageZoneLabel;
- (IBAction)publishTopic:(UIButton *)sender;
- (IBAction)changeMsgType:(UISegmentedControl *)sender;
@end

