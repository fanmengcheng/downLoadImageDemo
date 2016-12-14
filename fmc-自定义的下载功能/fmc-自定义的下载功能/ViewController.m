//
//  ViewController.m
//  fmc-自定义的下载功能
//
//  Created by 樊梦成 on 16/12/13.
//  Copyright © 2016年 樊梦成. All rights reserved.
//

#import "ViewController.h"
#import "AppInfoModel.h"
#import "ImageDownLoadOperation.h"
@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;


//模型数组
@property(nonatomic,strong) NSArray *appInfoList;

@property(nonatomic,strong) NSOperationQueue *downLoadQueue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

- (NSArray *)appInfoList{
    if (_appInfoList == nil) {
        _appInfoList = [AppInfoModel appInfoList];
    }
    return _appInfoList;
}

- (NSOperationQueue *)downLoadQueue{
    if (_downLoadQueue == nil) {
        _downLoadQueue = [[NSOperationQueue alloc] init];
    }
    return _downLoadQueue;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    AppInfoModel *appInfoModel = self.appInfoList[arc4random_uniform(16)];
    //1.创建一个下载的操作
    __weak typeof(self)weakSelf = self;
    ImageDownLoadOperation *imageDownLoadOperation = [ImageDownLoadOperation downLoadImageWithURLString:appInfoModel.icon finishedBlock:^(UIImage *image) {
        NSLog(@"%@==>",[NSThread currentThread]);
        weakSelf.imageView.image = image;
        
    }];
    //2.将我们的`任务`添加到`队列`中
    [self.downLoadQueue addOperation:imageDownLoadOperation];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
