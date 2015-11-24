//
//  DeployHostM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/26.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//布防下的主机信息

import UIKit

class DeployHostM: BaseM {
	var hostName : String = "" //"主机1",
	var hostNumber : String = "" //"10D956",
	var zonePos : String = ""//部位
	var status : Int = 0 //1,                         //1：已经布防 0： 未布防
	var mainDevice : Int = 0 //1,                     //关键主机1：是 0：不是
	var deployDisarmedTime : String = "" //"2014-12-09 12:23 09"      //布撤防时间
	var operateList :[HostOperateM]!
	override init(json: NSDictionary) {
		super.init(json: json)
		self.operateList = []
		if let items: AnyObject = json["operateList"] {
			let itemsDicts = items as! [NSDictionary]
			for itemDict in itemsDicts {
				let item = HostOperateM(json: itemDict)
				self.operateList.append(item)
			}
		}
	}
}
