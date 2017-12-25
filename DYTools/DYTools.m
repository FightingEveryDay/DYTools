//
// Created by wdy on 2017/11/17.
// Copyright (c) 2017 wdy. All rights reserved.
//

#import "DYTools.h"
#import <UIKit/UIKit.h>

#import <sys/utsname.h>

#import <Contacts/Contacts.h>
#import <AddressBook/AddressBookDefines.h>
#import <AddressBook/ABRecord.h>
#import <AddressBook/ABAddressBook.h>
#import <AddressBook/ABPerson.h>
#import <AddressBook/ABRecord.h>
#import <AddressBook/ABMultiValue.h>

#import "NSString+DYTools.h"

@implementation DYTools

+ (instancetype)share {
    static DYTools *obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        obj = [[DYTools alloc] init];
    });
    return obj;
}

+ (NSString *)dy_platformModel {
    struct utsname systemInfo;
    uname(&systemInfo);

    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];

    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";

    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPod7,1"])   return @"iPod Touch 6G";

    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G";

    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G";

    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4";

    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air";

    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,7"])   return @"iPad Mini 3G";
    if ([platform isEqualToString:@"iPad4,8"])   return @"iPad Mini 3G";
    if ([platform isEqualToString:@"iPad4,9"])   return @"iPad Mini 3G";
    if ([platform isEqualToString:@"iPad5,1"])   return @"iPad Mini 4G";
    if ([platform isEqualToString:@"iPad5,2"])   return @"iPad Mini 4G";
    if ([platform isEqualToString:@"iPad5,3"])   return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad5,4"])   return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad6,3"])   return @"iPad Pro (9.7 inch)";
    if ([platform isEqualToString:@"iPad6,4"])   return @"iPad Pro (9.7 inch)";
    if ([platform isEqualToString:@"iPad6,7"])   return @"iPad Pro (12.9 inch)";
    if ([platform isEqualToString:@"iPad6,8"])   return @"iPad Pro (12.9 inch)";

    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return platform;
}

+ (void)dy_getAdressBook:(void (^)(NSDictionary *dict))block {
    if (@available(iOS 9.0, *)) {
        CNAuthorizationStatus authorizationStatus = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
        if (authorizationStatus == CNAuthorizationStatusNotDetermined) {
            CNContactStore *contactStore = [[CNContactStore alloc] init];
            [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
                if (granted) {
                    block([self getmyAddressbook]);
                } else {
#if DEBUG
                    NSLog(@"授权失败, error=%@", error);
#endif
                    [self gotoSetting:nil];
                }
            }];
        }else if (authorizationStatus == CNAuthorizationStatusAuthorized) {
            block([self getmyAddressbook]);
        }else if (authorizationStatus == CNAuthorizationStatusDenied) {
            [self gotoSetting:nil];
        }
    }else {
        ABAddressBookRef addressBook = ABAddressBookCreate();
        //首次访问需用户授权
        if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {//首次访问通讯录
            ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
                if (!error) {
                    if (granted) {//允许
                        
#if DEBUG
                        NSLog(@"已授权访问通讯录");
#endif
                        NSDictionary *contacts = [self fetchContactWithAddressBook:addressBook];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            //----------------主线程 更新 UI-----------------
                            block(contacts);
                        });
                    }else{//拒绝
#if DEBUG
                         NSLog(@"拒绝访问通讯录");
#endif
                        [self gotoSetting:nil];
                    }
                }else{
#if DEBUG
                    NSLog(@"发生错误!");
#endif
                }
            });
        }else{//非首次访问通讯录
            NSDictionary *contacts = [self fetchContactWithAddressBook:addressBook];
            dispatch_async(dispatch_get_main_queue(), ^{
                //----------------主线程 更新 UI-----------------
                block(contacts);
            });
        }
    }
}

+ (NSDictionary *)fetchContactWithAddressBook:(ABAddressBookRef)addressBook {
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {////有权限访问
        //获取联系人数组
        NSArray *array = (__bridge NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
        NSMutableDictionary *contacts = [NSMutableDictionary dictionary];
        for (int i = 0; i < array.count; i++) {
            //获取联系人
            ABRecordRef people = CFArrayGetValueAtIndex((__bridge ABRecordRef)array, i);
            //获取联系人详细信息,如:姓名,电话,住址等信息
            NSString *firstName = (__bridge NSString *)ABRecordCopyValue(people, kABPersonFirstNameProperty);
            NSString *lastName = (__bridge NSString *)ABRecordCopyValue(people, kABPersonLastNameProperty);
            ABMutableMultiValueRef phoneNumRef = ABRecordCopyValue(people, kABPersonPhoneProperty);
            NSString *phoneNumber =  ((__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(phoneNumRef)).lastObject;
            phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"+86" withString:@""];
            phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
            phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
            [contacts setObject:phoneNumber forKey:[firstName dy_append:lastName]];
        }
        return [contacts copy];
    }else{//无权限访问
#if DEBUG
        NSLog(@"无权限访问通讯录");
#endif
        return nil;
    }
}

+ (NSDictionary *)getmyAddressbook {
    if (@available(iOS 9.0, *)) {
        CNAuthorizationStatus authorizationStatus = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
        if (authorizationStatus == CNAuthorizationStatusAuthorized) {
#if DEBUG
            NSLog(@"没有授权...");
#endif
        }
        NSMutableDictionary *myDict = [NSMutableDictionary dictionary];
        // 获取指定的字段,并不是要获取所有字段，需要指定具体的字段
        NSArray *keysToFetch = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey];
        CNContactFetchRequest *fetchRequest = [[CNContactFetchRequest alloc] initWithKeysToFetch:keysToFetch];
        CNContactStore *contactStore = [[CNContactStore alloc] init];
        [contactStore enumerateContactsWithFetchRequest:fetchRequest error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
            NSString *nameStr = [NSString stringWithFormat:@"%@%@",contact.familyName,contact.givenName];
            NSArray *phoneNumbers = contact.phoneNumbers;
            for (CNLabeledValue *labelValue in phoneNumbers) {
                //            NSString *label = labelValue.label;
                CNPhoneNumber *phoneNumber = labelValue.value;
                //            NSLog(@"label=%@, phone=%@", label, phoneNumber.stringValue);
                NSString *phoneNumberString = [phoneNumber.stringValue stringByReplacingOccurrencesOfString:@"+86" withString:@""];
                phoneNumberString = [phoneNumberString stringByReplacingOccurrencesOfString:@"-" withString:@""];
                phoneNumberString = [phoneNumberString stringByReplacingOccurrencesOfString:@" " withString:@""];
                [myDict setObject:phoneNumberString forKey:nameStr];
            }
            //*stop = YES; // 停止循环，相当于break；
        }];
#if DEBUG
        NSLog(@"mydict is ==== %@",myDict);
#endif
        return [myDict copy];
    }
    return nil;
}

+ (void)gotoSetting:(UIViewController *)vc {
    NSString *appName = [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleDisplayName"];
    if (!appName) appName = [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleName"];
    NSString *message = [NSString stringWithFormat:@"请在%@的\"设置-隐私-通讯录\"选项中，\r允许%@访问你的通讯录。",[UIDevice currentDevice].model,appName];

    UIAlertController *alertVC = [[UIAlertController alloc] init];
    [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

    }];
    [alertVC addAction:cancleAction];
    [alertVC addAction:sureAction];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertVC animated:YES completion:nil];
}
+ (NSString *)dy_uuid {
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref = CFUUIDCreateString(NULL, uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
    return [uuid lowercaseString];
}
@end
