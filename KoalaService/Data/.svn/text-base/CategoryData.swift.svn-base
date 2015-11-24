//
//  CategoryData.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/7.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class CategoryData: BaseData {

	
	//获取话题的分类列表
	class func getTopicCateogrys()->[CategoryM]{
		var resutls = [CategoryM]()
		var categoryM = CategoryM()
		categoryM.name = "官方"
		categoryM.topicType = TopicM.CategoryEnum.Official
		resutls.append(categoryM)
		
		categoryM = CategoryM()
		categoryM.name = "自由"
		categoryM.topicType = TopicM.CategoryEnum.Freee
		resutls.append(categoryM)
		
		categoryM = CategoryM()
		categoryM.name = "@我"
		categoryM.topicType = TopicM.CategoryEnum.At
		resutls.append(categoryM)
		
		return resutls
	}
	
}
