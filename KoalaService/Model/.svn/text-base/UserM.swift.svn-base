//
//  UserM.swift
//  MyFramework_Swift
//
//  Created by carlosk on 15/2/5.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//用户的数据模型

import UIKit

class UserM: BaseM {
	var userGuid:String=""
	var userId:Int=0
	var userName:String=""
	var loginName:String=""//登录的手机号,这个是从输入框里取
	var loginTime:String=""
	var userType:Int=0 //1.网点负责人2中心负责人3角色三4角色四 等
	var organizationId:Int=0
	var organizationName:String=""
	var code:Int = 0
	var message:String=""
	var avatarUrl = ""//头像的url
	var bindingStatus:Bool = false //是否已经绑定
	var config:UserConfigM?
	var password:String = ""//这是UI属性,不是接口的
		class func configClass() -> AnyClass{
			return UserConfigM.self
		}
		override init(json: NSDictionary) {
			super.init(json: json)
			//获取config
			if let configObj: AnyObject = json["config"] {
				let dict: NSDictionary = configObj as! NSDictionary
				let config = UserConfigM(json:dict)
				self.config = config
			}
		}
	//是否是网点负责人
	func isBranchUser() ->Bool {
		return userType == 1
	}
}
