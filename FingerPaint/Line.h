//
//  Line.h
//  FingerPaint
//
//  Created by Rosalyn Kingsmill on 2016-05-14.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LineSegment.h"

@interface Line : NSObject

@property UIColor *lineColor;
@property NSMutableArray <LineSegment*> *segments;

@end
