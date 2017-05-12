//
//  DBContolEventVC.m
//  RACTest
//
//  Created by dengbin on 17/5/11.
//  Copyright © 2017年 dengbin. All rights reserved.
//

#import "DBControlEventVC.h"

@interface DBControlEventVC ()
@end

@implementation DBControlEventVC

- (void)viewDidLoad {
    [super viewDidLoad];
[[self.button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {


    NSLog(@"%@",x);

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"RAC" message:@"123" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
//    [[self rac_signalForSelector:@selector(alertView:clickedButtonAtIndex:) fromProtocol:@protocol(UIAlertViewDelegate)] subscribeNext:^(RACTuple *tuple) {
//        NSLog(@"%@",tuple);
//        NSLog(@"%@",tuple.first);
//    }];
    [alertView show];


    [[alertView rac_buttonClickedSignal] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];



}];

    


    [[self.textField rac_textSignal] subscribeNext:^(id x) {
        self.name = x;
        NSLog(@"%@",x);
    }];


    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]init];
    [[tapGR rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        NSLog(@"%@",x);
    }];

    [self.label addGestureRecognizer:tapGR];
    
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
