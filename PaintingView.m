//
//  PaintingView.m
//  FingerPaint
//
//  Created by Rosalyn Kingsmill on 2016-05-13.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "PaintingView.h"
#import "LineSegment.h"
#import "Line.h"

//private header for the implementation
@interface PaintingView()

@property (nonatomic) NSMutableArray <Line*> *lines;
@property (nonatomic) Line *line;

@end
    

@implementation PaintingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

//called by storyboard when view gets called
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        _lines = [[NSMutableArray alloc]init];
        
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    for (Line* line in self.lines) {
        
        UIBezierPath *path = [[UIBezierPath alloc]init];
        [self.line.lineColor setStroke];
        
        path.lineWidth = 10;
       
        
        for (NSInteger i = 0; i < line.segments.count; ++i) {
            
            
            
            LineSegment *seg = line.segments[i];
            if (i == 0) {
                [path moveToPoint:seg.begin];
            }
            [path addLineToPoint:seg.begin];
            [path addLineToPoint:seg.end];
            
        }
        [path stroke];
        
    }
    
    
    // Drawing code
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    _line = [Line new];
    self.line.lineColor = self.brushColor;
    [self.lines addObject:self.line];

}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //gives one touch (wrapper for coordinates)
    UITouch *touch = [touches anyObject];
    CGPoint previous = [touch previousLocationInView:self];
    CGPoint current = [touch locationInView:self];
    LineSegment *lineSegment = [[LineSegment alloc]initWithBegin:previous end:current];
    [self.line.segments addObject:lineSegment];
    [self setNeedsDisplay];
}


@end
