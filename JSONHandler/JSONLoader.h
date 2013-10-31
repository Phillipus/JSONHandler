//
//  JSONLoader.h
//  JSONHandler
//
//  Created by Phillipus on 28/10/2013.
//  Copyright (c) 2013 Dada Beatnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONLoader : NSObject

// Return an array of Location objects from the json file at location given by url
- (NSArray *)locationsFromJSONFile:(NSURL *)url;

@end
