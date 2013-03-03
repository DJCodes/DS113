//
//  ProgramViewController.m
//  DS113
//
//  Created by Alain Jiang on 2013-02-23.
//  Copyright (c) 2013 DJ Codes. All rights reserved.
//

#import "ProgramViewController.h"
#import "Program.h"

@interface ProgramViewController ()

@end

@implementation ProgramViewController

@synthesize tableview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dataList = [[NSMutableArray alloc] init];
    
    Program *program = [[Program alloc] init];
    program.title = @"test";
    
    [dataList addObject:program];
  
    [self.tableview reloadData];
  
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataList count];
}

#define kCellIdentifier @"Cell"

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableview dequeueReusableCellWithIdentifier:kCellIdentifier];
    Program *program = [dataList objectAtIndex:indexPath.row];
    cell.textLabel.text = program.title;
    
    return cell;
}


- (void)viewDidAppear:(BOOL)animated
{
    NSIndexPath *selection = [self.tableview indexPathForSelectedRow];
    if (selection) {
        [self.tableview deselectRowAtIndexPath:selection animated:animated];
        [self.tableview reloadData];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self.tableview flashScrollIndicators];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"showDetail"]){
        NSIndexPath *indexPath = [self.tableview indexPathForSelectedRow];
        Program *program = [dataList objectAtIndex:indexPath.row];
        //[[segue destinationViewController] setDetailItem:program];
    }
}





@end
