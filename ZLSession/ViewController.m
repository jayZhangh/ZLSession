//
//  ViewController.m
//  ZLSession
//
//  Created by ZhangLiang on 2022/7/17.
//

#import "ViewController.h"
#import "ZLSession.h"

@interface ViewController ()

- (IBAction)postAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)postAction:(id)sender {
    [ZLSession POST:@"http://localhost:8080/ZLDemo/uploadImage" params:@{@"name1":@"李四",@"name2":@"张三"} imagesData:@[UIImageJPEGRepresentation([UIImage imageNamed:@"app"], 1), UIImageJPEGRepresentation([UIImage imageNamed:@"IMG_20220603_153040"], 1)] completionBlock:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSLog(@"OK");
        }
        
    }];
}

@end
