//
//  BaseVC.swift
//  COXbry
//
//  Created by carlosk on 15/1/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit
//import CU

class BaseVC: BaseCommontVC {
	
	var onClickNavLeftBlock:(()->Void)?
	var mLeftNavBtn:UIBarButtonItem?
	var mRightNavBtns:[UIBarButtonItem]?
	
	override func viewDidLoad() {
		//对使用autolayout设置toplayout的所有继承ScrollView的view都可能有这个bug
		setNavBarSetting()
		super.viewDidLoad()
		let bgColor = UIColor.vcColor()
		view.backgroundColor = bgColor
		automaticallyAdjustsScrollViewInsets = false
		COFontAndColorToTagHandle.setAllFontAndColorWithTag(self.view)
	    
    }
    
	func setBgImage(){
		let bgImage = Config.IsChinaBank ? "bg_china" : "koala_bg"
		let imageV = UIImageView(image: UIImage(named:  bgImage))
		imageV.frame = CGRectMake(0, CV.BaseNavStatusHeight, CV.BaseWidth, CV.BaseHeightNoStatusNoNav)
		view.insertSubview(imageV, atIndex: 0)
	}
	
	
	func createRightNavBtnWithBgColor(title:String,funcName:Selector){
		let rightBtn = UIButton(frame: CGRectMake(0, 7, 60, 30))
		rightBtn.setTitle(title)
		rightBtn.backgroundColor = UIColor.navBGColor()
		rightBtn.addTarget(self, action:funcName, forControlEvents: UIControlEvents.TouchUpInside)
		
		let rightItem = UIBarButtonItem(customView: rightBtn)
		self.mRightNavBtns = [rightItem]
		navigationItem.rightBarButtonItems = self.mRightNavBtns
	}
	
    
    func createRightNavBtn(imageNames:[String],funcName:Selector,sizeWidth:CGFloat = 35){
		let rightBtn = UIButton(frame: CGRectMake(0, 0, sizeWidth, sizeWidth))
		rightBtn.setTitle("")
		rightBtn.backgroundColor = UIColor.clearColor()
		rightBtn.addTarget(self, action:funcName, forControlEvents: UIControlEvents.TouchUpInside)
		
		rightBtn.setBgImageName(imageNames[0], pressImageName: imageNames[1])
		
		let rightItem = UIBarButtonItem(customView: rightBtn)
		self.mRightNavBtns = [rightItem]
		navigationItem.rightBarButtonItems = self.mRightNavBtns
	}
    
	//添加多个
	func createRightNavBtns(imageNamess:[[String]],funcNames:[Selector],sizeWidth:CGFloat = 35)->[UIButton]{
		
		var itemBtns :[UIBarButtonItem] = []
		var btns:[UIButton] = []
		for (index,imageNames) in imageNamess.enumerate() {
			let funcName = funcNames[index]
			let rightBtn = UIButton(frame: CGRectMake(0, 0, sizeWidth, sizeWidth))
			rightBtn.setTitle("")
			rightBtn.backgroundColor = UIColor.clearColor()
			rightBtn.addTarget(self, action:funcName, forControlEvents: UIControlEvents.TouchUpInside)
			
			rightBtn.setBgImageName(imageNames[0], pressImageName: imageNames[1])
			btns.append(rightBtn)
			let rightItem = UIBarButtonItem(customView: rightBtn)
			itemBtns.append(rightItem)
		}
		self.mRightNavBtns = itemBtns
		navigationItem.rightBarButtonItems = self.mRightNavBtns
		return btns
	}
	
