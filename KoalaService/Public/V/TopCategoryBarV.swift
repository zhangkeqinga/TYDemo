//
//  TopCategoryBarV.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/9/23.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import UIKit

class TopCategoryBarV: BaseV,UIScrollViewDelegate {
	private var titles:[String] = []
	private var btns :[UIButton] = [UIButton]()
		private var redVs :[UIView] = [UIView]()//小红点
	private static let mHeight:CGFloat = 40
	@IBOutlet weak var bgSV: UIScrollView!
	var selectedIndex = 0
	private var mItemWidth:CGFloat  = 0
	private var bottomV = UIView()
	private static let maxSize = 4
	private var selectedBlock:((Int,Bool)->Void)?
	override func createViews() {
		super.createViews()
		self.frame = CGRectMake(0, 0, CV.BaseWidth, TopCategoryBarV.mHeight)
		bottomV.frame = CGRectMake(0, TopCategoryBarV.mHeight - 2, mItemWidth, 2)
		bottomV.backgroundColor = UIColor.redColor()
	}
	
	//填充所有的数据
	func fillAllTitles(titles:[String],block:((Int,Bool)->Void)){
		self.titles = titles
		self.selectedBlock = block
		bgSV.removeAllMyChildView()
		//如果大于4个,则按照4个算.其他的可以滚动.
		let mSize = titles.count > TopCategoryBarV.maxSize ? TopCategoryBarV.maxSize : titles.count
		mItemWidth = CV.BaseWidth /  CGFloat(mSize)
		btns = []
		redVs = []
		bottomV.removeFromSuperview()
		bottomV.setWidth(mItemWidth)
		
		selectedIndex = 0
		let height = TopCategoryBarV.mHeight
		for (index,eachTitle) in titles.enumerate() {
			let i = CGFloat(index)
			let x = i * mItemWidth
			let itemV = UIView(frame: CGRectMake(x, 0, mItemWidth, height))
			//添加背景按钮
			let btn = UIButton(frame: CGRectMake(0, 0, mItemWidth, height))
			btn.backgroundColor = UIColor.clearColor()
			btn.tag = 100 + index
			btn.addOnclickMethod("onClickItemBtn:", target: self)
			btn.setTitle(eachTitle)
			btns.append(btn)
			//小红点
			let redVSize:CGFloat = 7
			let redV = UIView(frame:CGRectMake(btn.width()/2 + redVSize + 13, 10, redVSize, redVSize))
			redV.backgroundColor = UIColor.redColor()
			redV.hidden = true
			redV.cycle()
			redVs.append(redV)
			itemV.addSubview(redV)
			itemV.addSubview(btn)
			bgSV.addSubview(itemV)
		}
		bgSV.addSubview(bottomV)
		fillStatusWithSelectedTitle()
		bgSV.contentSize = CGSizeMake(CGFloat(titles.count) * mItemWidth, height)
		if selectedBlock != nil {
			selectedBlock!(selectedIndex,!redVs[selectedIndex].hidden)
		}
	}

	//填充选中按钮的效果
	private func fillStatusWithSelectedTitle(){
		for (index,btn) in btns.enumerate() {
			let color = index == self.selectedIndex ? UIColor.redColor() : UIColor.blackColor()
			btn.setTitleColor(color, forState: .Normal)
			btn.setTitleColor(color, forState: .Highlighted)
		}
		let x = CGFloat(self.selectedIndex) * mItemWidth
		UIView.animateWithDuration(0.3, animations: { () -> Void in
			self.bottomV.setX(x)
		})
		
		if titles.count <= TopCategoryBarV.maxSize {
			return
		}
		//查找最左边的index
		let offsetX = bgSV.contentOffset.x
		var leftIndex = Int( offsetX / mItemWidth )
		if leftIndex < 0 {
			leftIndex = 0
		}
		var rightIndex = Int((offsetX + bgSV.width()) / mItemWidth - 1)
		if rightIndex < 0 {
			rightIndex = 0
		}
		log("左边\(leftIndex),当前\(selectedIndex),右边\(rightIndex)")

        //如果不是左右,则不动
		if selectedIndex != leftIndex && selectedIndex != rightIndex || selectedIndex >= btns.count - 1 {

            return
		}
		//如果是最左边,则看左边是否还有
		if selectedIndex == leftIndex{
			if leftIndex == 0 {
				return
			}
			let x = (CGFloat(leftIndex) - 1) * mItemWidth
			bgSV.setContentOffset(CGPointMake(x, 0), animated: true)
		}else
			if selectedIndex == rightIndex {
				if rightIndex == self.btns.count {
					return
				}
				let x = (CGFloat(leftIndex) + 1) * mItemWidth
				bgSV.setContentOffset(CGPointMake(x, 0), animated: true)
		}
		
	}
	func onClickItemBtn(sender:UIButton){
		let index = sender.tag - 100
		self.selectedIndex = index
		//查找对应的redV
		let redV = redVs[index]

		if selectedBlock != nil {
			selectedBlock!(selectedIndex,!redV.hidden)
		}
		redV.hidden = true
		fillStatusWithSelectedTitle()
	}
	func showRedVWithIndex(index:Int){
		redVs[index].hidden = false
	}
}
