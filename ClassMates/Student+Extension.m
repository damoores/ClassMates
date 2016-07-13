//
//  Student+Extension.m
//  ClassMates
//
//  Created by Jeremy Moore on 7/13/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "Student+Extension.h"

@implementation Student (Extension)

- (BOOL) isValid
{
    if (self.firstName.length > 0 && self.lastName.length > 0) {
        return YES;
    }
    return NO;
}

@end
