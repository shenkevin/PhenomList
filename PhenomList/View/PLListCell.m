//
//  PLTableCell.m
//  PhenomList
//
//  Created by Joe Taylor on 1/17/12.
//  Copyright (c) 2012 Blackboard Mobile. All rights reserved.
//

#import "PLListCell.h"

#import "PLImageHelper.h"

@interface PLListCell (private)

- (void)setColorsForActive:(BOOL)active;

@end

@implementation PLListCell

- (id)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle andImages:(NSArray *)imageArray
{
	if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"])
	{
        
        image_width = 60;
        
        // Set title
        self.textLabel.text = title;
		
		// Set subtitle
		self.detailTextLabel.text = subtitle;
        
        // Make Multiline
        self.textLabel.numberOfLines = 2;
        
        // Make Font Smaller so it fits
        self.textLabel.font = [UIFont boldSystemFontOfSize: 16.0];
        
        // Custom BG
        //self.textLabel.backgroundColor = [UIColor redColor];        
		//self.detailTextLabel.backgroundColor = [UIColor blueColor];
        self.backgroundView = [[UIImageView alloc] initWithImage:[PLImageHelper listCellImage]];
        
        // Set selection color
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[PLImageHelper listCellSelectedImage]];
        
        self.textLabel.highlightedTextColor = [UIColor whiteColor];
        
	}
	return self;
}

- (void)loadView
{
    
}

- (void)layoutSubviews 
{    
    [super layoutSubviews];
	// getting the cell size
    CGRect contentRect = self.contentView.bounds;
	
    if (!self.editing) {
		
		// get the X pixel spot
        CGFloat boundsX = contentRect.origin.x;
		CGRect frame;
        
        /*
		 Place the title label.
		 place the label whatever the current X is plus 60 pixels from the left
		 center the text verticly
		 make the label 200 pixels wide
		 make the label 20 pixels high
         */
        
		frame = CGRectMake(boundsX + image_width, 0, self.frame.size.width - (image_width + 10), self.frame.size.height / 2.0);
		self.textLabel.frame = frame;
		
		self.detailTextLabel.frame = CGRectMake(frame.origin.x, CGRectGetMaxY(frame) + 10, frame.size.width, frame.size.height);
	}
}

- (void)setColorsForActive:(BOOL)active
{
    self.textLabel.shadowColor = active ? [UIColor darkGrayColor] : [UIColor whiteColor];;
    self.textLabel.shadowOffset = active ? CGSizeMake(0, -0.5) : CGSizeMake(0, 0.5);
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animate
{
    [super setHighlighted:highlighted animated:animate];
    
    [self setColorsForActive:highlighted];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    [self setColorsForActive:selected];
}


@end
