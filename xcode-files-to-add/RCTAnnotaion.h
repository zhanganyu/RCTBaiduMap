//
//  RCTBaiduMapView.m
//  百度地图 for react-native
//
//  Created by reese on 16/1/24.
//  Copyright © 2016年 张安宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BMKAnnotation.h>

@interface RCTAnnotaion : NSObject<BMKAnnotation>

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *subTitle;
@property (nonatomic) NSString *imageUrl;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@end
