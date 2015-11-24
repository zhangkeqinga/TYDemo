//
//  AlarmData.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/20.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

private var alarmTypes = [AlarmTypeM]()
private let alarmCodes = ["CA100","CA200","CA300","CA400","TEST"]
private let alarmTypeTitles = ["火警","劫警","盗警","异常撤防","测试"]
//[{"alarmCode":"CA100","alarmType":"火警"},{"alarmCode":"CA200","alarmType":"劫警"},{"alarmCode":"CA300","alarmType":"盗警"},{"alarmCode":"CA400","alarmType":"异常撤防"}]}}
private  var codeToImage:[String:UIImage]?
private  var codeToPressImage:[String:UIImage]?

class AlarmData: BaseData {
	class func getAlarmCodes()->[String]{
		return alarmCodes
	}
	//获取分类的数据
	class func getAlarmTypes()->[AlarmTypeM] {
		if alarmTypes.count > 0 {
			return alarmTypes
		}
		//初始化
		//		let keys = ["CA001","CA002","CA003",""]
		//		,"测试","其他"
		
//		let itemBgCs = alarmTypeItemBgImages()
//		let itemPressBgCs = alarmTypeItemPressBgImages()
		
		for index in 0...alarmTypeTitles.count - 1 {
			let alarmCode = alarmCodes[index]
			//看如果是中行的则用图片
			let alarmTemp = AlarmTypeM(alarmCode: alarmCode, alarmType: alarmTypeTitles[index], itemBGImage: getAlarmTypeImage(alarmCode)!, itemPressBGImage: getAlarmTypePressImage(alarmCode)!)
			alarmTypes.append(alarmTemp)
		}
		return alarmTypes
	}
	
	//获取类型的标题
	class func getAlarmTypeTitle(code:String) -> String{
		var result = ""
		//			private let alarmCodes = ["CA100","CA200","CA300","CA400","TEST"]
		//			private let alarmTypeTitles = ["火警","盗警","劫警","异常撤防","测试"]
		if code.characters.elementsEqual("CA100".characters){
			result = "火警"
		}else if code.characters.elementsEqual("CA300".characters){
			result = "盗警"
		}else if code.characters.elementsEqual("CA200".characters){
			result = "劫警"
		}else if code.characters.elementsEqual("CA400".characters){
			result = "异常撤防"
		}else if code.characters.elementsEqual("TEST".characters){
			result = "测试"
		}
		return result
	}
	
	
	//报警首页上的cell的icon
	class func getAlarmMainTypeImage(code:String) -> UIImage?{
		
		let imageNamewithCode = ["CA100":"small_fire_alarm","CA300":"small_steal_alarm","CA200":"small_rob_alarm","CA400":"small_illegal_undeploy","TEST":"small_test_alarm"]
		let imageName = imageNamewithCode[code]
		let image = UIImage(named: imageName ?? "small_fire_alarm")
		return image
	}
	
	//根据类型编号获取背景色
	
	class func getAlarmTypeImage(code:String) -> UIImage?{
		if codeToImage == nil {
			codeToImage = [String:UIImage]()
			var imags = alarmTypeItemBgImages()
//			if Config.IsChinaBank {
//				//查找颜色
//				imags = chinaBankAlarmTypeItemBgImages()
//			}
			for index in 0...imags.count-1 {
				let image = imags[index]
				codeToImage![alarmCodes[index]] = image
			}
		}
		return codeToImage![code]
	}
	
	class func getAlarmTypePressImage(code:String) -> UIImage?{
		
		if codeToPressImage == nil {
			codeToPressImage = [String:UIImage]()
			var imags = alarmTypeItemPressBgImages()
//			if Config.IsChinaBank {
//				//查找颜色
//				imags = chinaBankAlarmTypeItemPressBgImages()
//			}
			for index in 0...imags.count-1 {
				let image = imags[index]
				codeToPressImage![alarmCodes[index]] = image
			}
		}
		return codeToPressImage![code]

//		
//		
//		if codeToPressImageName == nil {
//			codeToPressImageName = [String:String]()
//			let bgImageNames = alarmTypeItemPressBgImageNames()
//			for index in 0...bgImageNames.count-1 {
//				codeToPressImageName![alarmCodes[index]] = bgImageNames[index]
//			}
//		}
//		return codeToPressImageName![code]
	}
	
