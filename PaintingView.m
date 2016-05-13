//
//  PaintingView.m
//  FingerPaint
//
//  Created by Rosalyn Kingsmill on 2016-05-13.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "PaintingView.h"
#import "LineSegment.h"

//private header for the implementation
@interface PaintingView()

@property (nonatomic) NSMutableArray <NSMutableArray*> *lines;
@property (nonatomic) NSMutableArray <LineSegment*> *line;

@end
    



@implementation PaintingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

//called by storyboard when view gets called
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        _lines = [[NSMutableArray alloc]init];
//        _line = [[NSMutableArray alloc]init];
        
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    for (NSArray* line in self.lines) {
        
        UIBezierPath *path = [[UIBezierPath alloc]init];
        [[UIColor redColor] setStroke];
        path.lineWidth = 10;
        
        
        
        
        for (NSInteger i = 0; i < line.count; ++i) {
            LineSegment *seg = line[i];
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
    
    _line = [[NSMutableArray alloc]init];
    
    [self.lines addObject:self.line];

}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //gives one touch (wrapper for coordinates)
    UITouch *touch = [touches anyObject];
    CGPoint previous = [touch previousLocationInView:self];
    CGPoint current = [touch locationInView:self];
    LineSegment *lineSegment = [[LineSegment alloc]initWithBegin:previous end:current];
    [self.line addObject:lineSegment];
    [self setNeedsDisplay];
}

@end
