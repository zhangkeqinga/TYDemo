//
//  TopicM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/9.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class TopicM: BaseM {
	var topicId = 0 //100,
	var sponsor = "" //"孙悟空",
	var topicTitle = "" //"今天话题是哆啦A梦",
	var pubDate = "" //"2012-09-21 12:30:00",
	var expirationDate = "" //"到期时间12-02-10",
	var type = 0 //0,		//0未分类(暂时就用0)
	var topPost:Bool = false //1,	//置顶级别 0未分级1是置顶
	var url = "" //"/koala/dd/park",		//话题访问路径
	var atMe = false //0,					//是否需要我该话题0：和我无关1：有关
	var category = 0 // 1			//1官方话题2自由话题
	var numberComment = 0 //230 	//评论数
	enum CategoryEnum:Int{
		case Official = 1//官方
		case Freee = 2//自由话题
		case At = 3//@
	}
	//获取分类
	func getCategoryEnum()->CategoryEnum {
		
		return CategoryEnum(rawValue: category) ?? .Official
	}
}