	//填充联系人的拼音属性,返回2个内容,一个是大写字母的数组,第二个是每个大写字母对应的联系人列表
	class func fillAlarmContractWithPinyin(var list:[AlarmContactM])->([String],[[AlarmContactM]])
	{
		//先排序
		list.sortInPlace {
			(a1, a2) -> Bool in
			let pinyin1 = U.changeChineseToPinyin(a1.contactName)
			let pinyin2 = U.changeChineseToPinyin(a2.contactName)
			
			if pinyin1 == nil || (pinyin1!).characters.count == 0 {
				return true
			}
			if pinyin2 == nil || (pinyin2!).characters.count == 0 {
				return true
			}
			let capitalInt1 = (pinyin1! as NSString).characterAtIndex(0)
			let capitalInt2 = (pinyin2! as NSString).characterAtIndex(0)
			return capitalInt2 > capitalInt1
		}
		var capitals = [String:[AlarmContactM]]()
		
		//把所有的名称获取拼音,并且记录在数组中
		for itemContactM in list {
			//获取拼音
			let pinyin = U.changeChineseToPinyin(itemContactM.contactName)
			if pinyin == nil || (pinyin!).characters.count == 0 {
				continue
			}
			//获取首字母
			let pinyin_ = pinyin! as NSString
			let capital = pinyin_.substringToIndex(1)
			if var myContacts = capitals[capital] {
				//如果首字母在capitals列表里,则取出数组,赋值
				myContacts.append(itemContactM)
				capitals[capital] = myContacts
			}else{
				//否则创建数组,赋值
				var tempList = [AlarmContactM]()
				tempList.append(itemContactM)
				capitals[capital] = tempList
			}
		}
//		let resultList = [[AlarmContactM]]()
		return (Array(capitals.keys),Array(capitals.values))
	}
	
	
	
	//分类的按钮背景色
	class func alarmTypeItemBgImages() -> [UIImage] {
		//		,"#3ac174"
		let imageNames = ["alarm_fire_icon","alarm_rob_icon","alarm_steal_icon","alarm_illegal_undeploy_icon","alarm_test_icon"]
		var images = [UIImage]()
		for imageName in imageNames {
			images.append(UIImage(named: imageName)!)
		}
		return images
	}
	
	class func alarmTypeItemPressBgImages() -> [UIImage] {
		//		,"#33b86c"
		//let imageNames = ["alarm_fire_d","alarm_rob_d","alarm_steal_d","alarm_illegal_undeploy_d","alarm_test_d"]
		let imageNames = ["alarm_fire_icon","alarm_rob_icon","alarm_steal_icon","alarm_illegal_undeploy_icon","alarm_test_icon"]
		var images = [UIImage]()
		for imageName in imageNames {
			images.append(UIImage(named: imageName)!)
		}
		return images

	}
	
	
	//分类的按钮背景色
	class func chinaBankAlarmTypeItemBgImages() -> [UIImage] {
		//		,"#3ac174"
		let imageNames = ["alarm_fire","alarm_rob","alarm_steal","alarm_illegal_undeploy","alarm_test"]
		var images = [UIImage]()
		for imageName in imageNames {
			images.append(UIImage(named: imageName)!)
		}
		return images
	}
	
	class func chinaBankAlarmTypeItemPressBgImages() -> [UIImage] {
		//		,"#33b86c"
		let imageNames = ["alarm_fire_d","alarm_rob_d","alarm_steal_d","alarm_illegal_undeploy_d","alarm_test_d"]
//		let imageNames = ["alarm_fire_icon","alarm_rob_icon","alarm_steal_icon","alarm_illegal_undeploy_icon","alarm_test_icon"]
		var images = [UIImage]()
		for imageName in imageNames {
			images.append(UIImage(named: imageName)!)
		}
		return images
		
	}
}
