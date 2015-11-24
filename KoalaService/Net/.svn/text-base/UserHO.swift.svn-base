//
//  UserHttpOperation.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/23.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//用户相关的接口处理

import UIKit

class UserHO: BaseHO {
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
			let deviceToken = UserData.getDeviceToken()
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
		setParamsWithBase(threadModel, block: { (params1) -> [String : AnyObject] in
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
	
	
	//TODO: 获取个人信息
	class func operationGetUserInfo(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (params1) -> [String : AnyObject] in
			//获取deviceToken
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
	//TODO: 修改个人信息
	class func operationActionUserInfoModify(threadModel:COThreadM){
		setParamsWithBase(threadModel, block: { (params1) -> [String : AnyObject] in
//			"position":"路支行行长",		//职位
//			"tel":"1380000138000",			//联系电话
//		 "email":"23233@163.com",		//邮箱
//		 "intro":"哥是天才"				//简介
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
// 修改个人头像
	class func operationActionUserAvatarModify(threadModel:COThreadM){
	
		var url:NSString = APIEnum.getBBaseUrl() + "/medias/app/upload?userguid={{userguid}}&id=-333&method=App_Action_UserAvatarModify"
		url = url.stringByReplacingOccurrencesOfString("{{userguid}}", withString: UserData.getMyUG())
		let media = threadModel.objectValue as! MediaM
		threadModel.httpEntyModel.url = url as String
		threadModel.httpEntyModel.method = .Post
		threadModel.httpEntyModel.fileName = media.localFileName
		threadModel.httpEntyModel.uploadPath = media.localFilePath
		threadModel.httpEntyModel.contentType = "image/png"
		threadModel.setReceiveToBackgourBlock { (threadMsg) -> Void in
			if !threadMsg.receiveIsSuccess || threadMsg.receiveContent == nil || threadMsg.receiveContent!.jsonContentParseDict() == nil {
				return
			}			
			let resultDict = threadMsg.receiveResultDict!
			let message = resultDict["message"] as! String
			media.url = message
		}

		
	}
	


}
