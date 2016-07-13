//
//  AddViewController.m
//  ClassMates
//
//  Created by Jeremy Moore on 7/13/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "AddViewController.h"
#import "Student.h"
#import "Store.h"
#import "Student+Extension.h"


@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

- (IBAction)saveButtonSelected:(UIButton *)sender;

@property (strong, nonatomic) Student *student;



@end

@implementation AddViewController

+ (NSString *)indentifier
{
    return NSStringFromClass(self);
}

- (Student *)student
{
    if (!_student) {
        _student = [[Student alloc]init];
    }
    return _student;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)saveButtonSelected:(UIButton *)sender {
    self.student.firstName = self.firstNameField.text;
    self.student.lasttName = self.lastNameField.text;
    self.student.email = self.emailField.text;
    self.student.phone = self.phoneField.text;
    
    if (self.student.isValid && self.completion) {
        [[Store shared]add:self.student];
        [self completion]();
    }
}
@end
