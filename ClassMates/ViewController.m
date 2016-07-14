//
//  ViewController.m
//  ClassMates
//
//  Created by Jeremy Moore on 7/13/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "ViewController.h"
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>
#import "Store.h"
#import "Student.h"
#import "Student+Extension.h"
#import "AddViewController.h"


@interface ViewController () <CNContactPickerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)importButtonSelected:(UIBarButtonItem *)sender;

@property (strong, nonatomic) Student *student;

@end

@implementation ViewController


- (Student *)student
{
    if (!_student) {
        _student = [[Student alloc]init];
    }
    return _student;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 60;
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:YES];
//    [self.tableView reloadData];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:[AddViewController indentifier]]) {
        AddViewController *addViewController = (AddViewController *)segue.destinationViewController;
        addViewController.completion = ^ {
            [self.tableView reloadData];
        };
    }
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[Store shared] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *studentCell = [tableView dequeueReusableCellWithIdentifier:@"studentCell" forIndexPath:indexPath];
    Student *student = [[Store shared] studentForIndexPath:indexPath];
    studentCell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
    studentCell.detailTextLabel.text = [NSString stringWithFormat:@"Phone: %@ Email: %@", student.phone, student.email];
    [studentCell.contentView.superview setClipsToBounds:NO];
    return studentCell;
}


#pragma mark -- UITableView Delegate

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[Store shared]removeStudentAtIndexPath:indexPath];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
    }
}





- (IBAction)importButtonSelected:(UIBarButtonItem *)sender {
    CNContactPickerViewController *contactPicker = [CNContactPickerViewController new];
    contactPicker.delegate = self;
    [self presentViewController:contactPicker animated:YES completion:nil];
}

#pragma mark -- Contact Picker Delegate

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact
{
    [self getContactDetails:contact];
}

- (void)getContactDetails:(CNContact *)contactObject
{
    self.student.firstName = contactObject.givenName;
    self.student.lasttName = contactObject.familyName;
    self.student.email = contactObject.emailAddresses.firstObject.value;
    NSLog(@"phone number label: %@", contactObject.phoneNumbers.firstObject.value.stringValue);
    self.student.phone = contactObject.phoneNumbers.firstObject.value.stringValue;
    
    if (self.student.isValid) {
        [[Store shared]add:self.student];
    }
    [self.tableView reloadData];
}

@end
