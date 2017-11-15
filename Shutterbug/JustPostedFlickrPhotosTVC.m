//
//  JustPostedFlickrPhotosTVC.m
//  Shutterbug
//
//  Created by Albert on 14/11/17.
//  Copyright © 2017 Albert. All rights reserved.
//

#import "JustPostedFlickrPhotosTVC.h"
#import "FlickrFetcher.h"

@interface JustPostedFlickrPhotosTVC ()

@end

@implementation JustPostedFlickrPhotosTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchPhotos];
}

- (void)fetchPhotos{
    NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
#warning Block Main Thread
    NSData *jsonResults = [NSData dataWithContentsOfURL:url];
    NSDictionary *propertyListResults = [NSJSONSerialization JSONObjectWithData:jsonResults options:0 error:NULL];

    NSArray *photos = [propertyListResults valueForKeyPath:FLICKR_RESULTS_PHOTOS];
    self.photos = photos;
}

@end
