//
//  PersonGroupData.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/17.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class PersonGroupData: BaseData {
	//获取所有的群组
	class func getAllGroup()->[PersonGroupM] {
		if UserData.getMyUser() == nil {
			return []
		}
			let mKey = UserData.getMyUser()!.loginName
		let arr = PersonGroupM.searchWithWhere("mKey = \(mKey)", orderBy: "", offset: 0, count: 1000)
		if arr.count == 0 {
			
			return [getLocalUnGroupGroupM()]
		}
		return NSArray(array: arr) as! [PersonGroupM]
	}
	//添加一个对象到未分组里
	class func addPersonToUnGroup(person:PersonM){
		let ungroup = PersonGroupData.getLocalUnGroupGroupM()
		ungroup.persons = ungroup.persons + [person]
		ungroup.updateToDB()
	}
	//根据其他分组过滤未分组的数据
	class func updateUnGroupWithOtherGroup(otherGroup:PersonGroupM){
		//删除所有未分组有关的数据
		let unGrup = PersonGroupData.getLocalUnGroupGroupM()
		var groupPersonIds:[Int] = []
		for person in otherGroup.persons {
				groupPersonIds.append(person.id)
		}
		let unGroupPersons  = unGrup.persons
		var newUnGroupPersons:[PersonM] = []
		for unPerson in unGroupPersons {
			if groupPersonIds.contains(unPerson.id) {
				continue
			}
			newUnGroupPersons.append(unPerson)
		}
		unGrup.persons = newUnGroupPersons
		unGrup.updateToDB()
	}
	//获取未分组的分组
	static let UnGroupId = 999999
	class func getLocalUnGroupGroupM()->PersonGroupM {
		if UserData.getMyUser() == nil {
			return PersonGroupM()
		}
		let mKey = UserData.getMyUser()!.loginName
		let group:AnyObject? = PersonGroupM.searchSingleWithWhere("id = \(UnGroupId) and mKey = \(mKey)", orderBy: "")
		var group1:PersonGroupM!
		if group == nil {
			group1 = PersonGroupM()
			group1.name = "未分组"
			group1.id = UnGroupId
			group1.mKey = mKey
			//把目前所有的都分配到群组里
			let allPersons = PersonM.searchWithWhere("mKey = \(mKey)", orderBy: "", offset: 0, count: 500)
			let alls = NSArray(array: allPersons) as! [PersonM]
			group1.persons = alls
			group1.saveToDB()

		}else{
			group1 = group as! PersonGroupM
		}
		return group1
	}
}
