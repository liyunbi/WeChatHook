#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 声明 Hook 逻辑
%hook NSBundle

// 欺骗 Bundle Identifier (核心：不管谁问，我都是正版 ID)
- (NSString *)bundleIdentifier {
    // 检查调用者是否是微信主程序，防止误伤系统调用
    NSArray *address = [NSThread callStackReturnAddresses];
    // 这里是一个简单的策略，强制返回官方 ID
    return @"com.tencent.xin";
}

// 欺骗 InfoDictionary (防止微信读取 info.plist 发现破绽)
- (NSDictionary *)infoDictionary {
    NSDictionary *originalDict = %orig;
    NSMutableDictionary *modifiedDict = [originalDict mutableCopy];
    
    // 修改关键字段为官方值
    [modifiedDict setObject:@"com.tencent.xin" forKey:@"CFBundleIdentifier"];
    [modifiedDict setObject:@"WeChat" forKey:@"CFBundleDisplayName"];
    
    return modifiedDict;
}

%end

// 绕过简单的越狱检测 (可选，增加保险)
%hook JBDetector
- (BOOL)isJailbroken {
    return NO;
}
%end
