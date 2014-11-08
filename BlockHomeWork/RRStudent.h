//
//  RRStudent.h
//  BlockHomeWork
//
//  Created by gressmc on 08/11/14.
//  Copyright (c) 2014 gressmc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RRStudent : NSObject

@property(strong,nonatomic) NSString* name;
@property(strong,nonatomic) NSString* lastName;

- (instancetype)initWithName:(NSString*)name lastName:(NSString*)lastName feelsBlock:(void(^)(RRStudent*)) patient;


// Болезненые методы и проперти

@property(assign,nonatomic) CGFloat temperature;
@property(assign,nonatomic) BOOL cough;
@property(assign,nonatomic) BOOL sneezing;
@property(assign,nonatomic) BOOL stomachPain;

@property(assign,nonatomic) BOOL stomach;
@property(assign,nonatomic) BOOL head;
@property(assign,nonatomic) BOOL hands;
@property(assign,nonatomic) BOOL legs;
@property(assign,nonatomic) BOOL neck;

-(void) feelsBad:(void(^)(RRStudent*)) patient;
-(void) takePill;
-(void) makeShot;
-(void) goGastroenterologist;
-(BOOL) medicalCertificate;
-(BOOL) pain;


@end
