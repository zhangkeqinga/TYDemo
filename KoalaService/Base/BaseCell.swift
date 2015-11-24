//
//  BaseCell.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/22.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//  cell基类2 开始有耦合

import UIKit

class BaseCell: COBaseCell {

	override func createViews() {
		super.createViews()
        
//		resetAllSetting()   //暂时注解掉
		COFontAndColorToTagHandle.setAllFontAndColorWithTag(self.contentView)
	}
}
