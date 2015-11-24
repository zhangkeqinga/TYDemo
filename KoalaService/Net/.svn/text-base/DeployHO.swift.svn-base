//
//  DeploryHttpOperation.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/26.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//布防相关的接口

import UIKit

class DeployHO: BaseHO {
	//获取布防的属性列表(中心负责人专用)
	class func operationGetAttributeList(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { ( params1) -> [String : AnyObject] in
			return params1
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if threadMsg.receiveIsSuccess {
//				let resultDict = threadMsg.receiveResultDict!
				if threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil{
					return
				}
				
				let resultDict = threadMsg.receiveResultDict!
				//获取数组,返回
				let resultList = resultDict["orgList"] as! [NSDictionary]
				var result = [OrganizationAttributeM]()
				for (_,itemDict) in resultList.enumerate(){
					let item = OrganizationAttributeM(json: itemDict)
					result.append(item)
				}
				threadMsg.arrayValue = result
			}
		}
	}
	//布防详情
	class func operationGetBranchDeployInfo(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var params1) -> [String : AnyObject] in
			params1["organizationId"] = threadModel.intValue!
			return params1
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess {
				return
			}
			let resultDict = threadModel.receiveResultDict!
			let deploy = DeployM(json: resultDict)
			threadModel.objectValue = deploy
		}
	}
	//子组织结构
	class func operationGetChildrenOrgDeployInfo(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var params1) -> [String : AnyObject] in
			params1["organizationId"] = threadModel.intValue!
			params1["organizationAttributeId"] = threadModel.stringValue
			return params1
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess {
				return
			}
			if threadMsg.receiveResultDict == nil {
				return
			}
			//获取一个总的布防3个状态的数据

			let organizationDeployInfoM = OrganizationDeployInfoM(json:threadMsg.receiveResultDict!)
			threadMsg.objectValue = organizationDeployInfoM
			//然后获取组织机构的列表
			
			//获取数组,返回
			let resultList = threadMsg.receiveResultDict!["orgList"] as! [NSDictionary]
			var result = [OrganizationM]()
			for itemDict in resultList{
				let item = OrganizationM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result

		}
		
	}
	
	//延迟布防
	class func operationDelayDeploy(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var params1) -> [String : AnyObject] in
//			"organizationId":7,"delayDeployTime":"2015-09-08 19:30:01","delayDeployType":1,"delayDeployReason":"开会"
			params1["organizationId"] = UserData.getMyUser()!.organizationId
			//加班1,开会2,其他3
			params1["delayDeployType"] = threadModel.intValue!
			params1["delayDeployTime"] = threadModel.stringValue
			params1["delayDeployReason"] = threadModel.stringValue2
			return params1
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
		}
		
	}
	
	//取消延迟布防
	class func operationCancelDelayDeployGetDeployInfo(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var params1) -> [String : AnyObject] in
			params1["organizationId"] = threadModel.intValue!
			return params1
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess {
				return
			}
			let resultDict = threadModel.receiveResultDict!
			let deploy = DeployM(json: resultDict)
//			if Config.IsCarlos {
//				deploy.status = 2
//			}
			threadModel.objectValue = deploy
		}
	}


}


