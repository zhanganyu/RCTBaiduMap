//
//  RCTBaiduMapView.m
//  百度地图 for react-native
//
//  Created by reese on 16/1/24.
//  Copyright © 2016年 张安宇. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RCTUtils.h"
#import "RCTViewManager.h"
#import "RCTAnnotaion.h"
#import "RCTMapView.h"

#import "RCTBridge.h"

@interface RCTBaiduMapView : RCTViewManager <RCTBridgeModule,BMKMapViewDelegate,BMKLocationServiceDelegate>

@property (nonatomic) RCTMapView *mapView;

@end
@implementation RCTBaiduMapView
RCT_EXPORT_MODULE();


- (RCTMapView *)mapView {
    if (!_mapView) {
        _mapView = [[RCTMapView alloc] init];
        _mapView.locator = [[BMKLocationService alloc] init];
        [_mapView.locator setDelegate:self];
        [_mapView setShowMapScaleBar:YES];
        [_mapView setDelegate:self];
    }
    return _mapView;
}


- (UIView *)view {
    return self.mapView;
}


RCT_EXPORT_VIEW_PROPERTY(isUpdating, BOOL)

RCT_EXPORT_VIEW_PROPERTY(showsUserLocation, BOOL)

RCT_EXPORT_VIEW_PROPERTY(onLocated, RCTBubblingEventBlock);

RCT_CUSTOM_VIEW_PROPERTY(overlays, NSArray, BMKMapView){
    
    for (NSDictionary* dic in json) {
        RCTAnnotaion* annotation = [[RCTAnnotaion alloc]init];
        [annotation setTitle:dic[@"name"]];
        [annotation setSubTitle:dic[@"description"]];
        [annotation setImageUrl:dic[@"picture"]];
        [annotation setCoordinate:CLLocationCoordinate2DMake([dic[@"latitude"] doubleValue], [dic[@"longitude"] doubleValue])];
        [defaultView addAnnotation:annotation];
    }
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(RCTAnnotaion<BMKAnnotation>*)annotation {
    BMKAnnotationView *annoView = [[BMKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"shopAnno"];
    [annoView setPaopaoView:[[BMKActionPaopaoView alloc] initWithCustomView:nil]];
    [annoView setImage:[UIImage imageNamed:@"map_pin"]];
    return annoView;
}


- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
    [_mapView updateLocationData:userLocation];
    [_mapView setCenterCoordinate:userLocation.location.coordinate];
    
    NSDictionary *event = @{
                            @"target": _mapView.reactTag ,
                            @"coords": @{
                                    @"latitude": @(userLocation.location.coordinate.latitude),
                                    @"longitude": @(userLocation.location.coordinate.longitude),
                                    }
                            };
    
    if (_mapView.onLocated) {
     _mapView.onLocated(event);
    }
}

@end
