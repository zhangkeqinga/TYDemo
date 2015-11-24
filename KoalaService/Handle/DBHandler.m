//
//  DBHandler.m
//  TYCloudAlarm
//
//  Created by carlosk on 15/3/7.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

#import "DBHandler.h"


@implementation DBHandler

//删除一些数据
+(void)deleteWithClass:(Class )mClass withWhere:(NSString *)content withHelper:(LKDBHelper *)helper{
	[helper deleteWithClass:mClass where:content];
}

+(NSMutableArray *)searchWithSQL:(NSString *)sql WithClass:(Class )mClass withHelper:(LKDBHelper *)helper{
	return [helper searchWithSQL:sql toClass:mClass];
}
@end
