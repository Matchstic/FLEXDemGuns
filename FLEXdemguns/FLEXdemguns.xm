/*
 * FLEX in apps n' stuff.
 *
 * BSD 2-Clause
 *
 * Matt Clarke (Matchstic) 2017
 */

#import "FLEXDGLaunchListener.h"

static NSDictionary *settings;
static FLEXDGLaunchListener *listener;

%hook FLEXWindow

%new
- (bool)_shouldCreateContextAsSecure {
    // Makes us handle the lockscreen passcode nicely.
    return YES;
}

%end

%ctor {
    // I am very lazy and don't want to do this during the lifetime of the application.
    CFPreferencesAppSynchronize(CFSTR("com.matchstic.flexdemguns"));
    settings = (__bridge NSDictionary *)CFPreferencesCopyMultiple(CFPreferencesCopyKeyList(CFSTR("com.matchstic.flexdemguns"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost), CFSTR("com.matchstic.flexdemguns"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    
    NSString *currentBundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    id thing = [settings objectForKey:[NSString stringWithFormat:@"AppList-%@", currentBundleIdentifier]];
    
    BOOL enabled = thing ? [thing boolValue] : NO;
    
    if (enabled) {
        listener = [[FLEXDGLaunchListener alloc] init];
        %init;
    }
}
