//
//  TableCell.m
//  Scenic
//
//  Created by Dan Lynch on 3/10/11.
//  Copyright 2011 UC Berkeley. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell
@synthesize primaryLabel,secondaryLabel,myImageView, mEditButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		primaryLabel = [[UILabel alloc]init];
		primaryLabel.textAlignment = UITextAlignmentLeft;
		primaryLabel.font = [UIFont systemFontOfSize:16];
		secondaryLabel = [[UILabel alloc]init];
		secondaryLabel.textAlignment = UITextAlignmentLeft;
		secondaryLabel.font = [UIFont systemFontOfSize:12];
		myImageView = [[UIImageView alloc]init];
        mEditButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        
		[self.contentView addSubview:primaryLabel];
		[self.contentView addSubview:secondaryLabel];
		[self.contentView addSubview:myImageView];
        [self.contentView addSubview:mEditButton];
    }
    return self;
}


- (void)layoutSubviews {
	[super layoutSubviews];
	CGRect contentRect = self.contentView.bounds;
	CGFloat boundsX = contentRect.origin.x;
	CGRect frame;
	frame= CGRectMake(boundsX+10 ,0, 50, 50);
	myImageView.frame = frame;
	
	frame= CGRectMake(boundsX+70 ,5, 200, 25);
	primaryLabel.frame = frame;

    
	frame= CGRectMake(boundsX+70 ,30, 200, 15);
	secondaryLabel.frame = frame;
    
    frame= CGRectMake(boundsX+270 ,0, 50, 50);
    mEditButton.frame = frame;
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	
    [super setSelected:selected animated:animated];
	
    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}


@end
