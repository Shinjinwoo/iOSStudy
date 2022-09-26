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
    
    //UIWindow 인스턴스를 만들고
    //CGRect는 orgin(x,y)와 size(width,height)를 갖춘 구조체다.
    CGRect windowFrame = [[UIScreen mainScreen]bounds];
    UIWindow *theWindow = [[UIWindow alloc]initWithFrame:windowFrame];
    
    [self setWindow:theWindow];
    
    // UI 요소 세 개의 프레임을 정의한다.
    // CGRectMakr()는 (x,y,width,height)로 CGRect를 만든다.
    
    CGRect tableFrame = CGRectMake(0, 80, 320, 380);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    
    taskTable = [[UITableView alloc]initWithFrame:tableFrame
                                            style:UITableViewStylePlain];
    
    [taskTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    taskField = [[UITextField alloc]initWithFrame:fieldFrame];
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type a task, tap Insert"];
    
    //둥근 사각형의 Insert 버튼을 만들고 구상한다.
    insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setFrame:buttonFrame];
    
    //버튼은 타깃/액션 콜백을 사용하여 동작한다.
    //이 객체의 -addTask: 메소드를 호출 하도록 Insert 버튼의 액션을 구성한다.
    
    [insertButton addTarget:self
                     action:@selector(addTask:)
           forControlEvents:UIControlEventTouchUpInside];
    
    //버튼의 이름을 지정한다.
    [insertButton setTitle:@"Insert"
                  forState:UIControlStateNormal];
    
    // UI 요소 세 개를 윈도우에 추가한다.
    [[self window]addSubview:taskTable];
    [[self window]addSubview:taskField];
    [[self window]addSubview:insertButton];
    
    [[self window]setBackgroundColor:[UIColor whiteColor]];
    [[self window]makeKeyAndVisible];
    
    
    
    
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
