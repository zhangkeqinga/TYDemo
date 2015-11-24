//
//  DeploryDetailM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/26.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//布防的详情数据

import UIKit
private let generalDeployTitles = ["工作日","休息日","特殊工作日"]
class DeployM: BaseM {
	var branchId : Int = 0//id
	var branchName : String = "" //网点组织名称
	var organizationName : String = "" //机构名称
	var parentOrganizationName : String = ""//所属机构
	var personInCharge : [AlarmPersonM]!//苹果网点负责人
	var guardInCharge : [AlarmPersonM]!//防卫经理点负责人
	var securityCompany : String  = ""//九安保安公司
	var realDeployDisarmedTime :String = ""//实际布撤防时间
	var branchAddress : String = ""//地址
	var organizationCategory : String = ""//金库
	var status : Int = 0 //1,                                 //1.已布防2未布防3延迟布防
	var dayStatus : Int = 0 //1,                                  //1：工作日2休息日3特殊工作日
	var realDeployTime : String = "" //"2014-09-12 16:38:51",         //实际的布防时间
	var generalDeployTime : String = "" //"15:38:51",             //约定布防时间（根据dayStatus判断）
	var generalDisarmedTime : String = "" //"15:38:51",           //约定撤防时间（根据dayStatus判断）
	var delayDeployType : Int = 0 //3,                            //延迟类型（1加班2开会3其他）
	var delayDeployTime : String = "" //"2014-09-12 15:38:51",            //延迟布防时间
	var delayDeployReason : String = "" //"开会延迟"  ,               //延迟布防原因（如果延迟类型是3）
	var deviceList:[DeployHostM]!
	var deployLogList:[DeployHostM]!
	//	deployLogList
	override init(json: NSDictionary) {
		super.init(json: json)
		self.guardInCharge = initList("guardInCharge", json: json)
		self.personInCharge = initList("personInCharge", json: json)
		self.deviceList = initHostList("deviceList",json:json)
		self.deployLogList = initHostList("deployLogList",json:json)
		
	}
	//获取工作状态的文字说明
	func  getDateStatusTitle()->String {
		var index = dayStatus > 1 ? dayStatus - 1 : 0
		if index < 0 || index > 2{
			index = 0
		}
		return generalDeployTitles[index]
	}
	//获取原因的文字
	func getResonString()->String{
		var result = ""
		switch delayDeployType {
		case 1:
			result = "加班"
		case 2:
			result = "开会"
		case 3:
			result = "其他(\(delayDeployReason))"
			if Config.IsCarlos {
				result = "其他(啊神烦大叔开发商将合法开始啊神烦大叔开发商将合法开始啊神烦大叔开发商将合法开始啊神烦大叔开发商将合法开始)"
			}
		default:
			result = ""
		}
		return result
	}
	//填充列表数据
	private func initHostList(jsonKey:String,json:NSDictionary) -> [DeployHostM]{
		var list:[DeployHostM] = []
		if let guardInCharge: AnyObject = json[jsonKey] {
			let guiardResultList = guardInCharge as! [NSDictionary]
			for itemDict in guiardResultList {
				let item = DeployHostM(json: itemDict)
				list.append(item)
			}
		}
		return list
	}

	//填充列表数据
	private func initList(jsonKey:String,json:NSDictionary) -> [AlarmPersonM]{
		var list:[AlarmPersonM] = []
		if let guardInCharge: AnyObject = json[jsonKey] {
			let guiardResultList = guardInCharge as! [NSDictionary]
			for itemDict in guiardResultList {
				let item = AlarmPersonM(json: itemDict)
				list.append(item)
			}
		}
		return list
	}

}
