//
//  ImageFrameScheduler.h
//  ImageFrameScheduler
//
//  Created by Toomas Vahter on 26.08.2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageFrameScheduler: NSObject

- (instancetype)initWithURL:(NSURL *)imageURL;

@property (readonly) NSURL *imageURL;

- (BOOL)startWithFrameHandler:(void (^)(NSInteger, CGImageRef))handler;
- (void)stop;

@end

NS_ASSUME_NONNULL_END
