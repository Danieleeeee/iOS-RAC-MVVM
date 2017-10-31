//
//  TableViewCell.m
//  RAC
//
//  Created by sino on 17/5/23.
//  Copyright © 2017年 Daniel. All rights reserved.
//

#import "TableViewCell.h"
#import <ReactiveObjC.h>
#import "Model.h"
@implementation TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
    }
    return  self;
}


-(void)setUp{

    self.name = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 100, 30)];
    self.name.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.name];
    
    self.age = [[UILabel alloc]initWithFrame:CGRectMake(150, 5, 50, 30)];
    self.age.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.age];
    
}

@end
