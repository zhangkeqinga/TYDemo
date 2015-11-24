//
//  PageThreadM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/5.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//  处理分页信息

import UIKit

class PageThreadM: ThreadM {
    
	var page:Int = 1
	var pageCount:Int = 10
	var currentPage = 0
	var myPageReceiverBackBlock:((COThreadM) -> Void)?
	override init(apiIF: APIEnum) {
		super.init(apiIF: apiIF)
	}
	override func setReceiveToBackgourBlock(block: ((COThreadM) -> Void)) {
		self.myPageReceiverBackBlock = {
			thread in
			//先处理分页的数据
			BaseHO.operationReceivePageData(self)
            
			//如果处理其他的
			block(thread)
		}
		self.receiveToBackgourdBlock = myPageReceiverBackBlock
	}
}
