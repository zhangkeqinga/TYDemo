//
//  SecurityData.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/5.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class InfoData: BaseData {
	//获取安防的url的baseurl
	static func getInfoBaseUrl(url:String)->String {
		//		http://112.64.133.198:8096/appSecurityIndex/
		let mUrl = APIEnum.getBBaseUrl() + url + UserData.getMyUG()
		return mUrl
	}
}
