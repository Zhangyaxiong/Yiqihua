//
//  ParseDown.m
//  ArtExam
//
//  Created by 张亚雄 on 15/9/10.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "ParseDown.h"

@implementation ParseDown

+ (NSDictionary *)ParseDownToDictionary :(NSURL *)strUrl
{
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:strUrl cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:2];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSLog(@"XXXXX%@",responseData);
    if (responseData != nil)
    {
        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:nil];
        //        NSLog(@"%@->	%@",strUrl,responseDic);
        return responseDic;
    }
    return nil;
}
@end
