//
//  DemoHttpOperation.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/5/13.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class DemoHO: BaseHO {
	
//	case  DemoBranchList//获取模拟网点和主机列表
//	case  DemoActionAlarm//模拟发报警
//	case  DemoActionDeploy//模拟布防
	
	//获取模拟网点和主机列表
	class func operationDemoBranchList(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (param) -> [String : AnyObject] in
			return param
		})
		threadModel.httpEntyModel.param.removeValueForKey("jsonrpc")
		threadModel.httpEntyModel.url = APIEnum.BaseDemoUrl
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in

			if threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil{
				return
			}
			
			let resultDict = threadMsg.receiveResultDict!
			//获取数组,返回
			let resultList = resultDict["branchList"] as! [NSDictionary]
			var result = [DeployM]()
			for (_,itemDict) in resultList.enumerate(){
				let item = DeployM(json: itemDict)
				result.append(item)
			}
			threadMsg.arrayValue = result
		}
	}
	////模拟发报警
	class func operationDemoActionAlarm(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var param) -> [String : AnyObject] in
			//				"alarmCode":"CA100","branchId":1100
			param["alarmCode"] = threadModel.stringValue
			param["branchId"] = threadModel.intValue
			return param
		})
		threadModel.httpEntyModel.param.removeValueForKey("jsonrpc")
		threadModel.httpEntyModel.url = APIEnum.BaseDemoUrl
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			
		}
	}

	//模拟布防
	class func operationDemoActionDeploy(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var param) -> [String : AnyObject] in
			//				"alarmCode":"CA100","branchId":1100
			param["branchId"] = threadModel.intValue
			param["operateType"] = threadModel.intValue2
			param["hostNumber"] = threadModel.stringValue
			return param
		})
		threadModel.httpEntyModel.param.removeValueForKey("jsonrpc")
		threadModel.httpEntyModel.url = APIEnum.BaseDemoUrl
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in

		}
	}
	
}
