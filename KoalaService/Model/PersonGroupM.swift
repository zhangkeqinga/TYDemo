//
//  PersonGroupM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/17.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//通讯录的群组

import UIKit

class PersonGroupM: BaseM {
	
	var id = 0
	var name:NSString = ""
	var mKey:NSString = ""//这是key
	var persons:[PersonM] = []
	var boolValue:Bool = false
	override class func getTableName()->String{
		return "PersonGroupM"
	}
	//在类 初始化的时候
	override class func initialize(){
		self.setUserCalculateForCN("persons")
	}
	
	
	override func userGetValueForModel(property: LKDBProperty!) -> AnyObject! {
		if property.sqlColumnName.characters.elementsEqual("persons".characters){
			//删除所有的
			let mKey = UserData.getMyUser()!.loginName

			DBHandler.deleteWithClass(PersonGroupRelateM.classForCoder(), withWhere: "groupId = \(id) and mKey = \(mKey)", withHelper: PersonGroupRelateM.getUsingLKDBHelper())
			if persons.count == 0 {
				return ""
			}
			
			for person in persons {
				//存储关联表
				if !person.isExistsFromDB() {
					person.saveToDB()
				}
				//存储Person表
				
				if UserData.getMyUser() != nil {
					let pgr: AnyObject? = PersonGroupRelateM.searchSingleWithWhere("groupId = \(id) and personId = \(person.id) and mKey = \(mKey)", orderBy: "")
					if pgr == nil {
						let nPgr = PersonGroupRelateM()
						nPgr.groupId = id
						nPgr.personId = person.id
						nPgr.mKey = mKey
						//					nPgr.id = id * 10000 + person.id
						nPgr.saveToDB()
					}
				}
				
			}
			return id
		}
		return id
	}
	override func userSetValueForModel(property: LKDBProperty!, value: AnyObject!) {
		if property.sqlColumnName.characters.elementsEqual("persons".characters){
			//查出所有的数据
			if UserData.getMyUser() == nil {
				return
			}
			let mKey = UserData.getMyUser()!.loginName
			let persons  = DBHandler.searchWithSQL("Select p.* FROM PersonM p,PersonGroupRelateM r, PersonGroupM g where g.id = r.groupId and r.personId = p.id and g.mKey = \(mKey) and p.mKey = \(mKey) and r.mKey = \(mKey) and g.id = \(id)", withClass: PersonM.classForCoder(), withHelper: PersonM.getUsingLKDBHelper())
			self.persons = NSArray(array: persons) as! [PersonM]
		}
	}
	//重新设置他所包含的数据
//	func updatePersons(persons:[PersonM]){
//		//先删除所有的关联
//		PersonGroupRelateM.getUsingLKDBHelper().deleteWithTableName(PersonGroupRelateM.getTableName(), `where`: "groupId = \(id)")
//		//然后添加所有的关联
//		let mKey = UserData.getMyUser()!.loginName
//		for eachnPerson in persons {
//			let re = PersonGroupRelateM()
//			re.mKey = mKey
//			re.groupId = id
//			re.personId = eachnPerson.id
//			re.saveToDB()
//		}
//		self.persons = persons
//	}
//	func getPersons()->[PersonM]{
//		if self.persons.count == 0 {
//			let mKey = UserData.getMyUser()!.loginName
//			let persons  = DBHandler.searchWithSQL("Select p.* FROM PersonM p,PersonGroupRelateM r, PersonGroupM g where g.id = r.groupId and r.personId = p.id and g.mKey = \(mKey) and g.id = \(id)", withClass: PersonM.classForCoder(), withHelper: PersonM.getUsingLKDBHelper())
//
//			self.persons = NSArray(array: persons) as! [PersonM]
//		}
//		return self.persons
//	}
	
	
}
