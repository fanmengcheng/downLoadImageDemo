//
//  AppInfoModel.h
//  fmc-自定义的下载功能
//
//  Created by 樊梦成 on 16/12/13.
//  Copyright © 2016年 樊梦成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfoModel : NSObject

//名称
@property(nonatomic,copy) NSString *name;

//图片的地址
@property(nonatomic,copy) NSString *icon;

//下载量
@property(nonatomic,copy) NSString *download;

//返回apps.plist里面对应的模型数组

+(NSArray *)appInfoList;

@end
