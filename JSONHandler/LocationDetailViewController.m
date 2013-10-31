//
//  LocationDetailViewController.m
//  JSONHandler
//
//  Created by Phillipus on 28/10/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import "LocationDetailViewController.h"
#import "MapAnnotation.h"

@interface LocationDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *telephoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;
@property (weak, nonatomic) IBOutlet UITextView *informationTextView;
@property (weak, nonatomic) IBOutlet UISwitch *visitedSwitch;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation LocationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // We are delegate for map view
    self.mapView.delegate = self;
    
    // Set title
    self.title = self.location.title;
    
    // set texts...
    self.placeLabel.text = self.location.place;
    
    self.informationTextView.text = self.location.information;
    // Bug in iOS 7 - setting UITextView selectable to NO in IB means we lose all font info, so we set selectable here
    self.informationTextView.selectable = NO;
    
    self.telephoneLabel.text = self.location.telephone;
    self.urlLabel.text = self.location.url;
    
    self.visitedSwitch.on = [self.location.visited boolValue];
    
    // Make a map annotation for a pin from the longitude/latitude points
    MapAnnotation *mapPoint = [[MapAnnotation alloc] init];
    mapPoint.coordinate = CLLocationCoordinate2DMake([self.location.latitude doubleValue], [self.location.longitude doubleValue]);
    mapPoint.title = self.location.title;
    
    // Add it to the map view
    [self.mapView addAnnotation:mapPoint];
    
    // Zoom to a region around the pin
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(mapPoint.coordinate, 500, 500);
    [self.mapView setRegion:region];
}


#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKPinAnnotationView *view = nil;
    static NSString *reuseIdentifier = @"MapAnnotation";
    
    // Return a MKPinAnnotationView with a simple accessory button
    view = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIdentifier];
    if(!view) {
        view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
        view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        view.canShowCallout = YES;
        view.animatesDrop = YES;
    }
    
    return view;
}


@end