	func createRightNavBtns(imageNamess:[[String]],funcNames:[Selector],sizeWidths:[CGFloat] )->[UIButton]{
		
		var itemBtns :[UIBarButtonItem] = []
		var btns:[UIButton] = []
		for (index,imageNames) in imageNamess.enumerate() {
			let funcName = funcNames[index]
			let rightBtn = UIButton(frame: CGRectMake(0, 0, sizeWidths[index], sizeWidths[index]))
			rightBtn.setTitle("")
			rightBtn.backgroundColor = UIColor.clearColor()
			rightBtn.addTarget(self, action:funcName, forControlEvents: UIControlEvents.TouchUpInside)
			
			rightBtn.setBgImageName(imageNames[0], pressImageName: imageNames[1])
			btns.append(rightBtn)
			let rightItem = UIBarButtonItem(customView: rightBtn)
			itemBtns.append(rightItem)
		}
		self.mRightNavBtns = itemBtns
		navigationItem.rightBarButtonItems = self.mRightNavBtns
		return btns
	}

	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
	}
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		super.touchesBegan(touches, withEvent: event)
		view.endEditing(true)
	}
    
	//设置导航栏,只有第一次才需要用
	func setNavBarSetting(){
		if navigationController == nil {
			return
		}
		navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
		navigationController?.navigationBar.backgroundColor = UIColor.whiteColor()
		navigationController?.navigationBar.tintColor = UIColor.whiteColor()
		let dict = [NSForegroundColorAttributeName: UIColor.grayColor()]
		navigationController?.navigationBar.titleTextAttributes = dict
		navigationController?.navigationBar.translucent = true
		setLeftNavBtn("通用_arrow_normal",pressImageName:"通用_arrow_press")
	}
    
	//设置左边的按钮
	func setLeftNavBtn(imageName:String,pressImageName:String,block:(()->Void)? = nil){
		let leftBtn = UIButton(frame: CGRectMake(0, 0, 45, 44))
		leftBtn.setImage(UIImage(named: imageName)!, pressImage: UIImage(named: pressImageName)!)
		leftBtn.setTitle("")
		leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 15)
		leftBtn.backgroundColor = UIColor.clearColor()
		leftBtn.addTarget(self, action: "onClickNavLeftItem", forControlEvents: UIControlEvents.TouchUpInside)
		let backItem = UIBarButtonItem(customView: leftBtn)
		navigationItem.leftBarButtonItem = backItem
		mLeftNavBtn = backItem
		if navigationController?.viewControllers.count ?? 0 == 1 {
			navigationItem.leftBarButtonItem = nil
			mLeftNavBtn = nil
		}
		if let block1 = block {
			self.onClickNavLeftBlock = block1
		}
		//设置右边的按钮
		setNavRightBtn("", imageName: nil, block: nil)
	}
	
	func onClickNavLeftItem(){
		if let block = onClickNavLeftBlock {
			block()
			return
		}
		self.pop()
	}
	
	
	//	#pragma mark 风火轮
	
	// MARK: 风火轮
	override func showProgressV(){
		progress = MBProgressHUD.showHUDAddedTo(view, animated: true)
		progress!.hide(true, afterDelay: 10)
	}
	var progress:MBProgressHUD?
	func showProgressV(afterDelay:NSTimeInterval){
		progress = MBProgressHUD.showHUDAddedTo(view, animated: true)
		progress!.hide(true, afterDelay: afterDelay)
	}
	override func hideProgressV(){
//		MBProgressHUD.hideAllHUDsForView(view, animated: true)
		if progress != nil {
			progress!.hide(true)
		}
	}
    
	override func checkThreadMsg(threadMsg:COThreadM) -> Bool{
		if threadMsg.receiveIsSuccess {
			return true
		}
		showToast(threadMsg.receiveErrorMsg)
		return false
	}
    
    
	var toast:MBProgressHUD?
	//显示土司
	func showToast(msg:String,block:(()->Void)? = nil){
		let toast  = MBProgressHUD.showHUDAddedTo(view, animated: true)
		toast.mode = .Text
		toast.labelText = msg
		toast!.hide(true, afterDelay: 2)
		if block != nil {
			CU.delay(2, task: { () -> () in
				block?()
			})
		}
	}
}
