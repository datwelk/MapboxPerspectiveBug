//
//  ViewController.m
//  MapboxPerspectiveBug
//
//  Created by Damiaan Twelker on 29/04/2019.
//  Copyright © 2019 LIVEOP BV. All rights reserved.
//

#import "ViewController.h"

@import Mapbox;

@implementation ViewController {
    MGLMapView *_mapView;
    UIButton *_toggle;
    BOOL _is3D;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds];
    _mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(59.31, 18.06) zoomLevel:15 animated:NO];
    [self.view addSubview:_mapView];
    
    _toggle = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _toggle.backgroundColor = [UIColor blueColor];
    _toggle.layer.cornerRadius = 10.0f;
    _toggle.layer.masksToBounds = YES;
    _toggle.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    [_toggle setTitle:@"Toggle Perspective" forState:UIControlStateNormal];
    [_toggle setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_toggle sizeToFit];
    [_toggle addTarget:self action:@selector(togglePressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_toggle];
    
    _toggle.translatesAutoresizingMaskIntoConstraints = NO;
    [_toggle.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10.0].active = YES;
    [_toggle.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
}

#pragma mark -

- (void)togglePressed
{
    MGLMapCamera *camera = _mapView.camera;
    camera.pitch = _is3D ? 0.0 : 45.0;
    [_mapView setCamera:camera
           withDuration:1.0f
animationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]
            edgePadding:UIEdgeInsetsMake(10, 10, 50, 10)
      completionHandler:nil];
    
    _is3D = !_is3D;
}

@end
