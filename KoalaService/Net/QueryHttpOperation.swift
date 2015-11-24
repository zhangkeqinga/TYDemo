//
//  QueryHttpOperation.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/3/3.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//查询相关的借款

import UIKit

class QueryHttpOperation: BaseHttpOperation {
	//中心负责人查询网点列表
	class func operationGetSonBranchList(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var params1) -> [String : AnyObject] in
			params1["organizationId"] = UserData.getMyUser()!.organizationId
			return params1
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess {
				return
			}
			if threadMsg.receiveResultDict == nil {
				return
			}
			//然后获取组织机构的列表
			
			//获取数组,返回
			var resultList = threadMsg.receiveResultDict!["organizationList"] as! [NSDictionary]
			var result = [OrganizationM]()
			for itemDict in resultList{
				let item = OrganizationM(json: itemDict)
				result.append(item)
			}
			let (titles,organizations) = CommData.fillOrganizationsWithPinyin(result)
			threadMsg.arrayValue = titles
			threadMsg.arrayValue2 = organizations
		}
}
	//查询某天的布防信息
	class func operationGetHistoryDeploy(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var params1) -> [String : AnyObject] in
			params1["organizationId"] = threadModel.intValue!
			params1["dayTime"] = threadModel.stringValue
			return params1
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess {
				return
			}
			if threadMsg.receiveResultDict == nil {
				return
			}
			//然后获取组织机构的列表
			//获取数组,返回
			var result = DeployM(json: threadMsg.receiveResultDict!)
			threadMsg.objectValue = result
		}
	}

}
