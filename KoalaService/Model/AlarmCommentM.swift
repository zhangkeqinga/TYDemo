//
//  AlarmCommentM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/23.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//评论的数据模型

import UIKit

class AlarmCommentM: BaseM {
	var alarmId : Int = 0
	var replyId : Int = 0 //2,                                //回复Id
	var senderId : Int = 0 //6                                //发送者的Id
	var senderName : String = "" //"路飞",                      //发送人姓名
	var alarmCode : String = ""
	var alarmPlace:String = ""
	var content : String = "" //"请立刻处理",                  //内容
	var postTime : String = "" //"2014-09-12 13:38:51",           //发布时间
	var toName : String = "" //""//被回复者姓名针对报警的评论，没有被回复者
//{"alarm_id":"2018027","reply_id":"0","sender_id":"14539","sender_name":"天跃考拉","to_name":"","post_time":"2015-08-07 16:53:14","alarm_code":"CA100","alarm_place":"顾北路支行","content":"回"
//	电话	tel	senderId为0
//	实时视频情况	realTimeVideo	senderId为0
//	回放视频情况	playbackVideo	senderId为0
//	保安公司联系结果	securityCompanyFeedback	senderId为0
//	处置结果	result	senderId为0
//	备注	remark	senderId为0
	
	let monitoringCenterDict = ["tel":"电话","realTimeVideo":"实时视频情况","playbackVideo":"回放视频情况","securityCompanyFeedback":"保安公司联系结果","result":"处置结果","result2":"","remark":"备注"]
		//该评论是否是监控中心的数据
	func isMonitoringCenterData() -> Bool{
		let value = monitoringCenterDict[toName]
		return value != nil
	}
	//如果是监控中心数据,获取他的标题,该方法约定这个对象依据是监控中心的数据
	func motioringCenterRowTitle() -> String{
		return monitoringCenterDict[toName]!
	}
	//是否是监控中心的电话
	func isMotioringCenterPhone()->Bool{
		return toName.characters.elementsEqual("tel".characters)
	}
	//是否是处置结果
	func isMotioringResult()->Bool{
		return toName.characters.elementsEqual("result".characters) || toName.characters.elementsEqual("result2".characters)
	}
	
	func isMotioringRemark()->Bool{
		return toName.characters.elementsEqual("remark".characters)
	}
	
	
}
