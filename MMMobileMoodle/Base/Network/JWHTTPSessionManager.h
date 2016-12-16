
#import <AFNetworking/AFNetworking.h>
#import "RequestParameter.h"
#import "MacroUtils.h"

#define TIME_OUT_SECONDS 15

@interface JWHTTPSessionManager : AFHTTPSessionManager

+ (instancetype)sharedInstance;

- (void)GET:(RequestParameter *)parameter completion:(void (^)(NSDictionary *))completion;

- (void)POST:(RequestParameter *)parameter completion:(void (^)(NSDictionary *))completion;

- (void)DELETE:(RequestParameter *)parameter completion:(void (^)(NSDictionary *))completion;

- (void)PUT:(RequestParameter *)parameter completion:(void (^)(NSDictionary *))completion;

- (void)multiPartPOST:(RequestParameter *)parameter success:(void (^)(id))success failure:(void (^)(NSError *))failure progress:(void (^)(float))progress;


- (void)uploadWithParameter:(RequestParameter *)parameter fileURL:(NSURL *)fileURL success:(void (^)(id))success failure:(void (^)(NSError *))failure progress:(void (^)(float))progress;

- (void)downloadWithParameter:(RequestParameter *)parameter savePath:(NSString *)savePath success:(void (^)(id))success failure:(void (^)(NSError *))failure progress:(void (^)(float))progress;

- (void)monitorNetworkReachability;

@end
