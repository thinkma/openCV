//
//  ViewController.m
//  OpencvFace
//
//  Created by Apple on 14-10-26.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "ViewController.h"
#import <opencv2/highgui/cap_ios.h>
#import <opencv2/imgproc/imgproc_c.h>
#include <opencv2/imgproc/imgproc.hpp>


using namespace cv;

@interface ViewController ()<CvVideoCameraDelegate>
{

    
}

@property (nonatomic,retain)CvVideoCamera *videoCamera;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.videoCamera = [[CvVideoCamera alloc] initWithParentView:_imageView];
    self.videoCamera.delegate = self;
    self.videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront;
    self.videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset352x288;
    self.videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.videoCamera.defaultFPS = 30;
    self.videoCamera.grayscaleMode = NO;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)processImage:(cv::Mat &)image
{
    // Do some OpenCV stuff with the image
    Mat image_copy;
    cvtColor(image, image_copy, CV_BGRA2BGR);
    
    // invert image
    bitwise_not(image_copy, image_copy);
    cvtColor(image_copy, image, CV_BGR2BGRA);
    
// h ttp://stackoverflow.com/questions/16032845/opencv2-cvtcolor-does-not-work
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickCreamButton:(id)sender {
    
    [self.videoCamera start];
    
}
@end
