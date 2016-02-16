//
//  Tupac.h
//  tupac
//
//  Created by Mark Onyschuk on 11-09-09.
//  Copyright 2011 Zynga Toronto, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    kTupacImageFormatPNG,
    kTupacImageFormatPNG_8BIT,
    kTupacImageFormatPVR_RGBA8888,
    kTupacImageFormatPVR_RGBA4444,
    kTupacImageFormatPVR_RGB565,
    kTupacImageFormatPVRTC_4BPP,
    kTupacImageFormatPVRTC_2BPP,
    kTupacImageFormatWEBP
};

@interface Tupac : NSObject 

@property(nonatomic) BOOL border;
@property(nonatomic) CGFloat scale;
@property(nonatomic, copy) NSArray *filenames;
@property(nonatomic, copy) NSString *outputName;
@property(nonatomic, copy) NSString *outputFormat;
@property(nonatomic,assign) int imageFormat;
@property(nonatomic,copy) NSString* directoryPrefix;
@property(nonatomic,assign) int maxTextureSize;
@property(nonatomic,assign) int padding;
@property(nonatomic,assign) BOOL dither;
@property(nonatomic,assign) BOOL compress;
@property(nonatomic,assign) int packAlgorithm;
@property(nonatomic,assign) BOOL npot;
@property(nonatomic,assign) int nColors;

+ (Tupac*) tupac;

- (BOOL) createTextureAtlasFromDirectoryPaths:(NSArray *)dirs;
- (BOOL)createTextureAtlas;

@end

extern NSString *TupacOutputFormatCocos2D;
extern NSString *TupacOutputFormatAndEngine;
