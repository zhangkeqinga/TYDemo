//
//  AlarmM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/21.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//报警的数据

import UIKit

class AlarmM: BaseM {
	var alarmId : Int = 0 //1821,                              //报警ID号
	var alarmTime : String = "" //"2014-09-12 13:38:51",              //报警时间
	var alarmType : String = "" //"劫警",                           //报警类型
	var alarmCode : String = "" //"120",                            //报警类型编号
	var erFlag : String = "" //"E",                               //E报警R恢复（空, "",：其他）
	var branchName : String = "" //"上海银行浦东分行",                //网点名称
	var branchAddress : String = "" //"上海浦东新区张杨路1110号",   //网点地址
	var organizationId : Int = 0 //100,   //网点组织机构Id该报警所属的网点，该值用于第9接口，获取指定网点和报警代码的备用群组信息
	var zonePos : String = "" //"9楼"                              //防区位置
	var hostNumber : String = "" //"10D956",      //主机编号
	var readStatus : Int = 0 //   0,                          //0报警未读；1报警已读
	var securityCompany : String = "" //"上海九安安保有限公司"      //保安公司
	var groupId:Int = 0//临时群组号
	var guardInCharge :[AlarmPersonM] = []//保卫经理
	var personInCharge :[AlarmPersonM] = []//报警负责人
	var isTest:Bool = false
	override init(json: NSDictionary) {
		super.init(json: json)
		//获取config
		self.guardInCharge = initList("guardInCharge", json: json)

		self.personInCharge = initList("personInCharge", json: json)
	}
	//填充列表数据
	private func initList(jsonKey:String,json:NSDictionary) -> [AlarmPersonM]{
		var list:[AlarmPersonM] = []
		if let guardInCharge: AnyObject = json[jsonKey] {
			let guiardResultList = guardInCharge as! [NSDictionary]
			for (_,itemDict) in guiardResultList.enumerate(){
				let item = AlarmPersonM(json: itemDict)
				list.append(item)
			}
		}
		return list
	}
	
	
}
