//
//  LineSegment.m
//  FingerPaint
//
//  Created by Rosalyn Kingsmill on 2016-05-13.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "LineSegment.h"

@implementation LineSegment

-(instancetype)initWithBegin:(CGPoint)begin end:(CGPoint)end {
    
    if (self = [super init]) {
        
        _begin = begin;
        _end = end;
        
    }
    
    return self;
}

@end
