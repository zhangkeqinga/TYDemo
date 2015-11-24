//
//  ThreadM.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/16.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class ThreadM: COThreadM {

	init(apiIF:APIEnum){
		let coAPIIF = apiIF.getAPIM()
		super.init(apiIF: coAPIIF)
		self.httpEntyModel.method = COHttpMethod.Post
		//			{"jsonrpc": "2.0","method": "App_Action_Login","params": {"userName": "{{userName}}","password": "{{pwd}}","encryptType":0},"id": 1}
//		[jsonrpc: 2.0, method: App_Action_Login, param: {
//			encryptType = 0;
//			password = 1234567;
//			userName = 17722223333;
//			}, id: 1]

		self.httpEntyModel.param = ["jsonrpc":"2.0","id":1,"method":apiIF.getActionName()]
	}
}
