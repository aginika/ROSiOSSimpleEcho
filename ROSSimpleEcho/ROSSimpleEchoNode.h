//
//  JSKROSSimpleEchoNode.m
//  ROSSimpleEcho
//
//  Created by aginika scarlet on 2015/01/28.
//  Copyright (c) 2015年 aginika scarlet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ros/ros.h>
#import <std_msgs/Empty.h>
#import <std_msgs/String.h>
#import <std_msgs/Float32.h>
#import <std_msgs/Int32.h>
#import <string>
#import <boost/thread/thread.hpp>

class ROSSimpleEchoNode {
    ros::NodeHandle nh_;
    ros::Publisher empty_pub_;
    ros::Publisher float_pub_;
    ros::Publisher int_pub_;
    ros::Publisher string_pub_;
    
    boost::thread *th_;
public:
    
    ROSSimpleEchoNode();
    ~ROSSimpleEchoNode();
    
    void spin();
    void publishEmpty(std::string topic_name);
    void publishFloat(std::string topic_name, float data);
    void publishInt(std::string topic_name, int data);
    void publishString(std::string topic_name, std::string data);
};
