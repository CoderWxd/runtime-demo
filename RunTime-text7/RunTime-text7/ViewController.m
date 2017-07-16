//
//  ViewController.m
//  RunTime-text7
//
//  Created by 王晓栋 on 2017/7/7.
//  Copyright © 2017年 com.qinqin.www. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()
//{
//    NSString *_property;
//}

//@property(nonatomic,strong)NSString *property;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建--一个新类和元类
    /**
     * 1.添加动态添加变量只能在 objc_allocateClassPair 和 objc_registerClassPair之间才可以
     */
    
    Class result0 = objc_allocateClassPair([NSObject class], "ObjectSubClass", 0);
    NSLog(@">>>>>>>>0:%@",NSStringFromClass(result0));
    id    result1 = [[result0 alloc]init];
    NSLog(@">>>>>>>>1:%@",result1);
    class_addIvar(result0, "_attribute1", sizeof(NSString *), log(sizeof(NSString *)), "i");
    Ivar ivar = class_getInstanceVariable(result0, "_attribute1");//获取变量,如果没获取到说明不存在
    NSLog(@">>>>>>>>2:%@",[NSString stringWithUTF8String:ivar_getName(ivar)]);
    
    //注册--在应用中注册由objc_allocateClassPair创建的类
    objc_registerClassPair(result0);
    //销毁--一个类及其相关联的类,注意不是对象
    //objc_disposeClassPair(result0);



}
- (void)method1{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
