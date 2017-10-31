//
//  TableView.m
//  RAC
//
//  Created by sino on 17/5/23.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "TableView.h"
#import <ReactiveObjC.h>
#import "TableViewCell.h"
#import "Model.h"
static NSString  *readId  = @"cell";

@interface TableView ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation TableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[TableViewCell class] forCellReuseIdentifier:readId];
    }
    return self;
}

#pragma mark -- UITableViewDelegate,UITableViewDataSource --
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arr.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:readId forIndexPath:indexPath];
    Model *model = [_arr objectAtIndex:indexPath.row];
    cell.name.text = model.name;
    cell.age.text = model.age;
    return cell;
}

@end
