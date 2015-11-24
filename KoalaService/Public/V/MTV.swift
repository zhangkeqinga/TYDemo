//
//  MTV.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/8/27.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//  上拉下刷新的tableView

import UIKit

class MTV: UITableView {
	
	var threadM:PageThreadM?
    
	var data = [AnyObject]()//数据
	var reloadThreadDataBlock:((COThreadM)->Void)? = nil//重新加载数据的block
	var footEmptyV:UIView!
	
    //没有更多数据了
	func createViews(){
		setBgImage()
		let footV = UILabel(frame: CGRectMake(0, 0, CV.BaseWidth, 50))
		footV.backgroundColor = UIColor.clearColor()
		footV.text = "没有更多的数据了"
		footV.font = UIFont.systemFontOfSize(14)
		footV.textAlignment = NSTextAlignment.Center
		footV.textColor = UIColor.blackColor()
		footEmptyV = footV
		self.tableFooterView = footEmptyV
	}
    
	//还远成普通的样式
	func resetWithCommonType(){
		backgroundView = nil
	}
	override func reloadData(data: [AnyObject]) {
		super.reloadData(data)
//		if !isHasEmptyV{
//			return
//		}
//		backgroundView?.hidden = data.count != 0
		
	}
    
	//使用上拉下拉的时候需要调用这个方法
	//一个是实现一个block用来创建threadm
	//所需要的cell 类型
	//tableView,会自动从view的subviews里查找
    
	func initWithAll(threadM:PageThreadM,cellType:BaseCell.Type){
        
		self.threadM = threadM
		fillData(cellType, data: [], isInternalCell: false)
		//添加事件
		addPullToRefreshWithActionHandler { () -> Void in
			//上拉
			self.doGetDataWithNet()
		}
        
		pullToRefreshView.setTitle("释放立即刷新...", forState: UInt(SVPullToRefreshStateAll))
		//		pullToRefreshView.titleLabel.textColor = UIColor.c1()
		pullToRefreshView.setTitle("下拉刷新...", forState: UInt(SVPullToRefreshStateStopped))
		pullToRefreshView.arrowColor = UIColor.c1()
		pullToRefreshView.textColor = UIColor.c1()
		pullToRefreshView.setTitle("释放立即刷新...", forState: UInt(SVPullToRefreshStateTriggered))
		pullToRefreshView.setTitle("正在刷新...", forState: UInt(SVPullToRefreshStateLoading))
		
        addInfiniteScrollingWithActionHandler { () -> Void in
			//下拉
			self.doGetDataWithNet(true)
		}
		showsInfiniteScrolling = false
	}
	
	func initWithAllWithAPIEnum(apiEnum:APIEnum,cellType:BaseCell.Type){
		let pageThreadm = PageThreadM(apiIF: apiEnum)
		initWithAll(pageThreadm, cellType: cellType)
	}
    
	//请求网络
	func doGetDataWithNet( isMore:Bool = false){
		if threadM == nil {
			return
		}
		let tm = threadM!
		tm.page = isMore ? (tm.currentPage + 1) : 1//pageIndex
		//		tm.intValue2 = 20//pageSize
		tm.arrayValue = nil
		tm.autoShowProgressV = false
		tm.autoShowErrorMsg = false
		tm.postMe { (tm_) -> Void in
			CU.delay(0.3, task: { () -> () in
				self.pullToRefreshView.stopAnimating()
				self.infiniteScrollingView.stopAnimating()
			})
			
			if !tm_.receiveIsSuccess || tm_.arrayValue  == nil || tm_.arrayValue!.count == 0 {
				if HttpService.isErrorTimeOut(tm_.receiveErrorCode){
					HttpService.showGotoLoginAlert()
				}else{
					currentVC!.checkThreadMsg(tm_)
				}
				self.clearFootV()
				self.showsInfiniteScrolling = false
				self.reloadData([])
				self.threadM!.currentPage = 0
				return
			}
			if self.reloadThreadDataBlock != nil {
				self.reloadThreadDataBlock!(tm_)
				return
			}
			if !isMore {
				self.data = []
			}
			self.data = self.data + tm_.arrayValue!
			//			let totalCount = tm_.intValue3//总的数目放在int3里
			self.reloadData(self.data)
			self.showsInfiniteScrolling = self.threadM!.pageCount == tm_.arrayValue!.count
			if self.showsInfiniteScrolling {
				self.threadM!.currentPage = tm.page
			}
			self.tableFooterView = self.showsInfiniteScrolling ? UIView() : self.footEmptyV
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		createViews()
		resetAllSetting()
		autoresizesSubviews = false
	}
	
}

