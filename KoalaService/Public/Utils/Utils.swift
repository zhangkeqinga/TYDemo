//
//  Utils.swift
//  COXbry
//
//  Created by carlosk on 15/1/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import Foundation
//import CU


func log(msg:String){
	//	#if IsHttpTest
	if Config.IsPrintLog{   // IsPrintLog ＝ print  true or false
		print(msg)
	}
	//	#endif
}


private var myChineseToPinyinDisct = [String:String?]()

class U {
//把简体中文叫改成拼音
class func changeChineseToPinyin(content:String) ->String?{
	//		if ([hanziText.text length]) {
	if String.isEmpty(content){
		return nil
	}
	if let result1 = myChineseToPinyinDisct[content] {
	log("从缓存里取的\(content) = \(result1!)")
		return result1
	}
    
	var result = (content as NSString).pinYin()
    
	if result != nil {
		result = (result as NSString).stringByReplacingOccurrencesOfString(" ", withString: "").uppercaseString
		myChineseToPinyinDisct[content] = result!
	}
	log("\(content) = \(result!)")
	return result ?? ""

   
    }

}







