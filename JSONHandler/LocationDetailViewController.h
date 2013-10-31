//
//  LocationDetailViewController.h
//  JSONHandler
//
//  Created by Phillipus on 28/10/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import <MapKit/MapKit.h>


@interface LocationDetailViewController : UIViewController<MKMapViewDelegate>

@property (weak, nonatomic) Location *location;

@end
