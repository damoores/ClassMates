//
//  ImportContacts.h
//  ClassMates
//
//  Created by Jeremy Moore on 7/13/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImportContacts : NSObject

@property (strong, nonatomic) NSMutableArray *contactsArray;

-(void)getAllContacts;

@end
