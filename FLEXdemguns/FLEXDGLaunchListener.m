//
//  FLEXDGLaunchListener.m
//  FLEXdemguns
//
//  Created by Matt Clarke on 30/01/2017.
//
//

#import "FLEXDGLaunchListener.h"
#import <UIKit/UIKit.h>
#import "FLEXManager.h"

@implementation FLEXDGLaunchListener

-(instancetype)init {
    self = [super init];
    
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidFinishLaunching:)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:nil];
    }
    
    return self;
}

-(void)applicationDidFinishLaunching:(NSNotification*)notification {
    [[FLEXManager sharedManager] showExplorer];
}

@end
