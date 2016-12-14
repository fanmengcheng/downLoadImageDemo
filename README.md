# downLoadImageDemo
第一个demo
	
	AppInfoModel *appInfoModel = self.appInfoList[arc4random_uniform(16)];
    //1.创建一个下载的操作
    __weak typeof(self)weakSelf = self;
    ImageDownLoadOperation *imageDownLoadOperation = [ImageDownLoadOperation downLoadImageWithURLString:appInfoModel.icon     finishedBlock:^(UIImage *image) {
        NSLog(@"%@==>",[NSThread currentThread]);
        weakSelf.imageView.image = image;
        
    }];
    //2.将我们的`任务`添加到`队列`中
    [self.downLoadQueue addOperation:imageDownLoadOperation];
