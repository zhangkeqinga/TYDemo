//
//  CategoryM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/7.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//分类,目前用于知识库

import UIKit

class CategoryM: BaseM {
	var name  = ""
	var id = 0
	var topicType:TopicM.CategoryEnum?//分类也可以用于话题
	enum Category:Int {
		case Security = 1//安保
		case Knowledge = 2//知识库
		case Topic = 3 //话题
	}
	
}
