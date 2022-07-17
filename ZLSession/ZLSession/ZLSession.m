//
//  ZLSession.m
//  ZLSession
//
//  Created by ZhangLiang on 2022/7/17.
//

#import "ZLSession.h"

@implementation ZLSession

+ (void)POST:(NSString *)url params:(NSDictionary *)params imagesData:(NSArray *)filesData completionBlock:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionBlock {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"multipart/form-data;boundary=boundary" forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *fromData = [[NSMutableData alloc] init];
    
    // 1.上传参数
    [params enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [fromData appendData:[[NSString stringWithFormat:@"--boundary\r\nContent-Disposition:form-data;name=\"%@\"\r\n\r\n%@\r\n", key, obj] dataUsingEncoding:NSUTF8StringEncoding]];
    }];
    
    // 2.上传文件
    for (NSData *fileData in filesData) {
        [fromData appendData:[@"--boundary\r\nContent-Disposition:form-data;name=\"images\";filename=\"image.png\"\r\nContent-Type:application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [fromData appendData:fileData];
        [fromData appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    [fromData appendData:[@"--boundary--" dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:fromData];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (completionBlock) {
            completionBlock(data, response, error);
        }
    }] resume];
}

@end
