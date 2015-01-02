//
//  RRStudent.m
//  BlockHomeWork
//
//  Created by gressmc on 08/11/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import "RRStudent.h"

@implementation RRStudent

- (instancetype)initWithName:(NSString*)name lastName:(NSString*)lastName feelsBlock:(void(^)(RRStudent*)) patient
{
    self = [super init];
    if (self) {
        self.name = name;
        self.lastName = lastName;
        [self performSelector:@selector(feelsBad:) withObject:patient afterDelay:arc4random_uniform(15)];
    }
    return self;
}

- (instancetype)init{
    @throw [NSException exceptionWithName:@"init don't use" reason:@"Use initWithName:(NSString*)name lastName:(NSString*)lastName feelsBlock:(void(^)(RRStudent*)) patient" userInfo:nil];
    return nil;
}

-(void)dealloc{
    NSLog(@"%@ dealloceted",self.name);
}

// Болезненые методы

-(void) feelsBad:(void(^)(RRStudent*)) patient{
    self.cough = arc4random_uniform(2);
    self.sneezing = arc4random_uniform(2);
    self.stomachPain = arc4random_uniform(2);
    self.stomach = arc4random_uniform(2);
    self.head = arc4random_uniform(2);
    self.hands = arc4random_uniform(2);
    self.legs = arc4random_uniform(2);
    self.neck = arc4random_uniform(2);
    self.temperature = (CGFloat)(arc4random_uniform(34) + 366)/10.f;
    
    patient(self);
}

-(void) takePill{
    NSLog(@"%@ Take a pill ",self.name);
}
-(void) makeShot{
    NSLog(@"%@ Make a shot ",self.name);
}
-(void) goGastroenterologist{
    NSLog(@"With pain in the stomach %@ %@ went to the gastroenterologist.",self.name, self.lastName);
}

-(BOOL) medicalCertificate{
    return arc4random() % 2;
}
-(BOOL) pain{
    if (self.cough){
        return YES;
    }
    if (self.stomachPain){
        return YES;
    }
    if (self.sneezing){
        return YES;
    }
    return NO;
}
@end
