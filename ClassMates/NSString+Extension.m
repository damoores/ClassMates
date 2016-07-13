//
//  NSString+Extension.m
//  ClassMates
//
//  Created by Jeremy Moore on 7/13/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//


#import "NSString+Extension.h"

@implementation NSString (Extension)

+ (NSString *)archivePath
{
    NSArray *documentsDirectories = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *documentsDirectory = documentsDirectories[0];
    return [[documentsDirectory URLByAppendingPathComponent:@"store"]path];
}

@end
