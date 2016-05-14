//
//  ViewController.m
//  FingerPaint
//
//  Created by Rosalyn Kingsmill on 2016-05-13.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "ViewController.h"
#import "LineSegment.h"
#import "PaintingView.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet PaintingView *paintingView;





@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.paintingView.brushColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)indexChanged:(UISegmentedControl*)sender {

    
    {
        switch (sender.selectedSegmentIndex)
        {
            case 0:
                self.paintingView.brushColor = [UIColor redColor];
                break;
                
            case 1:
                self.paintingView.brushColor = [UIColor blueColor];
                break;
                
            case 2:
                self.paintingView.brushColor = [UIColor greenColor];
                break;
                
            case 3:
                self.paintingView.brushColor = [UIColor yellowColor];
                break;
                
            default:
                break; 
        } 
    }
}


@end

