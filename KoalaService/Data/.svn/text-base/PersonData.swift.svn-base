//
//  PersonData.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/16.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class PersonData: BaseData {
	
	//获取服务器端端的所有的用户信息
	class func getAllPersonList()->[PersonM]{
		return PersonData.allPersons
	}
	
	class func getAllPersonLists()->[[PersonM]]{
		return PersonData.allPersonss
	}
	class func getAllPersonTitles()->[String]{
		return PersonData.allPersonTitles
	}
	private static var allPersons:[PersonM] = []
	private static var allPersonss:[[PersonM]] = []
	private static var allPersonTitles:[String] = []
	//设置所有的用户信息
	class func setAllPersonList(persons:[PersonM]){
		if persons.count == 0 {
			return
		}
		let (titles,personss) = CommData.fillPersonsWithPinyin(persons)
		PersonData.allPersonTitles = titles
		PersonData.allPersonss = personss
		PersonData.allPersons = persons
	}
	//获取本地的数据列表
	class func getLoacalPersonList()->[PersonM]{
		if UserData.getMyUser() == nil {
			return []
		}
		let mKey = UserData.getMyUser()!.loginName
		let arr = PersonM.searchWithWhere("mKey = \(mKey)", orderBy: "", offset: 0, count: 1000)
		let data = NSArray(array: arr) as! [PersonM]
		return data
	}
	
	
	//存储我自己
	class func saveMyUser(user:UserM){
		let mKey = user.loginName
		var person = PersonM.searchSingleWithWhere("mKey = \(mKey) and id = \(user.userId)", orderBy: "") as? PersonM
		//如果有则更新
		if person != nil {
			person!.tel = user.loginName
			person!.id = user.userId
			person!.name = user.userName
			person!.avatarUrl = user.avatarUrl
			person!.department = user.organizationName
			person!.updateToDB()
		}else{
			person = PersonM()
			person!.tel = user.loginName
			person!.id = user.userId
			person!.mKey = user.loginName
			person!.name = user.userName
			person!.avatarUrl = user.avatarUrl
			person!.department = user.organizationName
			person!.saveToDB()
		}
	}
	
	//根据关键字查找数据
	class func fillPersonsWithKeyword(data:[PersonM],keyword:String) -> [PersonM]{
		
		var results = [PersonM]()
		for item in data {
			let yinpin = item.pinyin as NSString
			let name = item.name as NSString
			let tel = item.tel as NSString
			let department = item.department
			if #available(iOS 8.0, *) {
			    if yinpin.containsString(keyword){
    				results.append(item)
    			}else if name.containsString(keyword){
    				results.append(item)
    			}else if tel.containsString(keyword){
    				results.append(item)
					}else if department.containsString(keyword){
						results.append(item)
				}
				
			} else {
			}
		}
		return results
	}
	class func isLocal(person:PersonM)->Bool{
		if UserData.getMyUser() == nil {
			return false
		}
		let mKey = UserData.getMyUser()!.loginName
		//是否是本地
		let person:AnyObject? = PersonM.searchSingleWithWhere("id=\(person.id) and mKey = \(mKey)", orderBy: "")
		return person != nil
	}
	//获取我自己的用户信息
	class func getMyUserPerson()->PersonM?{
		if UserData.getMyUser() == nil {
			return nil
		}
		let mKey = UserData.getMyUser()!.loginName
		//是否是本地
		let person:AnyObject? = PersonM.searchSingleWithWhere("id=\(UserData.getMyUser()!.userId) and mKey = \(mKey)", orderBy: "")
		return person as? PersonM
	}
	
	//存储到本地
	class func saveToLocal(person:PersonM){
		if UserData.getMyUser() == nil {
			return
		}
		let group = PersonGroupData.getLocalUnGroupGroupM()
		let mKey = UserData.getMyUser()!.loginName
		let tempPerson:AnyObject? = PersonM.searchSingleWithWhere("id=\(person.id) and mKey = \(mKey)", orderBy: "")
		person.mKey = UserData.getMyUser()!.loginName
		if tempPerson == nil {
			person.saveToDB()
		}else{
			person.updateToDB()
		}
		let groupR = PersonGroupRelateM.searchSingleWithWhere("groupId=\(group.id) and personId = \(person.id) and mKey = \(mKey)", orderBy: "") as? PersonGroupRelateM
		//查找是否有未分组
		if groupR == nil {
			let groupR_ = PersonGroupRelateM()
			groupR_.groupId = group.id
			groupR_.personId = person.id
			groupR_.mKey = UserData.getMyUser()!.loginName
			groupR_.saveToDB()
		}
		
	}

}
