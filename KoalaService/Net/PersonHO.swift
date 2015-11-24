//
//  PersonHO.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/15.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class PersonHO: BaseHO {
	
	// 查询人员列表
	class func operationGetContactPersonList(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (param) -> [String : AnyObject] in
			return param
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			
			if !threadMsg.receiveIsSuccess || threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil{
				return
			}
			
			let resultDict = threadMsg.receiveResultDict!
			//			//获取数组,返回
			let resultList = resultDict["contactPersonList"] as! [NSDictionary]
			var result = [PersonM]()
			for (_,itemDict) in resultList.enumerate(){
				let item = PersonM(json: itemDict)
				result.append(item)
			}
				PersonData.setAllPersonList(result)
//			let (titles,personss) = CommData.fillPersonsWithPinyin(result)
//			threadMsg.arrayValue = titles
//			threadMsg.arrayValue2 = personss
		}
	}

//
}
