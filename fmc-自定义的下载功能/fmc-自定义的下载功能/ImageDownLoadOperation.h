//
//  ImageDownLoadOperation.h
//  fmc-自定义的下载功能
//
//  Created by 樊梦成 on 16/12/13.
//  Copyright © 2016年 樊梦成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^FinishedBlock)(UIImage *image);

@interface ImageDownLoadOperation : NSOperation
//根据一个URLString，来下载图片，下载完毕之后，通过回调，将我们下载好的图片，返回给调用者；
//图片的URLString
//finishedBlock 回调方法

+ (instancetype)downLoadImageWithURLString:(NSString *)URLString finishedBlock:(FinishedBlock)block;

@end
