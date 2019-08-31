//
//  ImageFrameScheduler.m
//  ImageFrameScheduler
//
//  Created by Toomas Vahter on 26.08.2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

#import "ImageFrameScheduler.h"
#import "ImageIO/CGImageAnimation.h" // Xcode 11 beta 7 - CGImageAnimation.h is not in umbrella header IOImage.h

@interface ImageFrameScheduler()
@property (readwrite) NSURL *imageURL;
@property (getter=isStopping) BOOL stopping;
@end

@implementation ImageFrameScheduler

- (instancetype)initWithURL:(NSURL *)imageURL {
    if (self = [super init]) {
        self.imageURL = imageURL;
    }
    return self;
}

- (BOOL)startWithFrameHandler:(void (^)(NSInteger, CGImageRef))handler {
    __weak ImageFrameScheduler *weakSelf = self;
    OSStatus status = CGAnimateImageAtURLWithBlock((CFURLRef)self.imageURL, nil, ^(size_t index, CGImageRef _Nonnull image, bool* _Nonnull stop) {
        handler(index, image);
        *stop = weakSelf.isStopping;
    });
    // See CGImageAnimationStatus for errors
    return status == noErr;
}

- (void)stop {
    self.stopping = YES;
}

@end
