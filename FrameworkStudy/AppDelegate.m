//
//  AppDelegate.m
//  FrameworkStudy
//
//  Created by 신진우 on 2022/09/23.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

NSString *docPath() {
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return [[pathList objectAtIndex:0]stringByAppendingPathComponent:@"data.td"];
}

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //디스크에 저장된 배열에서 기존 할 일 데이터 집합을 로드한다.
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    
    if (plist) {
        //데이터 집합을 사용 할 수 있다면 이를 우리의 인스턴스 변수에 복사.
        tasks = [plist mutableCopy];
    } else {
        //사용 불가능시 데이터 집합을 만들어 시작
        tasks = [[NSMutableArray alloc]init];
    }
    
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
