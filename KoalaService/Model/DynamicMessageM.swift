//
//  DynamicMessageM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/3/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//动态消息

import UIKit

class DynamicMessageM: BaseM {
	var id : Int = 0 //1001,                          //id号
	var infoType : Int = 0 //0,                           //1报警2布撤防3报警评论
	var infoId : Int = 0 //12302,                     //所属动态对应Id
	var createTime : NSString = "" //"2014-09-12 13:38:51",     //动态生成时间
	var content : NSString = "" //"请立刻处理"   ,               //内容
	var remark : NSString = "" //"CA100"        //备注解释：infoType为1时，报警类型（火警等）
	var isRead:Bool = false//是否已读,这是本地属性
	var userName:NSString = ""//从属于的用户名,这是存储到本地数据库后标示
	var alarmPlace:String = ""
	override class func getTableName()->String{
		return "DynamicMessageM"
	}
}
