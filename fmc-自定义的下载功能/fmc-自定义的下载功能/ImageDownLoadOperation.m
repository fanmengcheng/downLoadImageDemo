//
//  ImageDownLoadOperation.m
//  fmc-自定义的下载功能
//
//  Created by 樊梦成 on 16/12/13.
//  Copyright © 2016年 樊梦成. All rights reserved.
//

#import "ImageDownLoadOperation.h"

@interface ImageDownLoadOperation ()
//图片的URLString
@property(nonatomic,copy) NSString *URLString;

//回调的block
@property(nonatomic,copy)FinishedBlock finishBlock;

@end
@implementation ImageDownLoadOperation

+ (instancetype)downLoadImageWithURLString:(NSString *)URLString finishedBlock:(FinishedBlock)block{
    ImageDownLoadOperation *imageDownLoadOperation = [[ImageDownLoadOperation alloc]init];
    imageDownLoadOperation.URLString = URLString;
    imageDownLoadOperation.finishBlock = block;
    
    return imageDownLoadOperation;
    
}

- (void)main{
    @autoreleasepool {
        //1.创建URL
        NSURL *url = [NSURL URLWithString:self.URLString];
        
        //2.去服务器上面下载图片的二进制数据
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        //3.将二进制数据,转成UIImage
        UIImage *image = [UIImage imageWithData:data];
        
        //4.回到主线程更新UI
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            if (self.finishBlock) {
                self.finishBlock(image);
            }
        }];
    }
}

@end
