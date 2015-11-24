//
//  UserHttpOperation.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/23.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//用户相关的接口处理

import UIKit

class UserHttpOperation: BaseHttpOperation {
	//登录请求和返回
	class func operationLogin(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var params1) -> [String : AnyObject] in
//			1是通用，2是中行，3是演示
			var appType = 1
			if Config.IsChinaBank {
				appType = 2
			}else if Config.IsDemo {
				appType = 3
			}
//			"appType":appType
			params1 = ["encryptType":0,"device":1,"userName":threadModel.stringValue!,"password":threadModel.stringValue2!,"appType":appType]
//			if Config.IsChinaBank {
//				params1 = ["encryptType":0,"device":1,"userName":threadModel.stringValue!,"password":threadModel.stringValue2!]
//			}
			var deviceToken = UserData.getDeviceToken()
			if let token = deviceToken {
				params1["deviceToken"] = token
			}
			return params1
		})
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if threadMsg.receiveIsSuccess {
				let user = UserM(json: threadMsg.receiveResultDict!)
				user.loginName = threadModel.stringValue!
				user.password = threadModel.stringValue2!
				UserData.setMyUser(user)
			}
		}
	}
	
	//修改密码
	class func operationActionPasswordModify(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var params1) -> [String : AnyObject] in
//			"loginName":"13800138000",	//登录名
//			"oldPassword":"ty123456789",	//原来密码
//			"newPassword":"09876543ty"	//新密码
			params1["loginName"] = UserData.getMyUser()!.loginName
			params1["oldPassword"] = threadModel.stringValue
			params1["newPassword"] = threadModel.stringValue2
			return params1
		})
//		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
//			if threadMsg.receiveIsSuccess {
//				let user = UserM(json: threadMsg.receiveResultDict!)
//				UserData.setMyUser(user)
//			}
//		}
	}
	
	//提交意见反馈
	class func operationActionSuggest(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var params1) -> [String : AnyObject] in
			params1["content"] = threadModel.stringValue
			return params1
		})
	}
	//登出
	class func operationLogout(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var params1) -> [String : AnyObject] in
			return params1
		})
	}
	//绑定账户
	class func operationActionAccountBinding(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (var params1) -> [String : AnyObject] in
			//获取deviceToken
			params1["serialNumber"] = UserData.getDeviceToken()
			params1["encryptType"] = 0
			params1["type"] = 1
			return params1
		})
	}

}
