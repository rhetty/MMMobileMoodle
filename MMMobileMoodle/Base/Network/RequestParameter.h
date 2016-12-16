
#import <Foundation/Foundation.h>

@interface RequestParameter : NSObject

@property(nonatomic,copy) NSString *httpMethod;
@property(nonatomic,copy) NSString *url;
@property(nonatomic,copy) NSDictionary *json;
@property(nonatomic,copy) NSDictionary *multiPartJson;
@property(nonatomic,copy) NSDictionary *header;
@property(nonatomic,assign) BOOL needResend;

+ (instancetype)requestWithURL:(NSString *)url json:(NSDictionary *)json;

+(instancetype)postRequest;
+(instancetype)multiPartRequest;
+(instancetype)getRequest;
+(instancetype)deleteRequest;
+(instancetype)putRequest;

@end
