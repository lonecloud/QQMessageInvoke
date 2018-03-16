//
//  QQMessageInvoke.m
//  QQMessageInvoke
//
//  Created by lonecloud on 2017/12/22.
//  Copyright © 2017年 lonecloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "substrate/substrate.h"

void handleRecallNotifyIsOnline(id self, SEL _cmd, void * pVoid, BOOL isXXX)
{
    // nop
    // 可以考虑加NSLog用于测试
}

__attribute__((constructor))
static void initialize()
{
    // 使用@selector 会有编译警告，用NSSelectorFromString可消除。
    // 我们的目标是：0 warning 0 error
    SEL selector = NSSelectorFromString(@"handleRecallNotify:isOnline:");
    MSHookMessageEx(NSClassFromString(@"QQMessageRevokeEngine"),selector,(IMP)&handleRecallNotifyIsOnline,NULL);
}
