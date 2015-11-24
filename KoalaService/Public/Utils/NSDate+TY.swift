//
//  NSDate+TY.swift
//  TYCloudAlarm
//
//  Created by carlosk on 15/3/1.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//  重构文件结构

import UIKit

extension NSDate{
	//获取今天中午
	class func getTodayNoon()->NSDate{
        
        //NSGregorianCalendar－ios8被弃用－再检查  NSCalendarIdentifierGregorian
		let myCal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)

        //NSMonthCalendarUnit－ios8被弃用－再检查  .Month
		let units: NSCalendarUnit = [NSCalendarUnit.Day, NSCalendarUnit.Year, NSCalendarUnit.Month]

        let comp = myCal!.components(units, fromDate: NSDate(timeIntervalSinceNow: 0))
		comp.hour = 12
		comp.minute = 0
		comp.second = 0
		let date = myCal!.dateFromComponents(comp)!
		return date

	}
}
