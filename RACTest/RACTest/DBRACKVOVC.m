//
//  DBRACKVOVC.m
//  RACTest
//
//  Created by dengbin on 17/5/11.
//  Copyright © 2017年 dengbin. All rights reserved.
//

#import "DBRACKVOVC.h"

@interface DBRACKVOVC ()

@end

@implementation DBRACKVOVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //nav的第一个子视图是scrollview的时候   系统才自动给scrollview加上64的inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *scrolView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, 400, 400)];
    scrolView.contentSize = CGSizeMake(0, 800);
    scrolView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:scrolView];
    [RACObserve(scrolView, contentOffset) subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
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
