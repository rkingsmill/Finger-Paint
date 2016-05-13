//
//  LineSegment.h
//  FingerPaint
//
//  Created by Rosalyn Kingsmill on 2016-05-13.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//


@import UIKit ;
@interface LineSegment : NSObject

@property (nonatomic) CGPoint begin;
@property (nonatomic) CGPoint end;


-(instancetype)initWithBegin:(CGPoint)begin end:(CGPoint)end;

@end
