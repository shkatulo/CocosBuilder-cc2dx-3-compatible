/*
 * CocosBuilder: http://www.cocosbuilder.com
 *
 * Copyright (c) 2012 Zynga Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "CCBPCCBFile.h"
#import "ResourceManager.h"
#import "CCBReaderInternal.h"
#import "CCBGlobals.h"
#import "CCBDocument.h"
#import "CocosBuilderAppDelegate.h"
#import "CCNode+NodeInfo.h"
#import "PlugInNode.h"

@implementation CCBPCCBFile

@synthesize ccbFile;

- (id) init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void) setCcbFile:(CCNode *)cf
{
    if (ccbFile) {
        cf.customProperties = ccbFile.customProperties;
    }
    ccbFile = cf;
    
    [self removeAllChildrenWithCleanup:YES];
    if (cf)
    {
        [self addChild:cf];
        self.contentSize = ccbFile.contentSize;
        cf.anchorPoint = ccp(0,0);
        
//        self.anchorPoint = ccbFile.anchorPoint;
//        self.ignoreAnchorPointForPosition = ccbFile.ignoreAnchorPointForPosition;
    }
    else
    {
        self.contentSize = CGSizeZero;
        self.anchorPoint = ccp(0,0);
        self.ignoreAnchorPointForPosition = NO;
    }
}

//- (id) extraPropForKey:(NSString *)key
//{
//    if ([key isEqualToString:@"customClass"] && ccbFile)
//    {
//        return [ccbFile extraPropForKey:@"customClass"];
//    }
//    else
//    {
//        return [super extraPropForKey:key];
//    }
//}

- (void)setUserObject:(id)userObject {
    [super setUserObject:userObject];
    [self setExtraProp:self.plugIn.nodeClassName forKey:@"customClass"];
}

- (void)loadCustomPropertyValuesFromSerialization:(id)ser {
    [super loadCustomPropertyValuesFromSerialization:ser];
    [self setExtraProp:self.plugIn.nodeClassName forKey:@"customClass"];
}

- (void) setExtraProp:(id)prop forKey:(NSString *)key {
    if ([key isEqualToString:@"customClass"])
        prop = self.plugIn.nodeClassName;
    
    [super setExtraProp:prop forKey:key];
}





- (NSMutableArray*) customProperties
{
    if (!ccbFile) return [NSMutableArray array];
    
    return [ccbFile customProperties];
}


- (void) setCustomProperties:(NSMutableArray *)customProperties {
    if (!ccbFile) [super setCustomProperties:customProperties];
    
    [ccbFile setCustomProperties:customProperties];
}

@end
