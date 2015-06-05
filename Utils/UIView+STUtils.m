//
//  UIView+STUtils.m
//  STUtils
//
//  Created by zhenlintie on 15/6/3.
//  Copyright (c) 2015年 sTeven. All rights reserved.
//

#import "UIView+STUtils.h"

CGSize st_screenSize(){
    return [UIScreen mainScreen].bounds.size;
}

CGFloat st_screenWidth(){
    return st_screenSize().width;
}

CGFloat st_screenHeight(){
    return st_screenSize().height;
}

CGSize st_size(CGFloat w, CGFloat h){
    return CGSizeMake(w, h);
}

CGRect st_rect(CGFloat x, CGFloat y, CGFloat w, CGFloat h){
    return CGRectMake(x, y, w, h);
}

CGRect st_bounds(CGFloat w, CGFloat h){
    return st_rect(0, 0, w, h);
}

@implementation UIView (STUtils)

#pragma mark - getter

- (CGFloat)width{
    return CGRectGetWidth(self.frame);
}

- (CGFloat)height{
    return CGRectGetHeight(self.frame);
}

- (CGFloat)top{
    return CGRectGetMinY(self.frame);
}

- (CGFloat)bottom{
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)left{
    return CGRectGetMinX(self.frame);
}

- (CGFloat)right{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)inScreenViewX {
    return CGRectGetMinX([self inScreenFrame]);
}

- (CGFloat)inScreenViewY {
    return CGRectGetMinY([self inScreenFrame]);
}

- (CGRect)inScreenFrame {
    if (!self.superview){
        return self.frame;
    }
    return [[[UIApplication sharedApplication] keyWindow] convertRect:self.frame fromView:self.superview];
}

- (CGPoint)origin {
    return self.frame.origin;
}


- (CGSize)size {
    return self.frame.size;
}

#pragma mark - setter

- (void)setWidth:(CGFloat)width{
    CGRect newFrame = self.frame;
    newFrame.size.width = width;
    self.frame = newFrame;
}

- (void)setHeight:(CGFloat)height{
    CGRect newFrame = self.frame;
    newFrame.size.height = height;
    self.frame = newFrame;
}

- (void)setTop:(CGFloat)top{
    CGRect newFrame = self.frame;
    newFrame.origin.y = top;
    self.frame = newFrame;
}

- (void)setBottom:(CGFloat)bottom{
    CGRect newFrame = self.frame;
    newFrame.origin.y = bottom-CGRectGetMinY(newFrame);
    self.frame = newFrame;
}

- (void)setLeft:(CGFloat)left{
    CGRect newFrame = self.frame;
    newFrame.origin.x = left;
    self.frame = newFrame;
}

- (void)setRight:(CGFloat)right{
    CGRect newFrame = self.frame;
    newFrame.origin.x = right-CGRectGetMinX(newFrame);
    self.frame = newFrame;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

@end

UIImage *st_snapshotForViewWithRatio(UIView *view, CGFloat ratio){
    UIImage *img;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake((view.bounds.size.width)*(1+ratio), (view.bounds.size.height)*(1+ratio)), YES, 0.0);
    [view drawViewHierarchyInRect:CGRectInset(view.bounds, -CGRectGetWidth(view.bounds)*ratio, -CGRectGetHeight(view.bounds)*ratio) afterScreenUpdates:YES];
//    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

extern UIImage *st_snapshot(){
    return [[UIApplication sharedApplication].keyWindow snapshot];
}

@implementation UIView (ST_Snapshot)

- (UIImageView *)snapshotImageView{
    return [[UIImageView alloc] initWithImage:[self snapshot]];
}

- (UIImage *)snapshotInsetRatio:(CGFloat)ratio{
    return st_snapshotForViewWithRatio(self, ratio);
}

- (UIImage *)snapshot{
    return [self snapshotInsetRatio:0];
}

@end

UIView *st_blurView(CGRect frame, UIBarStyle style){
    UIToolbar *tool = [[UIToolbar alloc] initWithFrame:frame];
    tool.translucent = YES;
    tool.barStyle = style;
    return tool;
}

UIView *st_lightBlurView(CGRect frame){
    return st_blurView(frame, UIBarStyleDefault);
}

UIView *st_darkBlurView(CGRect frame){
    return st_blurView(frame, UIBarStyleBlackTranslucent);
}

UIImageView *st_BackgroundBlur(UIImage *image, UIView *blurView){
    if (blurView && image){
        UIImageView *imv = [[UIImageView alloc] initWithFrame:blurView.frame];
        blurView.frame = imv.bounds;
        imv.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        imv.image = image;
        [imv addSubview:blurView];
        return imv;
    }
    return nil;
}







