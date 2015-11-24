//
//  BaseHttpOperation.swift
//  MyFramework_Swift
//
//  Created by carlosk on 15/2/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class BaseHO: COHttpOperation {
	
	//获取基本数据..用于非登录接口
	//	(block:((threadMsg:COThreadM)->Void))
	class func setParamsWithBase(threadMolde:COThreadM,block:(([String:AnyObject])->[String:AnyObject] )){
		let threadMolde1 = threadMolde as! ThreadM
		let httpEnty = threadMolde1.httpEntyModel
		httpEnty.method = COHttpEntyModel.COHttpMethod.Post
		httpEnty.param = ["jsonrpc":"2.0","id":123,"method":threadMolde1.apiIF_.getActionName()]
		var params = [String:AnyObject]()
		params["userGuid"] = UserData.getMyUG()
		if  threadMolde.isKindOfClass(PageThreadM.self) {
			let pageT = threadMolde as! PageThreadM
			params["count"] = pageT.pageCount
			params["page"] = pageT.page
		}
		params = block(params)
		httpEnty.param["params"] = params
	}
	
	//处理返回的分页的数据
	class func operationReceivePageData(threadM:PageThreadM){
		if !threadM.receiveIsSuccess {
			return
		}
//		threadM.pageCount = threadM.receiveResultDict!["pageCount"] as? Int ?? 0
//		threadM.currentPage = threadM.receiveResultDict!["currentPage"] as? Int ?? 0
	}
	
}
