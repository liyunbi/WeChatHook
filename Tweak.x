#import <Foundation/Foundation.h>

// 声明 Hook 目标
%hook NSBundle

// 1. 拦截包名检测
- (NSString *)bundleIdentifier {
    NSString *realId = %orig; // 获取真实ID
    if (self == [NSBundle mainBundle]) {
        return @"com.tencent.xin"; // 撒谎说是正版
    }
    return realId;
}

// 2. 拦截 Info.plist 字典读取（内存劫持）
- (NSDictionary *)infoDictionary {
    NSMutableDictionary *info = [%orig mutableCopy];
    if (self == [NSBundle mainBundle]) {
        // 强行把内存里的 ID 改成正版 ID
        [info setObject:@"com.tencent.xin" forKey:@"CFBundleIdentifier"];
    }
    return info;
}

%end
