//
//  UIView+Util.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/2/23.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//  重构文件结构

import UIKit

public extension UIView {
//设置子的view为分割线,目前默认tag是1000
	func setChildViewToDiver(){
		getSubViewWithTag(1000, block: { (diverV) -> Void in
			diverV.backgroundColor = UIColor.cellDiver()
		})
	}
}
