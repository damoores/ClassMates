//
//  Store.h
//  ClassMates
//
//  Created by Jeremy Moore on 7/13/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

@import Foundation;
@class Student;

//typedef void(^StoreCompletion)();

@interface Store : NSObject

+(instancetype)shared;

- (NSArray *)allStudents;
- (Student *)studentForIndexPath:(NSIndexPath *) indexPath;
- (NSInteger)count;

- (void)add:(Student *)student;
- (void)remove:(Student *)student;
- (void)removeStudentAtIndexPath:(NSIndexPath *)indexPath;
- (void)save;

@end
