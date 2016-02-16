//
//  SpriteSheetSettingsWindow.h
//  CocosBuilder
//
//  Created by Viktor Lidholt on 12/19/12.
//
//

#import "CCBModalSheetController.h"

@interface SpriteSheetSettingsWindow : CCBModalSheetController
{
    int packAlgorithm;
    int textureFileFormat;
    BOOL npot;
    BOOL compress;
    BOOL dither;
    int cColors;
    int  textureFileFormatAndroid;
    BOOL ditherAndroid;
    int cColorsAndroid;
    int  textureFileFormatHTML5;
    BOOL ditherHTML5;
    int cColorsHTML5;
    
    IBOutlet NSButton *iosDither;
    IBOutlet NSButton *iosCompress;
    IBOutlet NSSlider *iosNColors;
    IBOutlet NSButton *androidDither;
    IBOutlet NSSlider *androidNColors;
    IBOutlet NSButton *HTML5Dither;
    IBOutlet NSSlider *HTML5NColors;
    
    BOOL iOSEnabled;
    BOOL androidEnabled;
    BOOL HTML5Enabled;

}

@property (nonatomic,assign) int packAlgorithm;
@property (nonatomic,assign) int textureFileFormat;
@property (nonatomic,assign) BOOL npot;
@property (nonatomic,assign) BOOL compress;
@property (nonatomic,assign) BOOL dither;
@property (nonatomic,assign) int nColors;
@property (nonatomic,assign) int textureFileFormatAndroid;
@property (nonatomic,assign) BOOL ditherAndroid;
@property (nonatomic,assign) int nColorsAndroid;
@property (nonatomic,assign) int textureFileFormatHTML5;
@property (nonatomic,assign) BOOL ditherHTML5;
@property (nonatomic,assign) int nColorsHTML5;
@property (nonatomic,assign) BOOL iOSEnabled;
@property (nonatomic,assign) BOOL androidEnabled;
@property (nonatomic,assign) BOOL HTML5Enabled;


- (IBAction)updateIOSSettings:(NSPopUpButton *)sender;
- (IBAction)updateAndroidSettings:(NSPopUpButton *)sender;
- (IBAction)updateHTML5Settings:(NSPopUpButton *)sender;

@end
