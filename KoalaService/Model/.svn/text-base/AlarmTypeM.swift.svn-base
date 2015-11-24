//
//  AlarmTypeM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/20.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//报警分类的UI模型

import UIKit

class AlarmTypeM: BaseM {
	var alarmType:String = ""
	var alarmCode : String = ""//类型
	var itemBGImage:UIImage?//item的背景颜色
	var itemPressBGImage:UIImage?//item的背景按下去的颜色
	var allCount = 0
	var unReadCount = 0
		var isSeleted = false//是否选中,默认为false,这是UI的属性
	override init(json: NSDictionary) {
		super.init(json: json)
	}
	init(alarmCode:String,alarmType:String,itemBGImage:UIImage?,itemPressBGImage:UIImage?){
		self.alarmCode = alarmCode
		self.alarmType = alarmType
		self.itemBGImage = itemBGImage
		self.itemPressBGImage = itemPressBGImage
		super.init()
	}
	
}
