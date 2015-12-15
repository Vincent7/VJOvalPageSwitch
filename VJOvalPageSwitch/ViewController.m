//
//  ViewController.m
//  VJOvalPageSwitch
//
//  Created by Vincent on 15/12/15.
//  Copyright © 2015年 Vincent. All rights reserved.
//

#import "ViewController.h"
#import "VJBiggerPageControlView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet VJBiggerPageControlView *pageControl;
@end

@implementation ViewController

-(void)viewDidLayoutSubviews{
    
    self.pageControl.selectedPageIndex = 0;
    self.pageControl.pageNumber = 6;
    self.pageControl.pageControlMarginX = self.view.bounds.size.width/3;
    self.pageControl.currentOvalSize = CGSizeMake(10, 10);
    [self.pageControl configPageOvalLayer];
    [self.pageControl animateToIndex:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnTapped:(id)sender {
    NSInteger nextPage = self.pageControl.selectedPageIndex + 1;
    if (nextPage >= self.pageControl.pageNumber) {
        nextPage = 0;
    }
    [self.pageControl animateToIndex:nextPage];
}
@end
