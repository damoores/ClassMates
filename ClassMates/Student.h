//
//  Student.h
//  ClassMates
//
//  Created by Jeremy Moore on 7/13/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    NSString *_firstName;
    NSString *_lastName;
    NSString *_email;
    NSString *_phone;
}

#pragma mark - designated initializer

-(instancetype)initWithFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                           email:(NSString *)email
                           phone:(NSString *)phone;

#pragma mark - Getters/Setters

-(void)setFirstName:(NSString *)firstName;
-(NSString *)firstName;
-(void)setLasttName:(NSString *)lastName;
-(NSString *)lastName;
-(void)setEmail:(NSString *)email;
-(NSString *)email;
-(void)setPhone:(NSString *)phone;
-(NSString *)phone;

@end
