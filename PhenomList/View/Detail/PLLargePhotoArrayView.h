//
//  PLLargePhotoArray.h
//  PhenomList
//
//  Created by Joe Taylor on 2/20/12.
//  Copyright (c) 2012 Blackboard Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PLLargePhotoArrayView : UIView
{
    NSMutableArray *image_Urls;
    NSMutableArray *imageViews;
}

@property(nonatomic, strong) NSMutableArray *imageUrls;

-(id)initWithURLs: (NSArray *)photos;

@end
