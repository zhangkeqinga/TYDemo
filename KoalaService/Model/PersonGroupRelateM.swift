//
//  PersonGroupRelateM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/17.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//通讯录人员和群组的关联表

import UIKit

class PersonGroupRelateM: BaseM {	
	var groupId = 0
	var mKey:NSString = ""//这是key
	var personId = 0//这是服务器上的id
	override class func getTableName()->String{
		return "PersonGroupRelateM"
	}
}
