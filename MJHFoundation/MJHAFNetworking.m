
//
//  MJHAFNetworking.m
//  MJHFoundation
//
//  Created by chni on 16/8/2.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import "MJHAFNetworking.h"
#define defaultRequestTime  15

static MJHAFNetworking *afnSingleton = nil;

@interface MJHAFNetworking ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;


@end

@implementation MJHAFNetworking

+ (MJHAFNetworking *)shareMJHAFNetworking {
    @synchronized(self) {
        if (afnSingleton == nil) {
            afnSingleton = [[super allocWithZone:nil]init];
            afnSingleton.sessionManager = [AFHTTPSessionManager manager];
            [NSURLCache sharedURLCache];
        }
    }
    return afnSingleton;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [MJHAFNetworking shareMJHAFNetworking];
}

- (id)copy {
    return self;
}

- (id)mutableCopy {
    return self;
}

 



#pragma request

- (NSURLSessionDataTask *)MJHPost:(NSString *)url
                        parameter:(NSDictionary *)parameter
                  timeOutInterval:(NSTimeInterval)time
                          success:(successBlock)success
                          failure:(failureBlock)failure  {
    
    [self setRequestSerializer:[AFJSONRequestSerializer serializer]responseSerializer:[AFJSONResponseSerializer serializer]];
    [self setCookie:self.sessionManager.requestSerializer];
    [self setAcceptableContentTypes];
    [self setRequestTimeoutInterval:time];

    NSURLSessionDataTask *sessionTask =
    
    [self.sessionManager POST:url
                   parameters:parameter
                     progress:^(NSProgress * _Nonnull uploadProgress) {
                         
                     }
                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                         if (success) {
                             NSDictionary *responseData = [self responseDataHandle:responseObject];
                             if (responseData) {
                                 success(task,responseData);
                             }else{
                                 if (failure) {
                                     NSError *error = [NSError errorWithDomain:@"com.shs.app" code:-8787 userInfo:@{@"Description":@"request success, but response is nil"}];
                                     failure(task,error);
                                 }
                             }
                         }
                     }
                      failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                         if (failure) {
                             failure(task,error);
                         }
                     }];
    
    return sessionTask;
}


- (NSURLSessionDataTask *)MJHGet:(NSString *)url
                       parameter:(id)parameter
                 timeOutInterval:(NSTimeInterval)time
                         success:(successBlock)success
                         failure:(failureBlock)failure  {
    
    [self setRequestSerializer:[AFHTTPRequestSerializer serializer]responseSerializer:[AFHTTPResponseSerializer serializer]];
    [self setCookie:self.sessionManager.requestSerializer];
    [self setAcceptableContentTypes];
    [self setRequestTimeoutInterval:time];
    
    [self.sessionManager.requestSerializer setCachePolicy:NSURLRequestUseProtocolCachePolicy];

    NSURLSessionDataTask *sessionTask =
    
    
    [self.sessionManager GET:url
                  parameters:parameter
                    progress:^(NSProgress * _Nonnull downloadProgress) {
                        
                    }
                     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                         if (success) {
                             NSDictionary *responseData = [self responseDataHandle:responseObject];
                             if (responseData) {
                                 success(task,responseData);
                             }else{
                                 if (failure) {
                                     NSError *error = [NSError errorWithDomain:@"com.shs.app" code:-8787 userInfo:@{@"Description":@"request success, but response is nil"}];
                                     failure(task,error);
                                 }
                             }
                         }
                     }
                     failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                         if (failure) {
                             failure(task,error);
                         }
                     }];
    
    return sessionTask;
}


- (NSURLSessionDataTask *)MJHUploadFile:(NSString *)url
                              parameter:(NSDictionary *)parameter
                        timeOutInterval:(NSTimeInterval)time
                             uploadBody:(formDataBlock)dataProcessing
                         uploadProgress:(progressBlock)progress
                                success:(successBlock)success
                                failure:(failureBlock)failure{
    
    [self setRequestSerializer:[AFJSONRequestSerializer serializer] responseSerializer:[AFHTTPResponseSerializer serializer]];
    [self setCookie:self.sessionManager.requestSerializer];
    [self setAcceptableContentTypes];
    [self setRequestTimeoutInterval:time];
    
    NSURLSessionDataTask *sessionTask =
    
    [self.sessionManager POST:url
                   parameters:parameter
    constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (dataProcessing) {
            dataProcessing(formData);
        }
    }
                     progress:^(NSProgress * _Nonnull uploadProgress) {
        
    }
                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                          if (success) {
                              NSDictionary *responseData = [self responseDataHandle:responseObject];
                              if (responseData) {
                                  success(task,responseData);
                              }else{
                                  if (failure) {
                                      NSError *error = [NSError errorWithDomain:@"com.shs.app" code:-8787 userInfo:@{@"Description":@"request success, but response is nil"}];
                                      failure(task,error);
                                  }
                              }
                          }
    }
                      failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                          if (failure) {
                              failure(task,error);
                          }
    }];
 
    
    return sessionTask;
}


- (NSDictionary *)responseDataHandle:(id)responseObject {
    NSDictionary *responeDictionary = responseObject ;
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
         responeDictionary = responseObject ;
    }else{
        NSError *error = nil;
        id value = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        if (error) {
            NSLog(@"jsonValueDecoded error:%@", error);
        }
         responeDictionary = value;
    }
    return responeDictionary;
}

- (void)setCookie:(AFHTTPRequestSerializer *)requestSerializer {
   
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"UserDefaultsCookie"]) {
        NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserDefaultsCookie"];
        if([cookiesdata length]) {
            NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
            NSDictionary *requestCookie = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
            [requestSerializer setValue:[requestCookie objectForKey:@"Cookie"] forHTTPHeaderField:@"Cookie"];
        }
    }
}

- (void)setRequestSerializer:(AFHTTPRequestSerializer *)requestType
          responseSerializer:(AFHTTPResponseSerializer *)responseType {
    self.sessionManager.requestSerializer = requestType;
    self.sessionManager.responseSerializer = responseType;
}


- (void)setAcceptableContentTypes {
     self.sessionManager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
}

- (void)setRequestTimeoutInterval:(NSTimeInterval)time {
    [self.sessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    // 设置超时时间
    if (time) {
        self.sessionManager.requestSerializer.timeoutInterval = time;
    }else {
        self.sessionManager.requestSerializer.timeoutInterval = defaultRequestTime;
    }
    [self.sessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
}



@end
