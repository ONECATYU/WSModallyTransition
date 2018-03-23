//
//  WSModallyView.m
//  Demo
//
//  Created by 余汪送 on 2018/3/22.
//  Copyright © 2018年 余汪送. All rights reserved.
//

#import "WSModallyContainerView.h"

@interface WSModallyContainerView()
@property (nonatomic, strong) NSMapTable<NSLayoutConstraint *, NSNumber *> *constraintToConstantMap;
@end

@implementation WSModallyContainerView

- (instancetype)init {
    if (self = [super init]) {
        _autoAdjustContentEdges = YES;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _autoAdjustContentEdges = YES;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        _autoAdjustContentEdges = YES;
    }
    return self;
}

- (void)safeAreaInsetsDidChange {
    [super safeAreaInsetsDidChange];
    
    if (!_autoAdjustContentEdges) { return; }
    
    for (NSLayoutConstraint *constraint in self.constraintToConstantMap.keyEnumerator) {
        CGFloat originalConstant = [[self.constraintToConstantMap objectForKey:constraint] floatValue];
        NSInteger multiple = 1;
        if (constraint.secondItem == self) { multiple = -1; }
        if (constraint.firstAttribute == NSLayoutAttributeTop) {
            constraint.constant = self.safeAreaInsets.top + originalConstant;
        } else if (constraint.firstAttribute == NSLayoutAttributeLeft ||
                   constraint.firstAttribute == NSLayoutAttributeLeading) {
            constraint.constant = self.safeAreaInsets.left + originalConstant;
        } else if (constraint.firstAttribute == NSLayoutAttributeBottom) {
            constraint.constant = self.safeAreaInsets.bottom * multiple + originalConstant;
        } else if (constraint.firstAttribute == NSLayoutAttributeRight ||
                   constraint.firstAttribute == NSLayoutAttributeTrailing) {
            constraint.constant = self.safeAreaInsets.right * multiple + originalConstant;
        }
    }
}

- (NSMapTable<NSLayoutConstraint *, NSNumber *> *)constraintToConstantMap {
    if (!_constraintToConstantMap) {
        _constraintToConstantMap = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsWeakMemory valueOptions:NSPointerFunctionsStrongMemory];
        [self initOriginalConstantToMap:_constraintToConstantMap];
    }
    return _constraintToConstantMap;
}

- (void)initOriginalConstantToMap:(NSMapTable<NSLayoutConstraint *, NSNumber *> *)map {
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstItem == self || constraint.secondItem == self) {
            if (constraint.firstAttribute == NSLayoutAttributeTop ||
                constraint.firstAttribute == NSLayoutAttributeLeft ||
                constraint.firstAttribute == NSLayoutAttributeLeading ||
                constraint.firstAttribute == NSLayoutAttributeBottom ||
                constraint.firstAttribute == NSLayoutAttributeRight ||
                constraint.firstAttribute == NSLayoutAttributeTrailing)
            {
                [map setObject:@(constraint.constant) forKey:constraint];
            }
        }
    }
}

@end
