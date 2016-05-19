//
//  ViewController.m
//  POPingAnimation
//
//  Created by pro on 16/5/19.
//  Copyright © 2016年 Goyakod. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //CoreImage
    
    //导入图片
    CIImage *ciImage = [[CIImage alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    
    //创建滤镜
    CIFilter *filterOne = [CIFilter filterWithName:@"CIPixellate"];
    [filterOne setValue:ciImage forKey:kCIInputImageKey];
    [filterOne setDefaults];
    CIImage *outImage = [filterOne valueForKey:kCIOutputImageKey];
    
    CIFilter *filterTwo = [CIFilter filterWithName:@"CIHueAdjust"];
    [filterTwo setValue:outImage forKey:kCIInputImageKey];
    //[filterTwo setDefaults];//色调滤镜默认不改变
    //设置滤镜的参数
    [filterTwo setValue:@(1.f) forKey:kCIInputAngleKey];
    
    CIImage *outputImage = [filterTwo valueForKey:kCIOutputImageKey];
    
    //CIContext渲染
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CGImageRef cgImage = [context createCGImage:outputImage fromRect:[outImage extent]];
    
    //导出图片
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:imageView];
    
}


@end








