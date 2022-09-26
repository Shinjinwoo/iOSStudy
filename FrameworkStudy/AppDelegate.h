//
//  AppDelegate.h
//  FrameworkStudy
//
//  Created by 신진우 on 2022/09/23.
//

#import <UIKit/UIKit.h>
/**
C언어로 작성된 도우미 함수
경로를 가져오는데 사용된다. 할 일 목록이 저장되는 디스크의 위치를 나타낸다
주의사항 : 클래스 선언 위에서 선언 됨을 주의.
 */

NSString *docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate>

{
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    
    NSMutableArray *tasks;
}

-(void)addTask:(id)sender;

@property (strong,nonatomic) UIWindow *window;

@end

