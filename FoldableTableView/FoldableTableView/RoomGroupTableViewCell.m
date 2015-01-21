//
//  RoomGroupTableViewCell.m
//  FoldableTableView
//
//  Created by Kirn on 15/1/21.
//  Copyright (c) 2015年 kirn. All rights reserved.
//

#import "RoomGroupTableViewCell.h"
#import "RoomTableViewCell.h"

@interface RoomGroupTableViewCell()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *roomTableView;
@end

@implementation RoomGroupTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 分组下的房型列表
        self.roomTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        self.roomTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        [self.contentView addSubview:self.roomTableView];
        
        // 数据源
        self.roomTableView.delegate = self;
        self.roomTableView.dataSource = self;
        
        // 禁用滚动
        self.roomTableView.scrollEnabled = NO;
        
        // RoomGroupView
        UIView *roomGroupView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.roomTableView.frame.size.width, 60)];
        roomGroupView.backgroundColor = [UIColor redColor];
        self.roomTableView.tableHeaderView = roomGroupView;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"RoomTableViewCell";
    RoomTableViewCell *cell = (RoomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[RoomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = @"hello";
    return cell;
}

#pragma mark -
#pragma mark 
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 20;
}
@end
