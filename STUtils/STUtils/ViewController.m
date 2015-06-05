//
//  ViewController.m
//  STUtils
//
//  Created by zhenlintie on 15/6/3.
//  Copyright (c) 2015年 sTeven. All rights reserved.
//

#import "ViewController.h"
#import "STUtilsHeader.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView2;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView.contentSize = st_size(self.width, 2000);
    _scrollView.backgroundColor = st_colorGroupTableViewBackground();
    _scrollView2.contentSize = st_size(2000, _scrollView2.height);
    _scrollView2.backgroundColor = st_lightPlum();
    _label1.textColor = st_darkWatermelon();
    _label1.backgroundColor = st_lightTeal();
    
    _label2.textColor = st_lightYellow();
    _label2.textColor = st_darkRed();
}

- (IBAction)logButtonTapped:(id)sender {
    NSLog(@"label1:%@",[NSValue valueWithCGRect:_label1.inScreenFrame]);
    NSLog(@"-----");
    NSLog(@"label2:%@",[NSValue valueWithCGRect:_label2.inScreenFrame]);
    
//    st_openUrl(st_makeUrlWithDomain(@"www.baidu.com"));
}

@end
