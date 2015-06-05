//
//  UIImage+STUtils.h
//  STUtils
//
//  Created by zhenlintie on 15/6/4.
//  Copyright (c) 2015年 sTeven. All rights reserved.
//

#import <UIKit/UIKit.h>


// 根据颜色生成图片
extern UIImage *st_imageWithColor(UIColor *color);

// 根据名字获取图片
extern UIImage *st_imageNamed(NSString *imageName);


@interface UIImage (STUtils)

@property (nonatomic, readonly) CGFloat width;
@property (nonatomic, readonly) CGFloat height;

// 调整方向
- (UIImage *)fixOrientation;

// 改变尺寸
- (UIImage *)resized:(CGSize)size;// scale=self.scale
- (UIImage *)resized:(CGSize)size scale:(CGFloat)scale;
- (UIImage *)resizedFitWidth:(CGFloat)width;
- (UIImage *)resizedFitHeight:(CGFloat)height;

@end

@interface UIImage (ST_ImageEffects)

- (UIImage *)st_applyLightEffect;
- (UIImage *)st_applyExtraLightEffect;
- (UIImage *)st_applyDarkEffect;
- (UIImage *)st_applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)st_applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

@end
