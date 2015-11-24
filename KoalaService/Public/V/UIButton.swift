//
//  UIButton.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/3/3.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

extension UIButton{
//填充成普通的按钮
	func fillCommonBtn(){

        setBgImage(UIColor.queryCategoryItemNormal().transformImage(), pressImage: UIColor.queryCategoryItemPress().transformImage())
		
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
		setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
	}
    
	//设置url
	func setUrl(var url:String){
        
		url = APIEnum.getBBaseUrl() + url
        
		setUrl(url, placeHoldImageName: nil)
        
	}
    
	// 设置url和占位图
	func setUrl(url: String, placeHoldImageName: String?) {
		let url_ = NSURL(string: url)
		if placeHoldImageName == nil {
			sd_setBackgroundImageWithURL(url_, forState: UIControlState.Normal)
			return
		}
	sd_setBackgroundImageWithURL(url_, forState: UIControlState.Normal, placeholderImage: UIImage(named: placeHoldImageName!))
	}
	
}
