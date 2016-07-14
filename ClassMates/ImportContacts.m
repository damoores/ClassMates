//
//  ImportContacts.m
//  ClassMates
//
//  Created by Jeremy Moore on 7/13/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "ImportContacts.h"
#import <Contacts/Contacts.h>


@implementation ImportContacts



- (void)getAllContacts
{
    if ([CNContactStore class]) {
        CNContactStore *addressBook = [[CNContactStore alloc]init];
        
        NSArray *keysToFetch =@[CNContactEmailAddressesKey,
                                CNContactFamilyNameKey,
                                CNContactGivenNameKey,
                                CNContactEmailAddressesKey];
        CNContactFetchRequest *fetchRequest = [[CNContactFetchRequest alloc]initWithKeysToFetch:keysToFetch];
        [addressBook enumerateContactsWithFetchRequest:fetchRequest
                                                 error:nil
                                            usingBlock:^(CNContact * __nonnull contact, BOOL * __nonnull stop)
         {[self.contactsArray addObject:contact];
             
         }];
    }
}

@end
