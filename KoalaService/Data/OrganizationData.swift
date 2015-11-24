//
//  OrganizationData.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/5/12.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class OrganizationData: BaseData {
	private static var localOrganizationDict = [String:OrganizationDeployInfoM]()
	// 清除本地的数据
	class func clearLocalData(){
		localOrganizationDict = [String:OrganizationDeployInfoM]()
	}
	//根据
	class func getLocalListByOrganization(organizationM:OrganizationM) -> OrganizationDeployInfoM? {

		let key = "\(organizationM.organizationId)-\(organizationM.organizationAttributeId)"
		let info = localOrganizationDict[key]
		//如果超过5分钟,则需要重新取
		return info
	}
	class func setLocalList(organizationMs:[OrganizationM],info:OrganizationDeployInfoM){
		if organizationMs.count == 0 || info.localOrganizationId < 0 || info.localOrganizationAttributeId == nil  {
			return
		}
		info.localOrganizationList = organizationMs
		info.localSetTime = NSDate()
		let key = "\(info.localOrganizationId)-\(info.localOrganizationAttributeId!)"
		localOrganizationDict[key] = info
	}
	//根据关键字查找数据
	class func fillOrganizationWithKeyword(data:[OrganizationM],keyword:String) -> [OrganizationM]{
		
		var results = [OrganizationM]()
		for item in data {
			let yinpin = item.pinyin as NSString
			let name = item.organizationName as NSString
			if #available(iOS 8.0, *) {
			    if yinpin.containsString(keyword){
    				results.append(item)
    			}else if name.containsString(keyword){
    				results.append(item)
    			}
			}
		}
		return results
	}
}
