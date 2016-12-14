//
//  Singleton.h
//  fmc-自定义的下载功能
//
//  Created by 樊梦成 on 16/12/13.
//  Copyright © 2016年 樊梦成. All rights reserved.
//
//.h文件里面的文件替换
#define singleton_h(name) +(instancetype)shared##name;


//.m文件的替换
#if __has_feature(objc_arc)//ARC

#define singleton_m(name) \
static id instance; \
\
+(instancetype)shared##name{ \
  \
   static dispatch_once_t onceToken; \
   dispatch_once(&onceToken,^{ \
       instance = [[self alloc]init]; \
});\
 \
  return instance;\
}\
\
+(instancetype)allocWithZone:(struct _NSZone*)zone{\
   static dispatch_once_t onceToken;\
   dispatch_once(&onceToken,^{\
    instance = [super allocWithZone:zone];\
});\
    \
    return instance;\
}\
\
- (id)copyWithZone:(struct _NSZone *)zone{ \
    \
    return instance; \
}


#else //非ARC

#define singleton_m(name) \
static id instance; \
\
+ (instancetype)shared##name{ \
\
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
instance=[[self alloc] init]; \
}); \
\
return instance; \
}  \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{  \
instance = [super allocWithZone:zone]; \
}); \
\
return instance; \
} \
\
- (id)copyWithZone:(struct _NSZone *)zone{ \
\
return instance; \
} \
\
- (oneway void)release{ \
\
} \
\
- (instancetype)retain{ \
return instance; \
} \
\
- (instancetype)autorelease{ \
return instance; \
} \
\
- (NSUInteger)retainCount{ \
return 1; \
}

#endif
