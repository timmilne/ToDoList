//
//  AddToDoItemViewController.m
//  ToDoList
//
//  Created by Tim.Milne on 2/19/15.
//  Copyright (c) 2015 Tim.Milne. All rights reserved.
//

#import "AddToDoItemViewController.h"

@interface AddToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddToDoItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Clear on edit
    self.textField.clearsOnBeginEditing = TRUE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Only do something if the save button was pressed
    if (sender != self.saveButton) return;
    
    // Did the user enter anything?
    if (self.textField.text.length >0){
        self.toDoItem = [[ToDoItem alloc] init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;
    }
}


@end
