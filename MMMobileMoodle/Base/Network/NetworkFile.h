
#import <Foundation/Foundation.h>

#define MIME_JPG @"image/jpeg"
#define MIME_ZIP @"application/zip"

@interface NetworkFile : NSObject

@property (nonatomic,copy) NSString *filePath;
@property (nonatomic,copy) NSString *mineType;

@end
