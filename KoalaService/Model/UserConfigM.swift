//
//  UserConfigM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/18.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//用户的配置信息的模型

import UIKit

class UserConfigM: BaseM {
	var dynamicInfoRefreshInterval : Int = 0 //动态刷新间隔
	var refreshTime : String = "" //网点每日布防检查时间点
	var restWeekDay : String = "" //网点休息日 7位，第一位指代周一，最后一位指周日 0                            表示该日不是休息日，1表示该日是休息日，2表示特殊工作日(暂时不使用，暂时不用删除)
	var specialRefreshTime : String = "" //网点特殊工作日布防检查时间点
}
