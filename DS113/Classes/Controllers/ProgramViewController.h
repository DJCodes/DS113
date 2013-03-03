//
//  ProgramViewController.h
//  DS113
//
//  Created by Alain Jiang on 2013-02-23.
//  Copyright (c) 2013 DJ Codes. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ProgramViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{

  NSMutableArray *dataList;
}

@property (nonatomic, strong) UITableView *tableview;

@end
