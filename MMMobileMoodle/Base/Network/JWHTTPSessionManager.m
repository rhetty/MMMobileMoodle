
#import "JWHTTPSessionManager.h"
#import "UIView+Toast.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "NetworkFile.h"
#import "ReactiveCocoa.h"

static NSTimeInterval const timeoutInterval = 15;

@implementation JWHTTPSessionManager

+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configure];
    }
    return self;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        [self configure];
    }
    return self;
}

- (void)configure
{
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    
    self.requestSerializer.timeoutInterval = timeoutInterval;
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:HTTP_CONTENT_TEXT, HTTP_CONTENT_SINGER, HTTP_CONTENT_JS, nil];
}

#pragma mark - HTTP Methods

- (RACSignal *)httpRequest:(HTTPMethod)method url:(NSString *)url params:(NSDictionary *)params
{
  @weakify(self)
  return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    @strongify(self);
    switch (method) {
      case HTTPMethodGET:
      {
        [self GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          [subscriber sendNext:responseObject];
          [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          [self showNetworkError:error];
          [subscriber sendError:error];
        }];
        break;
      }
      case HTTPMethodPOST:
      {
        [self POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          [subscriber sendNext:responseObject];
          [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          [self showNetworkError:error];
          [subscriber sendError:error];
        }];
        break;
      }
      case HTTPMethodPUT:
      {
        [self PUT:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          [subscriber sendNext:responseObject];
          [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          [self showNetworkError:error];
          [subscriber sendError:error];
        }];
        break;
      }
      case HTTPMethodDELETE:
      {
        [self DELETE:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          [subscriber sendNext:responseObject];
          [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          [self showNetworkError:error];
          [subscriber sendError:error];
        }];
      }
      default:
        break;
    }
    return nil;
  }];
}

- (void)httpRequest:(HTTPMethod)method url:(NSString *)url params:(NSDictionary *)params completion:(completionBlock)completion
{
  
}

//- (void)GET:(RequestParameter *)parameter completion:(void (^)(NSDictionary *))completion
//{
//    [self GET:parameter.url parameters:parameter.json progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        completion(responseObject?:@{});
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        completion(nil);
//        [self showNetworkError:error];
//    }];
//}
//
//- (void)POST:(RequestParameter *)parameter completion:(void (^)(NSDictionary *))completion
//{
//    [self POST:parameter.url parameters:parameter.json progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        completion(responseObject?:@{});
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        completion(nil);
//        [self showNetworkError:error];
//    }];
//}
//
//- (void)DELETE:(RequestParameter *)parameter completion:(void (^)(NSDictionary *))completion
//{
//    [self DELETE:parameter.url parameters:parameter.json success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        completion(responseObject?:@{});
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        completion(nil);
//        [self showNetworkError:error];
//    }];
//}
//
//- (void)PUT:(RequestParameter *)parameter completion:(void (^)(NSDictionary *))completion
//{
//    [self PUT:parameter.url parameters:parameter.json success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        completion(responseObject?:@{});
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        completion(nil);
//        [self showNetworkError:error];
//    }];
//}
//
//- (void)multiPartPOST:(RequestParameter *)parameter success:(void (^)(id))success failure:(void (^)(NSError *))failure progress:(void (^)(float))progress
//{
//    
//    [self POST:parameter.url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        NSDictionary *fileData = parameter.multiPartJson;
//
//        for (NSString *key in fileData) {
//            if([fileData[key] isKindOfClass:[NetworkFile class]]){
//                NetworkFile *file = fileData[key];
//                if(file.mineType){
//                    [formData appendPartWithFileURL:[NSURL fileURLWithPath:file.filePath] name:key fileName:[file.filePath lastPathComponent] mimeType:file.mineType error:nil];
//                }else{
//                    [formData appendPartWithFileURL:[NSURL fileURLWithPath:file.filePath] name:key error:nil];
//                }
//
//            }else if([fileData[key] isKindOfClass:[NSArray class]]){
//                for(NetworkFile *file in fileData[key]){
//                    if(file.mineType){
//                        [formData appendPartWithFileURL:[NSURL fileURLWithPath:file.filePath] name:key fileName:[file.filePath lastPathComponent] mimeType:file.mineType error:nil];
//                    }else{
//                        [formData appendPartWithFileURL:[NSURL fileURLWithPath:file.filePath] name:key error:nil];
//                    }
//                }
//                
//            }else{
//                [formData appendPartWithFormData:[fileData[key] dataUsingEncoding:NSUTF8StringEncoding] name:key];
//            }
//        }
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        progress(uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        success(responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        failure(error);
//        [self showNetworkError:error];
//    }];
//}
//
//- (void)uploadWithParameter:(RequestParameter *)parameter fileURL:(NSURL *)fileURL success:(void (^)(id))success failure:(void (^)(NSError *))failure progress:(void (^)(float))progress
//{
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:parameter.url]];
//
//    NSURLSessionUploadTask *uploadTask = [self uploadTaskWithRequest:request fromFile:fileURL progress:^(NSProgress * _Nonnull uploadProgress) {
//        progress(uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
//    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//        debugLog(@"***UPLOAD RESPONSE: %@", response);
//        if (!error) {
//            success(response);
//        } else {
//            failure(error);
//            [self showNetworkError:error];
//        }
//    }];
//    [uploadTask resume];
//}
//
//- (void)downloadWithParameter:(RequestParameter *)parameter savePath:(NSString *)savePath success:(void (^)(id))success failure:(void (^)(NSError *))failure progress:(void (^)(float))progress
//{
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:parameter.url]];
//    
//    NSURLSessionDownloadTask *downloadTask = [self downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
//        progress(downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
//    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
//        return [NSURL URLWithString:savePath];
//    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
//        debugLog(@"***DOWNLOAD RESPONSE: %@", response);
//        if (!error) {
//            success(response);
//        } else {
//            failure(error);
//            [self showNetworkError:error];
//        }
//    }];
//    [downloadTask resume];
//}

#pragma mark -

- (void)monitorNetworkReachability
{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (void)showNetworkError:(NSError *)error
{
    debugLog(@"!!!NETWORK ERROR: %@", error);
    [[UIApplication sharedApplication].keyWindow makeToast:NSLocalizedString(@"Network Error!", nil) duration:1 position:CSToastPositionBottom];
}

@end
