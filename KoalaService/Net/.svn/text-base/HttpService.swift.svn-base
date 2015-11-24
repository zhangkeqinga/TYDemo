//
//  HttpService.swift
//  MyFramework_Swift
//
//  Created by carlosk on 15/2/8.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit
private var isShowGoToLoginAlert = false//是否显示去登陆界面的弹出框
class HttpService: BaseM {
	
	//只有第一次的时候launch
	private class func chechThreadMsg(threadM:ThreadM){
		currentVC!.checkThreadMsg(threadM)
	}
	class func launch(){
		CONet.setHttpOperationTypes([UserHO.self,AlarmHO.self,DeployHO.self,QueryHO.self,DemoHO.self,SecurityHO.self,CommentHO.self,KnowledgeHO.self,TopicHO.self,PersonHO.self])
		CONet.setHttpConnectType(HttpConnect.self, coHttpConnectBlock: nil)
		CONet.setHttpFillThreadMWithReturnContentBlock { (content, error, threadM,responseStatusCode) -> Bool in
			let mThreadM = threadM as! ThreadM
			//做简单的处理
			threadM.receiveContent = threadM.receiveContent ?? ""
			if error != nil || content == nil || content!.jsonContentParseDict() == nil{
				threadM.receiveIsSuccess = false
				threadM.receiveErrorMsg = self.getErrorMsgWithResponseCode(responseStatusCode)
				if mThreadM.autoShowErrorMsg{
					//自动显示错误
					let mainQueue = dispatch_get_main_queue()
					dispatch_async(mainQueue, { () -> Void in
						if responseStatusCode != 0 {
							currentVC!.hideProgressV()
							self.chechThreadMsg(mThreadM)
						}
					})
				}
				return true
			}
			var resultDict = content!.jsonContentParseDict()
			if Config.IsPrintHttpLog {
				log("content=\(content!)")
			}
			//是否是对的
			threadM.receiveIsSuccess = resultDict!["error"] == nil
			var errorCode = -1
			if !threadM.receiveIsSuccess {
				//如果出错如何处理
				let errorDict: AnyObject = resultDict!["error"]!
				threadM.receiveErrorMsg = errorDict["message"] as! String
				errorCode = errorDict["code"] as! Int
			}else{
				//获取数据的字段
				threadM.receiveResultDict = resultDict!["result"] as? [String:AnyObject]
			}
			threadM.receiveContent = content
			//只有返回为true,才继续下去
			//如果出错,并且code是1,则不继续
			
			if errorCode  == 1 && !mThreadM.operationAllErrorMsg{
				//说明是登录出错
				if isShowGoToLoginAlert {
					return false
				}
				isShowGoToLoginAlert = true
				
				self.showGotoLoginAlert()
				return false
			} else if mThreadM.autoShowErrorMsg && !threadM.receiveIsSuccess {
				//自动显示错误
				let mainQueue = dispatch_get_main_queue();
				//处理回调
				dispatch_async(mainQueue, { () -> Void in
					currentVC!.hideProgressV()
					self.chechThreadMsg(mThreadM)
				})
				return false
			}
			return true
			
		}
	}
	class func showGotoLoginAlert(){
		//在主线程中处理
		let mainQueue = dispatch_get_main_queue();
		//处理回调
		dispatch_async(mainQueue, {() -> Void in
			let vc_ = currentVC as! BaseVC
			vc_.alert("您的账户已经注销,您已被迫下线", confrimBtnTitle: "退出", handler: { () -> Void in
				vc_.logout()
				isShowGoToLoginAlert = false
			})
		})
		
	}
	
	//是否登录超时
	class func isErrorTimeOut(receiveErrorCode:Int)->Bool{
		return receiveErrorCode == 1
	}
	
	// 根据错误值返回提示信息
	private class func getErrorMsgWithResponseCode(responseCode:Int) -> String{
		var result = ""
		log("responseCode=\(responseCode)")
		switch responseCode {
		case 0:
			result = "请检查您的网络"
		case 404:
			result = "服务器无响应"
		default :
			result = "未知错误"
		}
		
		
		return result
	}
}
