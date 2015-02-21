//
//  ToDoListTableViewController.m
//  ToDoList
//
//  Created by Tim.Milne on 2/19/15.
//  Copyright (c) 2015 Tim.Milne. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"

@interface ToDoListTableViewController ()

@property NSMutableArray *toDoItems;

@end

@implementation ToDoListTableViewController

- (void)loadInitialData {
    ToDoItem *item1 = [[ToDoItem alloc] init];
    item1.itemName = @"Buy milk";
    [self.toDoItems addObject:item1];
    
    ToDoItem *item2 = [[ToDoItem alloc] init];
    item2.itemName = @"Buy eggs";
    [self.toDoItems addObject:item2];
    
    ToDoItem *item3 = [[ToDoItem alloc] init];
    item3.itemName = @"Read a book";
    item3.completed = TRUE;
    [self.toDoItems addObject:item3];
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    
    // Get the source controller
    AddToDoItemViewController *source = [segue sourceViewController];
    
    // Retrieve the newly entere text (if any)
    ToDoItem *item = source.toDoItem;
    
    // Add it to the list and refresh
    if (item != nil){
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Get the cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    // Set the label of the cell
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    
    // Toggle the checkmark if the To Do item is done
    cell.accessoryType = (toDoItem.completed)?UITableViewCellAccessoryCheckmark:UITableViewCellAccessoryNone;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Deslect the cell right after selection
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    // Toggle the complete state
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    
    // Reload the changed row
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
