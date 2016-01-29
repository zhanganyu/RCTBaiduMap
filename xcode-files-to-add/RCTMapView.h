//
//  RCTMapView.h
//  车之音
//
//  Created by reese on 16/1/25.
//  Copyright © 2016年 com.ifenduo. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapView.h>
#import "BMKLocationService.h"
#import "RCTComponent.h"

@interface RCTMapView : BMKMapView <BMKLocationServiceDelegate,RCTComponent>
@property (nonatomic) BMKLocationService *locator;
@property (nonatomic) BOOL isUpdating;

@property (nonatomic, copy) RCTBubblingEventBlock onLocated;

@end
