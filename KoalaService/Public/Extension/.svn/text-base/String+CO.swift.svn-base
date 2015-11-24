//
//  NSString+CO.swift
//  COXbry
//
//  Created by carlosk on 15/1/7.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import Foundation

public extension String{
	
	subscript (r: Range<Int>) -> String {
		get {
			let startIndex = self.startIndex.advancedBy(r.startIndex)
			let endIndex = startIndex.advancedBy(r.endIndex - r.startIndex)
			
			return self[Range(start: startIndex, end: endIndex)]
		}
	}
	//把字符串转换成字典
	
	public func jsonContentParseDict()->[String:AnyObject]?{

		let data = self.dataUsingEncoding(NSUTF8StringEncoding)
		if data == nil{
			return nil
		}
		var jsonResult : [String:AnyObject]? = nil
		do{
			try jsonResult = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? [String:AnyObject]
		}catch{
			
		}
		
		return jsonResult
	}
	
	
	// MARK: 正则校验
	//正则
	public func verifyBase(regexStr:String) -> Bool{
		if String.isEmpty(regexStr){
			return false
		}
		let regex = try? NSRegularExpression(pattern: regexStr, options: NSRegularExpressionOptions.CaseInsensitive)
		
		let matches = regex?.matchesInString(self, options: NSMatchingOptions(), range: NSMakeRange(0,self.characters.count))
		return matches?.count>0
	}
	
	//校验手机号码
	
	public func verifyPhone() -> Bool{
		return verifyBase("^1\\d{10}$")
	}
	
	//校验身份证
	public func verifyIdentityCard() -> Bool{
		return verifyBase("\\d{15}|\\d{18}")
	}
	
	//校验email
	public func verifyEmail() -> Bool{
		return verifyBase("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*")
	}
	
	//为空的判断
	static  public func isEmpty(content:String?) -> Bool{
		if content == nil {
			return true
		}
		var content1 = content! as NSString
		content1 = content1.stringByReplacingOccurrencesOfString(" ", withString: "")
		return "".characters.elementsEqual((content1 as String).characters)
	}
	static public func isNotEmpty(content:String?) ->Bool{
		return !isEmpty(content)
	}
	
	
	//转换成中文GBK编码
	//	- (NSString *) converGBKString{
	//	NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding ( kCFStringEncodingGB_18030_2000 );
	//	NSString *content = [[ NSString alloc ] initWithData :self encoding :gbkEncoding];
	//	return content;
	//	}
	//	static public func converGBKString(data:NSData?) -> String?{
	//		if data == nil{
	//			return nil
	//		}
	//
	////		let gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)
	////		let content = String(data:)
	//	}
	//转换成utf8
	public func utf8()->String{
//		return stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) ?? ""
//		URLFragmentAllowedCharacterSet
		assertionFailure("这个还没做")
		return ""
//		stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.controlCharacterSet())
//		return stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.controlCharacterSet()) ?? ""
	}
	//	//转换成UTF8的字符串
	public static func converUTF8String(data:NSData?) -> String?{
		if data == nil{
			return nil
		}
		let content = NSString(data: data!, encoding: NSUTF8StringEncoding)
		return content as String!
	}
	//任何对象转换成字符串
	public static func converAnyObjectToString(o:AnyObject?) ->String{
		if (o == nil || o!.isKindOfClass(NSNull.self)) {
			return ""
		}
		let o1: AnyObject = o!
		return "\(o1)"
	}
}