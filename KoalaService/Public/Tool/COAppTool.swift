//
//  COAppTool.swift
//  COXbry
//
//  Created by carlosk on 15/1/19.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit


public class COAppTool  {
	
	public class func getLauchImage()->UIImage?{

        var suffix = ""
        
			suffix = UIScreen.mainScreen().bounds.size.height >= 568.0 ? "-568h@2x" : "@2x"

		let lauchImageName = "LaunchImage-700\(suffix).png"
        
		return UIImage(named: lauchImageName)
        

	}
	//app的名称
	public class func appName() -> String{
		let info = NSBundle.mainBundle().infoDictionary!
		var value: AnyObject? = info["CFBundleDisplayName"]
		if let value1: AnyObject = value {
			return value1 as! String
		}
		value  = info["CFBundleName"]
		return value as! String
	}
	//获取appicon的名称
	public class func getAppIconName()->String{
		let primaryIconsDictionary = NSBundle.mainBundle().infoDictionary?["CFBundleIcons"]?["CFBundlePrimaryIcon"] as? NSDictionary
		let iconFiles = primaryIconsDictionary!["CFBundleIconFiles"] as! NSArray
		let lastIcon = iconFiles.lastObject as! NSString
		return lastIcon as String
	}
	//版本名称
	public class func appVersionName() -> String{
		let info = NSBundle.mainBundle().infoDictionary!
		let value :AnyObject = info["CFBundleShortVersionString"]!
		return value as! String
	}
	//版本号
	public class func appVersionCode() -> String{
		let info = NSBundle.mainBundle().infoDictionary!
		let value :AnyObject = info["CFBundleVersion"]!
		return value as! String
	}
    //拨打电话
	public class func callPhone(var phoneName:String){
		phoneName = phoneName.stringByReplacingOccurrencesOfString("-", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
		phoneName = phoneName.stringByReplacingOccurrencesOfString(" ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
		let phoneUrl = NSURL(string: "tel://\(phoneName)")
		UIApplication.sharedApplication().openURL(phoneUrl!)
	}

}