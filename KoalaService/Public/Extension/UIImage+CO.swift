//
//  UIImage+CO.swift
//  iFU_Customer
//
//  Created by carlosk on 15/8/19.
//  Copyright (c) 2015年 carlos. All rights reserved.
//

import UIKit


public extension UIImage {
	
	public class func createWithName(imageName:String)->UIImage?{
		let image = UIImage(named: imageName)
		return image
	}
    
    
	func cropSubImage(rect:CGRect)->UIImage?{
		let subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect)
		let smallBounds = CGRectMake(0, 0, CGFloat(CGImageGetWidth(subImageRef)), CGFloat(CGImageGetHeight(subImageRef)))
		
		UIGraphicsBeginImageContext(smallBounds.size)
		let context = UIGraphicsGetCurrentContext()
		CGContextDrawImage(context, smallBounds, subImageRef)
		//		UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
		//		UIGraphicsEndImageContext();
		let smallImage = UIImage(CGImage: subImageRef!)
		UIGraphicsEndImageContext()
		return smallImage
	}
	//裁剪
//	-(UIImage*)cropSubImage:(CGRect)rect{
//		
//		CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
//		CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
//		
//		UIGraphicsBeginImageContext(smallBounds.size);
//		CGContextRef context = UIGraphicsGetCurrentContext();
//		CGContextDrawImage(context, smallBounds, subImageRef);
//		UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
//		UIGraphicsEndImageContext();
//		
//		return smallImage;
//		
//	}
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
