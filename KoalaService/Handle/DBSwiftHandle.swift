//
//  DBSwiftHandle.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/17.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class DBSwiftHandle: BaseHandle {
	//注册表
	class func registerTables(){
		DynamicMessageM.getUsingLKDBHelper().getTableCreatedWithTableName(DynamicMessageM.getTableName())
		PersonM.getUsingLKDBHelper().getTableCreatedWithTableName(PersonM.getTableName())
		
		PersonGroupM.getUsingLKDBHelper().getTableCreatedWithTableName(PersonGroupM.getTableName())
		PersonGroupRelateM.getUsingLKDBHelper().getTableCreatedWithTableName(PersonGroupRelateM.getTableName())
		
		

	}
}
