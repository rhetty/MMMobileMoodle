
#import "RequestParameter.h"
#import "NetworkConstants.h"

@implementation RequestParameter

+ (instancetype)requestWithURL:(NSString *)url json:(NSDictionary *)json
{
    RequestParameter *parameter = [[self alloc] init];
    parameter.url = url;
    parameter.json = json;
    return parameter;
}

+(instancetype)postRequest{
    RequestParameter *parameter = [[self alloc] init];
    NSMutableDictionary *mdict = [NSMutableDictionary dictionaryWithObject:HTTP_CONTENT_SINGER forKey:HTTP_HEADER_CONTENT_TYPE];
    [mdict setValuesForKeysWithDictionary:[parameter customHeader]];
    parameter.header = mdict;
    
    parameter.httpMethod = HTTP_METHOD_POST;
    parameter.needResend = NO;
    return parameter;
}

+(instancetype)putRequest{
    RequestParameter *parameter = [[self alloc] init];
    NSMutableDictionary *mdict = [NSMutableDictionary dictionaryWithObject:HTTP_CONTENT_SINGER forKey:HTTP_HEADER_CONTENT_TYPE];
    [mdict setValuesForKeysWithDictionary:[parameter customHeader]];
    parameter.header = mdict;
    
    parameter.httpMethod = HTTP_METHOD_PUT;
    parameter.needResend = NO;
    return parameter;
}

+(instancetype)deleteRequest{
    RequestParameter *parameter = [[self alloc] init];
    NSMutableDictionary *mdict = [NSMutableDictionary dictionaryWithObject:HTTP_CONTENT_SINGER forKey:HTTP_HEADER_CONTENT_TYPE];
    [mdict setValuesForKeysWithDictionary:[parameter customHeader]];
    parameter.header = mdict;
    
    parameter.httpMethod = HTTP_METHOD_DELETE;
    parameter.needResend = NO;
    return parameter;
}

+(instancetype)multiPartRequest{
    RequestParameter *parameter = [[self alloc] init];
    NSMutableDictionary *mdict = [NSMutableDictionary dictionaryWithObject:HTTP_CONTENT_MULTI forKey:HTTP_HEADER_CONTENT_TYPE];
    [mdict setValuesForKeysWithDictionary:[parameter customHeader]];
    parameter.header = mdict;
    
    parameter.httpMethod = HTTP_METHOD_POST;
    parameter.needResend = NO;
    return parameter;
}

+(instancetype)getRequest{
    RequestParameter *parameter = [[self alloc] init];
    NSMutableDictionary *mdict = [NSMutableDictionary dictionaryWithObject:HTTP_CONTENT_SINGER forKey:HTTP_HEADER_CONTENT_TYPE];
    [mdict setValuesForKeysWithDictionary:[parameter customHeader]];
    parameter.header = mdict;
    
    parameter.httpMethod = HTTP_METHOD_GET;
    parameter.needResend = NO;
    return parameter;
}

- (NSDictionary *)customHeader
{
    return nil;
}

@end
