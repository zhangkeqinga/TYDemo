//
//  DynamicMessageData.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/3/7.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//动态数据的管理

import UIKit
private var dynamicMessageMs = [String:[DynamicMessageM]]()
class DynamicMessageData: BaseData {
	
//	//获取动态的服务器的消息
//	class func getDynamicMessages()->[DynamicMessageM]{
//		return getMyDynamicMessages()
//	}
//	//获取未读消息数
//	class func getUnreadDynamicMessageCount()->Int{
//		var count = 0
//		for item in getMyDynamicMessages(){
//			if !item.isRead {
//				count++
//			}
//		}
//		if Config.IsCarlos {
//			count = 123
//		}
//		return count
//	}
//	
//	//清空当前的本地数据
//	class func clearMyLocalDynamicMsgs(){
//		DynamicMessageM.deleteToDB()
//		var userName = UserData.getMyUser()?.userName
//		if String.isEmpty(userName) {
//			return
//		}
//		dynamicMessageMs.removeValueForKey(userName!)
//		
//	}
//	//获取属于我的未读消息数据
//	class func getMyDynamicMessages()->[DynamicMessageM]{
//		//		if Config.IsCarlos {
//		//			var testResult = [DynamicMessageM]()
//		//			for index in 0...10 {
//		//				let dict1 = ["id":404496,"infoType":3,"infoId":537682,"createTime":"2015-03-06 18:06:15","content":"CA100:毛微昕:谢谢我现在微微一笑"]
//		//				var test1 = DynamicMessageM(json:dict1)
//		//				testResult.append(test1)
//		//			}
//		//			return testResult
//		//		}
//		var userName = UserData.getMyUser()?.userName
//		if String.isEmpty(userName) {
//			return [DynamicMessageM]()
//		}
//		
//		var msgs = dynamicMessageMs[userName!]
//		if msgs == nil || msgs!.count == 0 {
//			//从数据库查找
//			var msgs1 = DynamicMessageM.searchWithWhere("userName=\"\(userName!)\"", orderBy: "", offset: 0, count: 1000)
//			msgs = [DynamicMessageM]()
//			for item in msgs1 {
//				msgs!.append(item as! DynamicMessageM)
//			}
//			//全部重新排序,把最新的放在前面
//			msgs!.sort({ (m1, m2) -> Bool in
//				//生成时间
//				let d1 = NSDate.converToDate(dateStr: m1.createTime as String)
//				let d2 = NSDate.converToDate(dateStr: m2.createTime as String)
//				if d1 == nil {
//					return false
//				}else if d2 == nil {
//					return true
//				}
//				return d1!.timeIntervalSinceNow > d2!.timeIntervalSinceNow
//			})
//			dynamicMessageMs[userName!] = msgs
//		}
//		
//		return msgs!
//	}
//	//存储属于我的未读消息数
//	private class func setMyDynamicMessages(msgs:[DynamicMessageM]){
//		var userName = UserData.getMyUser()?.userName
//		if String.isEmpty(userName) {
//			return
//		}
//		dynamicMessageMs[userName!] = msgs
//		DBHandler.deleteWithClass(DynamicMessageM.self, withWhere: "userName=\"\(userName!)\"", withHelper: DynamicMessageM.getUsingLKDBHelper())
//		//把新的存储下来
//		for item in msgs{
//			item.userName = userName!
//			item.saveToDB()
//		}
////		DynamicMessageM.getUsingLKDBHelper().deleteWithClass(DynamicMessageM.self, where: o)
//	}
//	//设置一个已读
//	class func setAlarmRead(alarmId:Int){
//		var mMessages = getMyDynamicMessages()
//		for item in mMessages {
//			if item.infoId == alarmId && item.infoType == 3{
//				item.isRead = true
//				item.updateToDB()
//			}
//		}
//	}
	
	//存入动态的服务器的的数据
//	class func addDynamicMessages(msgs:[DynamicMessageM]){
//		if msgs.count == 0 {
//			return
//		}
//		var ms = getMyDynamicMessages()
//		for item in msgs  {
//			if item.infoType == 3 {
//				ms.append(item)
//			}
//		}
//		log("获取了\(msgs.count)个未读信息")
//		setMyDynamicMessages(ms)
//	}

}
