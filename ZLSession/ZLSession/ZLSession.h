//
//  ZLSession.h
//  ZLSession
//
//  Created by ZhangLiang on 2022/7/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLSession : NSObject

+ (void)POST:(NSString *)url params:(NSDictionary *)params imagesData:(NSArray *)filesData completionBlock:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionBlock;

@end

NS_ASSUME_NONNULL_END
