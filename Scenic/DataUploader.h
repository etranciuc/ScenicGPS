//
//  DataUploader.h
//  Scenic
//
//  Created by Dan Lynch on 4/24/11.
//  Copyright 2011 UC Berkeley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

@interface DataUploader : NSObject <ASIHTTPRequestDelegate> {
    
}

- (void) uploadImage: (UIImage*) image;
- (void) uploadFile: (NSURL*) file;

@end