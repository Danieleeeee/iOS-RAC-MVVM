//
//  ViewModel.h
//  RAC
//
//  Created by sino on 17/5/23.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@interface ViewModel : NSObject

@property (nonatomic,strong)RACCommand *headerCommand;

@property (nonatomic,strong)RACCommand *footerCommand;

@end
