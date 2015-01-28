//
//  JSKROSSimpleEchoNode.m
//  ROSSimpleEcho
//
//  Created by aginika scarlet on 2015/01/28.
//  Copyright (c) 2015年 aginika scarlet. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "ROSSimpleEchoNode.h"

ROSSimpleEchoNode::ROSSimpleEchoNode()
{
    th_ = new boost::thread(&ROSSimpleEchoNode::spin, this);
}

ROSSimpleEchoNode::~ROSSimpleEchoNode()
{
    ros::shutdown();
    th_->join();
    delete th_;
}

void ROSSimpleEchoNode::spin()
{
    ros::spin();
}

void ROSSimpleEchoNode::publishEmpty(std::string topic_name)
{
    if(empty_pub_.getTopic() != topic_name)
        empty_pub_ = nh_.advertise<std_msgs::Empty>(topic_name, 10);
    std_msgs::Empty msg;
    empty_pub_.publish(msg);
}

void ROSSimpleEchoNode::publishFloat(std::string topic_name,float data)
{
    if (float_pub_.getTopic() != topic_name)
        float_pub_ = nh_.advertise<std_msgs::Float32>(topic_name, 10);
    std_msgs::Float32 msg;
    msg.data = data;
    float_pub_.publish(msg);
}

void ROSSimpleEchoNode::publishInt(std::string topic_name, int data)
{
    if(int_pub_.getTopic() != topic_name)
        int_pub_ = nh_.advertise<std_msgs::Int32>(topic_name, 10);
    std_msgs::Int32 msg;
    msg.data = data;
    int_pub_.publish(msg);
}

void ROSSimpleEchoNode::publishString(std::string topic_name, std::string message)
{
    if(string_pub_.getTopic() != topic_name)
        string_pub_ = nh_.advertise<std_msgs::String>(topic_name, 10);
    std_msgs::String msg;
    msg.data = message;
    string_pub_.publish(msg);
}