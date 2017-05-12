//
//  DBRACKVOVC.m
//  RACTest
//
//  Created by dengbin on 17/5/11.
//  Copyright © 2017年 dengbin. All rights reserved.
//

#import "DBKVOVC.h"

@interface DBKVOVC ()
@property(nonatomic,strong)NSString *name;

@end

@implementation DBKVOVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"offset" object:nil] subscribeNext:^(NSNotification *notification) {
        NSLog(@"notification.name ---%@", notification.name);
        NSLog(@"notification.object----%@", notification.object);
    }];
    
    //nav的第一个子视图是scrollview的时候   系统才自动给scrollview加上64的inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *scrolView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, 400, 400)];
    scrolView.contentSize = CGSizeMake(0, 800);
    scrolView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:scrolView];
    [RACObserve(scrolView, contentOffset) subscribeNext:^(id x) {
        NSLog(@"offset---%@",x);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"offset" object:x];

    }];
//     如果self对象的name属性已j开头才会回调subscribeNext
//    [[RACObserve(self, name)
//      filter:^(NSString *newName) {
//          return [newName hasPrefix:@"j"];
//      }]
//     subscribeNext:^(NSString *newName) {
//         NSLog(@"----self.name--%@", newName);
//     }];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
