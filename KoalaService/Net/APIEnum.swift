//
//  APIEnum.swift
//  MyFramework_Swift
//
//  Created by carlosk on 15/2/6.
//  Copyright (c) 2015年 carlosk. All rights reserved.
//

import Foundation

public enum APIEnum :Int{
	//第一个是枚举的key,第二个	是短url,第三个是回调时候的方法名称
	
    //这是考拉报警的
	static let BasePublicBaseUrl = "http://alarm.i-koala.com"
//	static let BaseBaseUrl = "http://192.168.20.96/"
	
    //这是中行的
	static let BaseBaseUrl = "http://112.64.133.198:8097"
//	static let BaseBaseInternalUrl = "http://192.168.2.97/"
	
    //专门用于模拟发布的
	static let BaseDemoUrl = "http://112.64.133.198:8097/tycloud/alarmdemocmd"
		static func getBBaseUrl()->String{
			var baseBUrl = BasePublicBaseUrl
			if Config.IsPublicServer {
				baseBUrl = APIEnum.BasePublicBaseUrl
			}else{
				baseBUrl = APIEnum.BaseBaseUrl
			}
			return baseBUrl
	}

	static func getBaseUrl()->String{
	
		
//		if Config.IsCarlos {
//			baseBUrl = APIEnum.BasePublicBaseUrl
//		}
		return "\(getBBaseUrl())/spidp/cloudalarm/bjcmd"
	}
	static let APIs:[(APIEnum,String,String?)] = [
		(APIEnum.T1,"testjson","testjson"),
		(APIEnum.Login,"App_Action_Login","Login"),
		(APIEnum.AlarmTypeCount,"App_Get_AlarmCount","AlarmTypeCount"),
		(APIEnum.AlarmList,"App_Get_AlarmList","AlarmList"),
		(APIEnum.TypeAlarmList,"App_Get_Type_AlarmList","TypeAlarmList"),
		(APIEnum.GetAlarmComment,"App_Get_AlarmComment","GetAlarmComment"),
		(APIEnum.GetAlarmInfoById,"App_Get_AlarmInfoByAlarmId","GetAlarmInfoById"),
		(APIEnum.SetAlarmReadStatus,"App_Action_SetAlarmReadStatus","SetAlarmReadStatus"),
		(APIEnum.TempGroupInfoByAlarmId,"App_Get_TempGroupInfoByAlarmId","TempGroupInfoByAlarmId"),
		(APIEnum.GetBenchGroupInfo,"App_Get_BenchGroupInfo","GetBenchGroupInfo"),
		(APIEnum.Logout,"App_Action_Logout","Logout"),
		(APIEnum.AddToTempGroup,"App_Action_AddToTempGroup","AddToTempGroup"),
		(APIEnum.GetAttributeList,"App_Get_AttributeList","GetAttributeList"),
		(APIEnum.GetBranchDeployInfo,"App_Get_BranchDeployInfo","GetBranchDeployInfo"),
//		(APIEnum.GetDynamicInfo,"App_Get_DynamicInfo","GetDynamicInfo"),
		(APIEnum.ActionSuggest,"App_Action_Suggest","ActionSuggest"),
		(APIEnum.GetHistoryDeploy,"App_Get_HistoryDeploy","GetHistoryDeploy"),
		(APIEnum.GetChildrenOrgDeployInfo,"App_Get_ChildrenOrgDeployInfo","GetChildrenOrgDeployInfo"),
		(APIEnum.CancelDelayDeployGetDeployInfo,"App_Action_CancelDelayDeploy_GetDeployInfo","CancelDelayDeployGetDeployInfo"),
		(APIEnum.GetQueryAlarmList,"App_Get_Query_AlarmList","GetQueryAlarmList"),
		(APIEnum.DelayDeploy,"App_Action_DelayDeploy","DelayDeploy"),
		(APIEnum.ActionPasswordModify,"App_Action_PasswordModify","ActionPasswordModify"),
		(APIEnum.GetSonBranchList,"App_Get_SonBranchList","GetSonBranchList"),
		(APIEnum.GetAlarmTypeList,"App_Get_AlarmTypeList","GetAlarmTypeList"),
		(APIEnum.ActionAccountBinding,"App_Action_Account_Binding","ActionAccountBinding"),
		(APIEnum.ReplyAlarmInfo,"App_Action_ReplyInfo_Get_AlarmComment","ReplyAlarmInfo"),
		(APIEnum.DemoBranchList,"App_Get_BranchInfo","DemoBranchList"),
		(APIEnum.GetNewAlarmList,"App_Get_NewAlarmList","GetNewAlarmList"),
		(APIEnum.GetAlarmCommentPagingList,"App_Get_AlarmComment_PagingList","GetAlarmCommentPagingList"),
		(APIEnum.DemoActionAlarm,"App_Action_Alarm","DemoActionAlarm"),
		(APIEnum.DemoActionDeploy,"App_Action_Deploy","DemoActionDeploy"),
		(APIEnum.GetSecurityInfoList,"App_Get_SecurityInfoList","GetSecurityInfoList"),(APIEnum.GetCommentCoolReadCount,"App_Get_Comment_Cool_Read_Count","GetCommentCoolReadCount"),
(APIEnum.ActionCommentMsg,"App_Action_CommentMsg","ActionCommentMsg"),
(APIEnum.GetVariousCategoryCommentList,"App_Get_VariousCategoryCommentList","GetVariousCategoryCommentList"),
(APIEnum.GetKnowledgeInfoList,"App_Get_KnowledgeInfoList","GetKnowledgeInfoList"),
(APIEnum.GetKnowledgeSonCategoryList,"App_Get_KnowledgeSonCategoryList","GetKnowledgeSonCategoryList"),
(APIEnum.GetVariousTopicList,"App_Get_VariousTopicList","GetVariousTopicList"),
		
(APIEnum.PostTopicPicPre,"","PostTopicPicPre"),
//
(APIEnum.PostTopicPic,"App_Action_SendTopic","PostTopicPic"),
(APIEnum.GetUserInfo,"App_Get_UserInfo","GetUserInfo"),
		(APIEnum.ActionUserInfoModify,"App_Action_UserInfoModify","ActionUserInfoModify"),
(APIEnum.ActionUserAvatarModify,"App_Action_UserAvatarModify","ActionUserAvatarModify"),
(APIEnum.GetNewsContent,"App_Get_NewsContent","GetNewsContent"),
(APIEnum.GetTodayKnowledgeInfo,"App_Get_Today_KnowledgeInfo","GetTodayKnowledgeInfo"),
(APIEnum.GetTodaySecurityInfo,"App_Get_Today_SecurityInfo","GetTodaySecurityInfo"),
(APIEnum.GetTopicListUrlById,"App_Get_TopicListUrlById","GetTopicListUrlById"),
(APIEnum.GetTopicByQuery,"App_Get_TopicByQuery","GetTopicByQuery"),
(APIEnum.GetContactPersonList,"App_Get_ContactPersonList","GetContactPersonList"),
(APIEnum.GetKnowledgeInfoListByQuery,"App_Get_KnowledgeInfoListByQuery","GetKnowledgeInfoListByQuery"),
		(APIEnum.GetSecurityInfoListByQuery,"App_Get_SecurityInfoListByQuery","GetSecurityInfoListByQuery"),
		
//
	]
	case T1 = 0
	case Login
	case Logout
	case AlarmTypeCount//获取报警的数量
	case AlarmList//获取没有分类的报警列表
	case TypeAlarmList//获取有分类的报警列表
	case GetAlarmComment//获取报警详情的评论
	case GetAlarmInfoById //根据报警id获取详情
	case ReplyAlarmInfo//写评论并且拉取新的数据
	case SetAlarmReadStatus //设置报警的已读未读的状态
	case TempGroupInfoByAlarmId//获取临时群组
	case GetBenchGroupInfo//获取备用的群组
	case AddToTempGroup//添加到临时群组
	case GetAttributeList //获取布防的网点属性列表
	case GetBranchDeployInfo//获取布防详情
	case GetChildrenOrgDeployInfo//子组织机d
	case CancelDelayDeployGetDeployInfo//取消延迟布防
	case DelayDeploy//延迟布防
	case GetSonBranchList//中心负责人查询网点列表
	case GetAlarmTypeList//获取报警类型的列表
	case GetQueryAlarmList//查询报警列表
	case GetHistoryDeploy //查询历史布防信息
	case ActionPasswordModify //修改密码
//	case GetDynamicInfo//拉去动态的信息
	case ActionSuggest //提交意见
	case ActionAccountBinding //绑定账号
	case  GetNewAlarmList//获取最新的报警信息
	case  DemoBranchList//获取模拟网点和主机列表
	case  DemoActionAlarm//模拟发报警
	case  DemoActionDeploy//模拟布防
	case  GetAlarmCommentPagingList//分页获取报警列表
	case GetSecurityInfoList//获取安保信息列表
	case GetCommentCoolReadCount//获取评论的点赞数等
	case ActionCommentMsg//发评论
	case GetVariousCategoryCommentList//获取评论列表
	case GetKnowledgeInfoList//分页拉起知识库
	case GetKnowledgeSonCategoryList//获取知识库的分类
	case GetVariousTopicList//获取话题列表
	case PostTopicPicPre //上传话题的图片
	case PostTopicPic //上传话题
	case GetUserInfo //获取我的个人信息
	case ActionUserInfoModify //修改我的个人信息
	case ActionUserAvatarModify //上传头像
	case GetNewsContent //获取信息详情
	case GetTodayKnowledgeInfo //获取当天的知识
	case GetTodaySecurityInfo //获取当天的安防信息
	case GetTopicListUrlById //查询话题的url
	case GetTopicByQuery //查询话题列表
	case GetContactPersonList //查询通讯录
	case GetKnowledgeInfoListByQuery //根据关键字查询话题
	case GetSecurityInfoListByQuery //根据关键字查询安保信息
	func getActionName() -> String{
		for (apiM,actionName,_) in APIEnum.APIs {
			if apiM == self {
				return actionName
			}
		}
		return ""
	}
	func getAPIM() ->COAPIM{
		
		var url:String = ""
		var methodName:String = ""
		for (apiM,_,methodName_) in APIEnum.APIs {
			if apiM == self {
				//改成完整的url
				url = "\(APIEnum.getBaseUrl())"
				
				//				if Config.IsCarlos {
				//					url = "\(APIEnum.BaseUrl)"
				//				}
				methodName = methodName_!
			}
		}
		return COAPIM(url: url,methodName: methodName)
	}
}