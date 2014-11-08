//
//  AppDelegate.m
//  BlockHomeWork
//
//  Created by gressmc on 08/11/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import "AppDelegate.h"
#import "RRStudent.h"

typedef void(^VoidBlockVoid)(void);
typedef void(^VoidBlockString)(NSString*);

@interface AppDelegate ()
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    void (^studBlock)(RRStudent*)= ^(RRStudent* stud){
        if (stud.temperature>=36.9f && stud.temperature<37.7f) {
            if (stud.sneezing || stud.cough) {
                if ([stud medicalCertificate]) {
                    [stud takePill];
                }else{
                    NSLog(@"%@ %@ Sorry, you do not have health insurance. ",stud.name, stud.lastName);
                }
            }
            if (stud.stomachPain){
                [stud goGastroenterologist];
            }
            if (!stud.stomachPain && !stud.sneezing && !stud.cough){
                NSLog(@"%@ %@ Don't worry it ORVI - it will soon pass ",stud.name, stud.lastName);
            }
        }else if (stud.temperature>=37.7) {
            if (stud.sneezing || stud.cough) {
                if ([stud medicalCertificate]) {
                    [stud makeShot];
                }else{
                    NSLog(@"%@ %@ Sorry, you do not have health insurance.",stud.name, stud.lastName);
                }
            }
            if (stud.stomachPain){
                NSLog(@"%@ %@ We'll send you in the ambulance to the gastroenterologist. ",stud.name, stud.lastName);
            }else{
                NSLog(@"%@ %@ I don't know what's wrong with you. I'll send you in the ambulance to the hospital. ",stud.name, stud.lastName);
            }
        } else {
            NSLog(@"%@ %@ go home! You are healthy ",stud.name, stud.lastName);
        }
        NSLog(@"-+-+-+-+-+-");
    };
#pragma mark - Shcolar
    // 1:
    VoidBlockVoid testBlock = ^{
        NSLog(@"Ученик 1");
    };
    testBlock();
    
    // 2:
    VoidBlockString testBlockString = ^(NSString* str){
        NSLog(@"Ученик 2: - %@",str);
    };
    testBlockString(@"TestStringBlock");
    
    // 4:
    VoidBlockString testBlockString2 = ^(NSString* str){
        NSLog(@"Ученик 3: - %@",str);
    };
    [self testMetodWithBlock:testBlockString2];
    
    
#pragma mark - Student
    NSLog(@"\n---Блок Student---\n");
    
    // 5 - 6:
    RRStudent* student1 = [[RRStudent alloc] initWithName:@"Nastya" lastName:@"Bon"  feelsBlock:studBlock];
    RRStudent* student2 = [[RRStudent alloc] initWithName:@"Dima" lastName:@"Petrov" feelsBlock:studBlock];
    RRStudent* student3 = [[RRStudent alloc] initWithName:@"Ivan" lastName:@"Petrov" feelsBlock:studBlock];
    RRStudent* student4 = [[RRStudent alloc] initWithName:@"Alex" lastName:@"Koval"  feelsBlock:studBlock];
    RRStudent* student5 = [[RRStudent alloc] initWithName:@"Roman" lastName:@"Bon"  feelsBlock:studBlock];
    RRStudent* student6 = [[RRStudent alloc] initWithName:@"Vera" lastName:@"Ivanova"  feelsBlock:studBlock];
    RRStudent* student7 = [[RRStudent alloc] initWithName:@"Inna" lastName:@"Petrova"  feelsBlock:studBlock];
    RRStudent* student8 = [[RRStudent alloc] initWithName:@"Yana" lastName:@"Ivanova"  feelsBlock:studBlock];
    RRStudent* student9 = [[RRStudent alloc] initWithName:@"Dmitriy" lastName:@"Shatc"  feelsBlock:studBlock];
    RRStudent* student10 = [[RRStudent alloc] initWithName:@"Ivan" lastName:@"Burov"  feelsBlock:studBlock];
    RRStudent* studi = [RRStudent new];
    studi.name = @"Mndfsdfk";
    NSLog(@"%@",studi.name);
    // 7: Помещаем студентов  в массив
    NSArray* arrayOfStudent = @[student1,student2,student3,student4,student5,student6,student7,student8,student9,student10];
    
    // 8: Сортировка массива по фамилиям - потом по именам
    NSArray* sortArray = [arrayOfStudent sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if (![[obj1 lastName] isEqualToString:[obj2 lastName]]) {
            return [[obj1 lastName] compare:[obj2 lastName]];
        } else {
            return [[obj1 name] compare:[obj2 name]];
        }
    }];
    
    for (RRStudent* stud in sortArray) {
        NSLog(@"%@  %@",stud.lastName,stud.name);
    }
    
#pragma mark - Master
    NSLog(@"\n---Блок Master---\n");
    
    for (RRStudent* stud in sortArray) {
        NSLog(@"%@  %@",stud.lastName,stud.name);
        [stud feelsBad:studBlock];
    }
 
#pragma mark - SuperMan
    NSLog(@"\n---Блок SuperMan---\n");
    
    return YES;
}

-(void) testMetodWithBlock:(VoidBlockString) testBlock{
    testBlock(@"testMetodWithBlock");
}

@end
