//
//  ViewController.m
//  ContactsWrapper
//
//  Created by Abdullah Selek on 01/08/16.
//  Copyright © 2016 Abdullah Selek. All rights reserved.
//

#import "ViewController.h"
#import "ContactsWrapper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // get all contacts
    [[ContactsWrapper sharedInstance] getContacts:^(NSArray<CNContact *> * _Nullable contacts, NSError * _Nullable error) {
        if (contacts)
        {
            NSLog(@"Count : %ld", contacts.count);
        }
        else
        {
            NSLog(@"Error : %@", error.description);
        }
    }];
    // get all contacts with keys
    NSArray *keys = @[CNContactNamePrefixKey,
                      CNContactGivenNameKey,
                      CNContactMiddleNameKey,
                      CNContactFamilyNameKey,
                      CNContactPreviousFamilyNameKey,
                      CNContactNameSuffixKey,
                      CNContactNicknameKey,
                      CNContactPhoneticGivenNameKey,
                      CNContactPhoneticMiddleNameKey,
                      CNContactPhoneticFamilyNameKey,
                      CNContactOrganizationNameKey];
    [[ContactsWrapper sharedInstance] getContactsWithKeys:keys completionBlock:^(NSArray<CNContact *> * _Nullable contacts, NSError * _Nullable error) {
        if (contacts)
        {
            NSLog(@"Count : %ld", contacts.count);
        }
        else
        {
            NSLog(@"Error : %@", error.description);
        }
    }];
    // save contact
    CNMutableContact *testContact = [CNMutableContact new];
    testContact.givenName = @"Contacts";
    testContact.familyName = @"Wrapper";
    NSData *imageData = UIImagePNGRepresentation([UIImage imageNamed:@"apple.png"]);
    testContact.imageData = imageData;
    [[ContactsWrapper sharedInstance] saveContact:testContact completionBlock:^(bool isSuccess, NSError * _Nullable error) {
        if (isSuccess)
        {
            NSLog(@"Contact saved successfully");
        }
    }];
    // get contacts with given name
    [[ContactsWrapper sharedInstance] getContactWithGivenName:@"Contacts" completionBlock:^(NSArray<CNContact *> * _Nullable contacts, NSError * _Nullable error) {
        if (contacts)
        {
            NSLog(@"%@", contacts);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
