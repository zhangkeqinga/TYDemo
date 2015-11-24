//
//  QueryData.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/5/8.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class QueryData: BaseData {
	
	//获取查询的model
	class func getAlarmQueryConditionCellModels()->[QueryCategoryCellM] {
//		var results = [QueryCategoryCellM]()
		let m1 = QueryCategoryCellM()
		m1.title = "选择网点"
		m1.cellOnClick = {
			 (model)->Void in
			if currentVC!.isKindOfClass(QueryCategoryVC) {
				(currentVC as! QueryCategoryVC).gotoChooseBranchVC(model)
			}
		}
		let mUser = UserData.getMyUser()!
		if mUser.isBranchUser() {
			let orM = OrganizationM(json: NSDictionary())
			orM.organizationId = mUser.organizationId
			orM.organizationName = mUser.organizationName
			m1.data = orM
			m1.title = "网点名称"
			m1.content = orM.organizationName
			m1.cellOnClick = nil
		}
		
		
		let m2 = QueryCategoryCellM()
		m2.title = "报警类型"
		m2.cellOnClick = {
			(model)->Void in
			
			if currentVC!.isKindOfClass(QueryCategoryVC) {
				(currentVC as! QueryCategoryVC).gotoChooseAlarmType(model)
			}
		}
		
		let m3 = QueryCategoryCellM()
		m3.title = "开始时间"
		m3.cellOnClick = {
			(model)->Void in
			if currentVC!.isKindOfClass(QueryCategoryVC) {
				(currentVC as! QueryCategoryVC).showPickDateV(model,dateModel:UIDatePickerMode.DateAndTime)
			}
		}
		
		let m4 = QueryCategoryCellM()
		m4.title = "结束时间"
		m4.cellOnClick = {
			(model)->Void in
			if currentVC!.isKindOfClass(QueryCategoryVC) {
				(currentVC as! QueryCategoryVC).showPickDateV(model,dateModel:UIDatePickerMode.DateAndTime)
			}
		}

		return [m1,m2,m3,m4]
		
	}
	//获取布防查询的UI模型
		class func getDeployQueryConditionCellModels()->[QueryCategoryCellM] {
			let m1 = QueryCategoryCellM()
			m1.title = "选择网点"
			m1.cellOnClick = {
			 (model)->Void in
				if currentVC!.isKindOfClass(QueryCategoryVC) {
					(currentVC as! QueryCategoryVC).gotoChooseBranchVC(model)
				}
			}
			
			let mUser = UserData.getMyUser()!
			if mUser.isBranchUser() {
				let orM = OrganizationM(json: NSDictionary())
				orM.organizationId = mUser.organizationId
				orM.organizationName = mUser.organizationName
				m1.data = orM
				m1.title = "网点名称"
				m1.content = orM.organizationName
				m1.cellOnClick = nil
			}
			

			let m2 = QueryCategoryCellM()
			m2.title = "日期"
			m2.cellOnClick = {
				(model)->Void in
				if currentVC!.isKindOfClass(QueryCategoryVC) {
					(currentVC as! QueryCategoryVC).showPickDateV(model,dateModel:UIDatePickerMode.Date)
				}
			}
			
			return [m1,m2]

	}
}
