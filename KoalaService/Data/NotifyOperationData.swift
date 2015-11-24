//
//  NotifyOperationData.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/3/10.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//处理通知

import UIKit

class NotifyOperationData: BaseData {
	//处理通知
	//是否从桌面进入
	class func operation(userInfo: [NSObject : AnyObject],isInternalReceive:Bool){
		//		didReceiveRemoteNotification[aps: {
		//			alert = "";
		//			badge = 1;
		//			sound = default;
		//			}, data: {"content":"","createTime":"2015-03-10 14:00:00","id":0,"infoId":110,"infoType":1,"remark":"CA100"}]
		
		//如果当前不是详情页面则跳转到想去界面
//		{"id":1001,"infoType":2,"infoId":12302,"createTime":"2014-09-12 13:38:51","content":"xxx","remark":""
		

		let data: AnyObject? = userInfo["data"]
		if data == nil || currentVC == nil {
			return
		}
		let str = isInternalReceive ? "内部" :"外部"
		print("\(userInfo),这是从\(str)")
//		currentVC!.alert("\(data),这是从\(str)")
//		return
//		let data1: AnyObject = data!
//		let data2 = data as? [String : AnyObject]
		let data3 = data as? String
		if data3 == nil {
			return
		}
		let dict = data3!.jsonContentParseDict()
		if dict == nil {
			return
		}
		//查询是否是其他类型的,如果是的话直接发通知
		let type  = dict!["type"] as? Int ?? -1
		if type == 0 {
			//官方话题
			CU.notifyPost(TopicListVC.NN_HasOfficeTop_key)
			//如果还有at我的话,则继续发推送
			let atMe  = dict!["atMe"] as? Int ?? -1
			if atMe == 1 {
				CU.notifyPost(TopicListVC.NN_HasAtTop_key)
			}
			return
		}else if type == 1 {
			//自由话题
			CU.notifyPost(TopicListVC.NN_HasFreeTop_key)
			//如果还有at我的话,则继续发推送
			let atMe  = dict!["atMe"] as? Int ?? -1
			if atMe == 1 {
				CU.notifyPost(TopicListVC.NN_HasAtTop_key)
			}
			return
		}


		var alert = userInfo["aps"]?["alert"] as? String
		if alert == nil {
			alert = "你收到一个消息"
		}
		//如果是内部获取的,提示该用户
//		if isInternalReceive {
//			if let vc = currentVC {
//				(vc as! BaseVC).showToast(alert!, block: { () -> Void in
//					
//				})
//			}
//			return
//		}
		//如果是中心负责人则进入布防界面,否则进入布防详情页面
		if UserData.getMyUser() == nil {
			return
		}
		
		do{
			let dynamicMessageM = try DynamicMessageM(json:dict!)
			switch dynamicMessageM.infoType {
						case 1:
		CU.notifyPost(AlarmMainVC.NN_NotifyHasNewAlarmKey)
				//			operationAlarm(dynamicMessageM,isInternalReceive:isInternalReceive)
			case 2:
				dispatch_async(dispatch_get_main_queue(), { () -> Void in
					operationDeploy(isInternalReceive)
				})
						case 3:
						CU.notifyPost(AlarmMainVC.NN_NotifyHasNewCommentKey)
			default:
				//			currentVC!.alert(alert!)
				break
			}
		}catch{
			
		}
		
	}
	//处理报警
	private class func operationAlarm(dynamicMessageM:DynamicMessageM,isInternalReceive:Bool){
		//如果是网点负责人
		if UserData.getMyUser()!.isBranchUser() {
			//说明是布撤防
			if currentVC!.isKindOfClass(AlarmListVC.self){
				//如果是想去界面,则直接刷新
				let mVc = currentVC as! AlarmListVC?
				if let mVc1 = mVc {
					//重新刷新
					mVc1.doGetAlarmList(false)
				}
			}else{
//				currentVC!.alert(alert, handler: { () -> Void in
//					MainTabbarV.goToOtherType(.Alarm)
				BaseDynamicsDrawerVC.goToSliderHomeVC()
//				})
			}
		return
		}
		
		if currentVC!.isKindOfClass(AlarmListVC.self){
			//如果是想去界面,则直接刷新
			let mVc = currentVC as! AlarmListVC?
			if let mVc1 = mVc {
				//重新刷新
				let alarmCode = dynamicMessageM.remark as String
				let alarmTitle = AlarmData.getAlarmTypeTitle(alarmCode)
				//获取code
				let alarmTemp = AlarmTypeM(alarmCode: alarmCode, alarmType: alarmTitle, itemBGImage: nil, itemPressBGImage: nil)
				mVc1.alarmType = alarmTemp
				mVc1.title = alarmTitle
				mVc1.doGetAlarmList(false)
			}
		}else{
//			currentVC!.alert(alert, handler: { () -> Void in
			currentVC!.pushVCWithRelationIF(CU.getClassName(AlarmListVC.self)!, block: { (vc) -> Void in
				let vc1 = vc as! AlarmListVC
				let alarmCode = dynamicMessageM.remark as String
				let alarmTitle = AlarmData.getAlarmTypeTitle(alarmCode)
				//获取code

				let alarmTemp = AlarmTypeM(alarmCode: alarmCode, alarmType: alarmTitle, itemBGImage: nil, itemPressBGImage: nil)
				vc1.alarmType = alarmTemp
			}, anim: false)
		}

	}
	private class func operationDeploy(isInternalReceive:Bool){
		//如果是网点负责人
		if UserData.getMyUser()!.isBranchUser() {
			
			//说明是布撤防
			if currentVC!.isKindOfClass(DeployDetailVC.self){
				//如果是想去界面,则直接刷新
				let mVc = currentVC as! DeployDetailVC?
				if let mVC1 = mVc {
					mVC1.organizationId = UserData.getMyUser()!.organizationId
					mVC1.doGetBranchDeployInfo()
					return
				}
			}
//			currentVC!.alert(alert, handler: { () -> Void in
			
			let vc = DeployDetailVC()
			vc.organizationId = UserData.getMyUser()!.organizationId
			currentVC!.pushXibVC(vc)
			return
		}
		//如果是中心负责人
		
		if currentVC!.isKindOfClass(DeployAttributeListVC.self){
			//如果是想去界面,则直接刷新
			let mVc = currentVC as! DeployAttributeListVC?
			if let mVC1 = mVc {
				mVC1.doGetAttributeList()
				return
			}
		}
		//否则提示
//		currentVC!.alert(alert, handler: { () -> Void in
				BaseDynamicsDrawerVC.goToSliderHomeVC()
//		})
		
	}
}
