//
//  OrganizationDeployInfoM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/26.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//组织机构布防的数量信息

import UIKit

class OrganizationDeployInfoM: BaseM {
	var deployedCount : Int = 0 //已经布防数量
	var noDeployedCount : Int = 0 //未布防数量
	var delayDeployedCount : Int = 0//延迟布防数量
	//本地属性
	var localOrganizationList:[OrganizationM]?
	var localSetTime:NSDate?
	var localOrganizationId:Int = -1
	var localOrganizationAttributeId:String?
}
