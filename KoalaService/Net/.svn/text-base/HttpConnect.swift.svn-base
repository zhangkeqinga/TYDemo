//
//  HttpConnect.swift
//  MyFramework_Swift
//
//  Created by carlosk on 15/2/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class HttpConnect: COHttpConnect {
	
	override  class func connect(model:COThreadM)->(String?,NSError?,Int){
		//		var url = NSURL(string: model)
		ASIHTTPRequest.setDefaultTimeOutSeconds(10)
		
		log("connect")
		let  httpEntyModel = model.httpEntyModel

		var request = ASIHTTPRequest(URL: NSURL(string: httpEntyModel.url)!)

		switch httpEntyModel.method{
		case .Get:
			request.requestMethod = "Get"
			if httpEntyModel.param.count > 0{
				var url = httpEntyModel.url+"?"
				for var i = 0;i < httpEntyModel.param.count;i++ {
					let keys = Array(httpEntyModel.param.keys)
					let key = keys[i]
					let value: AnyObject = httpEntyModel.param[key]!
					url += "\(key)=\(value)"
					if i < httpEntyModel.param.count-1 {
						url += "&"
					}
				}
				request.url = NSURL(string: url)!
			}
		case .Post:
			
			if httpEntyModel.uploadPath != nil {
				let formRequest = ASIFormDataRequest(URL: NSURL(string: httpEntyModel.url)!)
				if httpEntyModel.param.count > 0 {
					for (key,value) in httpEntyModel.param {
						formRequest.setPostValue(value as! NSObjectProtocol, forKey: key)
					}
				}
				formRequest.requestMethod  = "Post"
				//				formRequest.setFile(httpEntyModel.uploadPath!, forKey: "file")
				formRequest.setFile(httpEntyModel.uploadPath!, withFileName: httpEntyModel.fileName!, andContentType: httpEntyModel.contentType!, forKey: "file")
				request = formRequest
			}else {
				request.requestMethod = "Post"
				if httpEntyModel.param.count > 0 {
					log("post的形参是:\(httpEntyModel.param)")
					let jsonData = try! NSJSONSerialization.dataWithJSONObject(httpEntyModel.param, options: NSJSONWritingOptions.PrettyPrinted)
					request.appendPostData(jsonData)
					if Config.IsPrintHttpLog {
						let jsonContent = NSString(data: jsonData, encoding: NSUTF8StringEncoding)!
						log("\(jsonContent)")
					}
				}
			}
		case .Put:
			request.requestMethod = "Put"
//		default:
//			break
		}
		request.requestHeaders = ["Content-Type":"application/json"]
		if Config.IsPrintHttpLog {
			log("http url = \(request.url),method=\(request.requestMethod),header = \(request.requestHeaders)")
//			log("request body = \(httpEntyModel.param)")
		}
		request.startSynchronous()
		//		        NSString* content = [[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding];
		log("\(request.responseStatusCode)")
		if request.responseStatusCode != 200 {
			log("error=\(request.error)")
			return (nil,request.error,Int(request.responseStatusCode))
		}
		var content :String
		if let responseData = request.responseData() {
			content = String.converUTF8String(responseData)!
		}else{
			content = ""
		}
		if Config.IsPrintHttpLog {
			log("error=\(request.error),responseStatusCode=\(request.responseStatusCode)")
		}
		//		String(request.responseData(),request.responseEncoding)
		return (content,request.error,Int(request.responseStatusCode))	}
}
