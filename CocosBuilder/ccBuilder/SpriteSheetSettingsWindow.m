//
//  SpriteSheetSettingsWindow.m
//  CocosBuilder
//
//  Created by Viktor Lidholt on 12/19/12.
//
//

#import "SpriteSheetSettingsWindow.h"
#import "Tupac.h"

@interface SpriteSheetSettingsWindow ()

@end

@implementation SpriteSheetSettingsWindow

@synthesize packAlgorithm;
@synthesize textureFileFormat;
@synthesize compress;
@synthesize dither;
@synthesize nColors;
@synthesize npot;
@synthesize textureFileFormatAndroid;
@synthesize ditherAndroid;
@synthesize nColorsAndroid;
@synthesize textureFileFormatHTML5;
@synthesize nColorsHTML5;
@synthesize iOSEnabled;
@synthesize androidEnabled;
@synthesize HTML5Enabled;
@synthesize ditherHTML5;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (!self) return NULL;
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    [self updateIOSSettings:nil];
    [self updateAndroidSettings:nil];
    [self updateHTML5Settings:nil];
}



- (IBAction)updateIOSSettings:(NSPopUpButton *)sender {
    BOOL compressEnabled = [self isCompressable:textureFileFormat] && iOSEnabled;
    [iosCompress setEnabled:compressEnabled];
    if(!compressEnabled){
        [iosCompress setState:NSOffState];
    }
    
    BOOL ditherEnabled = [self isDitherable:textureFileFormat] && iOSEnabled;
    [iosDither setEnabled:ditherEnabled];
    if(!ditherEnabled){
        [iosDither setState:NSOffState];
    }
    
    BOOL is8BitPNG = (textureFileFormat == kTupacImageFormatPNG_8BIT);
    [iosNColors setEnabled:is8BitPNG];
}

- (IBAction)updateAndroidSettings:(NSPopUpButton *)sender {
    BOOL ditherEnabled = [self isDitherable:textureFileFormatAndroid] && androidEnabled;
    [androidDither setEnabled:ditherEnabled];
    if(!ditherEnabled){
        [androidDither setState:NSOffState];
    }
    
    BOOL is8BitPNG = (textureFileFormatAndroid == kTupacImageFormatPNG_8BIT);
    [androidNColors setEnabled:is8BitPNG];
}

- (IBAction)updateHTML5Settings:(NSPopUpButton *)sender {
    BOOL ditherEnabled = [self isDitherable:textureFileFormatHTML5] && HTML5Enabled;
    [HTML5Dither setEnabled:ditherEnabled];
    if(!ditherEnabled){
        [HTML5Dither setState:NSOffState];
    }
    
    BOOL is8BitPNG = (textureFileFormatHTML5 == kTupacImageFormatPNG_8BIT);
    [HTML5NColors setEnabled:is8BitPNG];
}

- (BOOL)isCompressable:(int)textureFomat {
    return (textureFomat >= kTupacImageFormatPVR_RGBA8888 && textureFomat <= kTupacImageFormatPVRTC_2BPP);
}

- (BOOL)isDitherable:(int)textureFomat {
    return ((textureFomat == kTupacImageFormatPVR_RGBA4444) || (textureFomat == kTupacImageFormatPVR_RGB565) || (textureFomat == kTupacImageFormatPNG_8BIT));
}
@end
