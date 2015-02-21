//
//  ToDoItem.h
//  ToDoList
//
//  Created by Tim.Milne on 2/19/15.
//  Copyright (c) 2015 Tim.Milne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
