//
//  KnowledgeM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/15.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class InfoBatchM: BaseM {
	var batchId = 0
	var posTime = ""
	var itemList:[InfoM] = []
	override init(json: NSDictionary) {
		super.init(json: json)
		itemList = []
		if let guardInCharge: AnyObject = json["itemList"] {
			let guiardResultList = guardInCharge as! [NSDictionary]
			for itemDict in guiardResultList {
				let item = InfoM(json: itemDict)
				itemList.append(item)
			}
		}
	}
}
