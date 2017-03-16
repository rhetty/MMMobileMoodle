//
//
//

#import "AFNetworking.h"
#import "MacroUtils.h"
#import "NetworkConstants.h"

@class RACSignal;

typedef void (^completionBlock)(NSDictionary *response);
typedef void (^errorBlock)(NSError *error);
typedef void (^progressBlock)(CGFloat progress);

@interface JWHTTPSessionManager : AFHTTPSessionManager

+ (instancetype)sharedInstance;

- (RACSignal *)httpRequest:(HTTPMethod)method url:(NSString *)url params:(NSDictionary *)params;

- (void)httpRequest:(HTTPMethod)method url:(NSString *)url params:(NSDictionary *)params completion:(completionBlock)completion;

//- (void)GET:(RequestParameter *)parameter completion:(void (^)(NSDictionary *))completion;
//
//- (void)POST:(RequestParameter *)parameter completion:(void (^)(NSDictionary *))completion;
//
//- (void)DELETE:(RequestParameter *)parameter completion:(void (^)(NSDictionary *))completion;
//
//- (void)PUT:(RequestParameter *)parameter completion:(void (^)(NSDictionary *))completion;
//
//- (void)multiPartPOST:(RequestParameter *)parameter success:(void (^)(id))success failure:(void (^)(NSError *))failure progress:(void (^)(float))progress;
//
//
//- (void)uploadWithParameter:(RequestParameter *)parameter fileURL:(NSURL *)fileURL success:(void (^)(id))success failure:(void (^)(NSError *))failure progress:(void (^)(float))progress;
//
//- (void)downloadWithParameter:(RequestParameter *)parameter savePath:(NSString *)savePath success:(void (^)(id))success failure:(void (^)(NSError *))failure progress:(void (^)(float))progress;

- (void)monitorNetworkReachability;

@end
