//
//  RCTMapView.m
//  车之音
//
//  Created by reese on 16/1/25.
//  Copyright © 2016年 com.ifenduo. All rights reserved.
//

#import "RCTMapView.h"

@implementation RCTMapView
@synthesize reactTag;

- (void)setIsUpdating:(BOOL)isUpdating {
    _isUpdating = isUpdating;
    if (_isUpdating) {
        [_locator startUserLocationService];
    } else {
        [_locator stopUserLocationService];
    }
}

- (void)removeReactSubview:(id<RCTComponent>)subview {
    return;
}

- (void)insertReactSubview:(id<RCTComponent>)subview atIndex:(NSInteger)atIndex {
    return;
}
- (NSNumber *)reactTagAtPoint:(CGPoint)point {
    return @(1000);
}

- (NSNumber *)reactTag {
    return @(1000);
}

- (NSArray<id<RCTComponent>> *)reactSubviews {
    return nil;
}

- (id<RCTComponent>)reactSuperview {
    return nil;
}
@end
