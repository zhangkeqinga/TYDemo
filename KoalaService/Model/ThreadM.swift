//
//  ThreadM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/16.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class ThreadM: COThreadM {
    
	var operationAllErrorMsg = false//是否需要处理错误信息
	
    let apiIF_:APIEnum
	init(apiIF: APIEnum) {
		self.apiIF_ = apiIF
		super.init(apiIF: apiIF.getAPIM())
	}
    
	//发送一个不需要处理的threadMessage
	class func post(apiIF:APIEnum,receiveUIBlock:((COThreadM)->Void)? = nil,isHide:Bool){
		let tm = ThreadM(apiIF: apiIF)
		if(isHide){
			tm.autoShowErrorMsg = false
			tm.autoShowProgressV = false
		}
		COHttpService.post(tm, receiveUIBlock:receiveUIBlock)
	}
}
