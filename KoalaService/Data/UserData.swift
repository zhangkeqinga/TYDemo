//
//  UserData.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/17.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit
private	var  mUser:UserM?
private var isTestBranchUser = false//是否是测试的网点负责人,false为测试的中心负责人
private let deviceTokenKey = "deviceTokenKey"
//private let bindAccountKey = "bindAccountKey"
class UserData: BaseData {

	//获取我的User对象
	class func getMyUser() ->UserM?{
		if Config.IsCarlos && mUser == nil {
			fillTestUser()
		}
		return mUser
	}
	
	class func setMyUser(user:UserM){
		//查看本地是否有这个用户,没有则创建
		mUser = user
		PersonData.saveMyUser(user)
	}
	//获取的userGuide
	private class func fillTestUser(){
		mUser = UserM(json: NSDictionary())
		if isTestBranchUser {
			// 网点负责人 18735010002
			mUser!.organizationName = "顾北路支行"
			mUser!.loginName = "13918809381"
			mUser!.userName = "郑普通"
			mUser!.organizationId = 21
			mUser!.password = ""
			mUser!.userId = 14895
			mUser!.userType = 1
			mUser!.avatarUrl = "/file/appPic/14895/20150814/aee96029-9e4d-4833-9a97-7dbadefa5874.jpg"
			mUser!.userGuid = "bff2db52-797a-4155-b6b0-30a911538a3e"
		}else{
			mUser!.userGuid = "bff2db52-797a-4155-b6b0-30a911538a3e"
			mUser!.userType = 2
			mUser!.password = ""
			mUser!.userId = 15
			mUser!.userName = "周骏"
			mUser!.loginName = "18049898610"
			mUser!.organizationId = 951
		}
	}
	class func getMyUG() -> String{
		if Config.IsCarlos && mUser == nil{
			fillTestUser()
			//以下是网点负责人的
		}
		if let mUser1 = mUser {
			return mUser1.userGuid
		}
		return ""
	}
	//存入设备的token

	class func setDeviceToken(var deviceToken:String){
		deviceToken = deviceToken.stringByReplacingOccurrencesOfString("<", withString: "")
		deviceToken = deviceToken.stringByReplacingOccurrencesOfString(" ", withString: "")
		deviceToken = deviceToken.stringByReplacingOccurrencesOfString(">", withString: "")
//		print("deviceToken=\(deviceToken)")
//		if Config.IsHttpInernalTest {
//			currentVC?.alert("你的设备token是\(deviceToken)")
//		}
		COPlistTool.setValue(deviceTokenKey, value: deviceToken)
	}
	//获取设备的token
	class func getDeviceToken()->String?{
		if Config.IsCarlos {
			return "testdevicetoken"
		}
		let value: AnyObject? = COPlistTool.getValue(deviceTokenKey)
		return value as! String?
	}
	//是否绑定过账号

	class func isBindAccount()->Bool{
		if getMyUser()?.bindingStatus == nil {
			return false
		}
		return getMyUser()?.bindingStatus ?? false
	}
	//绑定设备
	class func bindAccount(){
		getMyUser()?.bindingStatus = true
	}
	
	//是否是简单的密码
	class func isSimplePassword()->Bool{
		if Config.IsCarlos {
			return false
		}
		let mUser = getMyUser()
		if mUser == nil {
			return false
		}
		let regex = "^(?!\\D+$)(?![^a-z]+$)[a-z0-9]{6,16}$"
		return !mUser!.password.verifyBase(regex)
	}
}
