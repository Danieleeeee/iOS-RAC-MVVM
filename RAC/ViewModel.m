

//
//  ViewModel.m
//  RAC
//
//  Created by sino on 17/5/23.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "ViewModel.h"
#import "Model.h"

@implementation ViewModel

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)setUp{
    
    NSMutableArray *arr = [NSMutableArray array];

    
    //创建上拉加载命令
    self.headerCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [arr removeAllObjects];
            for (int i = 0; i<16; i++) {
                Model *model = [[Model alloc]init];
                int x = arc4random() % 100;
                model.name = @"李";
                model.age = [NSString stringWithFormat:@"%d",x];
                [arr addObject:model];
            };
            [subscriber sendNext:arr];
            [subscriber sendCompleted];

            return nil;
        }];
    }];
    
    
    //创建下拉刷新命令
    self.footerCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
            for (int i = 0; i<16; i++) {
                Model *model = [[Model alloc]init];
                
                int x = arc4random() % 100;
                model.name = @"李";
                model.age = [NSString stringWithFormat:@"%d",x];
                [arr addObject:model];
            };
            
            [subscriber sendNext:arr];
            [subscriber sendCompleted];

            return nil;
        }];
    }];
    
}

@end
