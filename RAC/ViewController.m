 //
//  ViewController.m
//  RAC
//
//  Created by sino on 17/5/18.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC.h>
#import "YiRefreshHeader.h"
#import "YiRefreshFooter.h"
#import "Model.h"
#import "TableView.h"
#import "ViewModel.h"

@interface ViewController ()

@property (nonatomic,strong)TableView *tableView;

@property (nonatomic,strong)YiRefreshHeader *header;
@property (nonatomic,strong)YiRefreshFooter *footer;

@property (nonatomic,strong)ViewModel *vm;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[TableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    
    [self.view addSubview:self.tableView];
    
    self.header = [[YiRefreshHeader alloc]init];
    self.header.scrollView = self.tableView;
    [self.header header];
    
    __weak typeof(self) weakSelf = self;
    self.header.beginRefreshingBlock = ^(){
        
        __strong typeof(self) strongSelf = weakSelf;
        [[strongSelf.vm.headerCommand execute:nil] subscribeNext:^(id  _Nullable x) {
            
            strongSelf.tableView.arr = x;
            [strongSelf.header endRefreshing];
            [strongSelf.tableView reloadData];
        }];
        
    };

    [self.header beginRefreshing];
    
    
    self.footer = [[YiRefreshFooter alloc]init];
    self.footer.scrollView = self.tableView;
    [self.footer footer];
    
    self.footer.beginRefreshingBlock = ^(){
        
            __strong typeof(self) strongSelf = weakSelf;
        
            [[strongSelf.vm.footerCommand execute:nil] subscribeNext:^(id  _Nullable x) {
                
                strongSelf.tableView.arr = x;
                [strongSelf.footer endRefreshing];
                [strongSelf.tableView reloadData];
            }];
    };
    
    
}



-(ViewModel *)vm{
    if (!_vm) {
        
        _vm = [ViewModel new];
    }
    return _vm;
}


@end
