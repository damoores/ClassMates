//
//  Store.m
//  ClassMates
//
//  Created by Jeremy Moore on 7/13/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"
#import "Student.h"
#import "NSString+Extension.h"

@interface Store ()

@property (copy, nonatomic) NSMutableArray *students;

@end

@implementation Store

+(instancetype)shared
{
    static Store *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    shared = [[[self class]alloc]init];
    });
    return shared;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _students = [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfFile:[NSString archivePath]]];
        if (!_students) {
            _students =[[NSMutableArray alloc]init];
        }
    }
    return self;
}

- (NSArray *)allStudents
{
    return self.students;
}

- (Student *)studentForIndexPath:(NSIndexPath *) indexPath
{
    return self.students[indexPath.row];
}

- (NSInteger)count
{
    return self.students.count;
}

- (void)add:(Student *)student
{
    if (![self.students containsObject:student]) {
        [self.students addObject:student];
        [self save];
    }
}

- (void)remove:(Student *)student
{
    if ([self.students containsObject:student]) {
        [self.students removeObject:student];
        [self save];
    }
}

- (void)removeStudentAtIndexPath:(NSIndexPath *)indexPath
{
    [self remove:[self studentForIndexPath:indexPath]];
    [self save];
}

- (void)save
{
    [NSKeyedArchiver archiveRootObject:self.students toFile:[NSString archivePath]];

}


@end









