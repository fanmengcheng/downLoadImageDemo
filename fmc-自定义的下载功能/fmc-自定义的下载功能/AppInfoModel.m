//
//  AppInfoModel.m
//  fmc-自定义的下载功能
//
//  Created by 樊梦成 on 16/12/13.
//  Copyright © 2016年 樊梦成. All rights reserved.
//

#import "AppInfoModel.h"

@implementation AppInfoModel

+(instancetype)appInfoWithDic:(NSDictionary *)dict{
    AppInfoModel *appInfoModel = [[self alloc]init];
    
    //利用KVC赋值
    [appInfoModel setValuesForKeysWithDictionary:dict];
    
    return appInfoModel;
    
}

+ (NSArray *)appInfoList{
    
    //1.找到apps.plist文件
    NSString *path = [[NSBundle mainBundle]pathForResource:@"apps" ofType:@".plist"];
    
    //2.去NSBundle里面加载apps.plist文件
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    
    //3.创建一个模型数组
    NSMutableArray *appInfoList = [NSMutableArray arrayWithCapacity:dictArray.count];
    
    //4.遍历我们的字典数组，将其转成模型数组
    [dictArray enumerateObjectsUsingBlock:^(NSDictionary *dictionary, NSUInteger idx, BOOL * _Nonnull stop) {
        AppInfoModel *appInfoModel = [AppInfoModel appInfoWithDic:dictionary];
        
        [appInfoList addObject:appInfoModel];
    }];
    return appInfoList.copy;
}

@end
