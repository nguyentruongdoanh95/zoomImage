//
//  ViewController.m
//  uiPinch
//
//  Created by Godfather on 6/23/17.
//  Copyright © 2017 Godfather. All rights reserved.
//

#import "ViewController.h"
#import "xxxTableViewCell.h"
#import "UIImage+DoSomething.h"
@interface ViewController () <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *forwardOutlet;

@property (weak, nonatomic) IBOutlet UIButton *previousOutlet;
@property (assign, nonatomic)  float size;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageView.image = [UIImage imageNamed:@"2"];
    self.previousOutlet.hidden = YES;
    [self configureScrollView];
}



- (IBAction)previousAction:(id)sender {
    [self switchMapImage:@"2" forwardOutlet:NO previousOutlet:YES];
}

- (IBAction)forwardAction:(id)sender {
    [self switchMapImage:@"3" forwardOutlet:YES previousOutlet:NO];
    
}
#pragma mark - Configure Before Show
-(void)configureScrollView {
    self.scrollView.minimumZoomScale = 1;
    self.scrollView.maximumZoomScale = 6;
    self.scrollView.contentSize = self.imageView.frame.size;
    self.scrollView.delegate = self;
}

-(void)switchMapImage:(NSString *)imageNamed forwardOutlet:(BOOL)forwardOutlet previousOutlet:(BOOL)previousOutlet{
    [self.view layoutIfNeeded];
    self.imageView.image = [UIImage imageNamed:imageNamed];
    [self.forwardOutlet setHidden:forwardOutlet];
    [self.previousOutlet setHidden:previousOutlet];
    [self resetImageZoom];
}

-(void)resetImageZoom {
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0, 1.0);
    _imageView.transform = transform;
    [self.scrollView setContentSize:CGSizeZero];
    _imageView.center = self.imageView.center;
}

- (void)centerScrollViewContents {
    CGSize boundsSize = self.scrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    
    self.imageView.frame = contentsFrame;
}

#pragma mark - UIScrollViewDelegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}
-(void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self centerScrollViewContents];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDatasource, UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    xxxTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.xxx.image = [[UIImage imageNamed:@"3"] createImage:cell.xxx.bounds.size radius:10 byRoundingCorners:UIRectCornerTopRight | UIRectCornerTopLeft];
    return  cell;
}
@end
