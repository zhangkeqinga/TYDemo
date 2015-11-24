//
//  OrganizationM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/26.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//机构数据模型

import UIKit

class OrganizationM: BaseM {
	var organizationId : Int = 0//所属机构Id
	var parentOrganizationId : Int = 0//所属父机构Id
	var organizationName: String = ""//机构名称
	var status : Int = 0 //1,                                 //1.已布防2未布防3延迟布防
	var pinyin :String = ""//拼音
	var organizationAttributeId : String = "" //组织机构属性Id,这是外部传递过来的,不是从接口的json里获取到的
	var deployInfo:OrganizationDeployInfoM?
	var hasSon:Bool = false
	override init(json: NSDictionary) {
		super.init(json: json)
		if let deployInfoDict: AnyObject = json["deployInfo"]{
			let deployInfoDict_ = deployInfoDict as! NSDictionary
			deployInfo = OrganizationDeployInfoM(json:deployInfoDict_)
		}
	}

}
