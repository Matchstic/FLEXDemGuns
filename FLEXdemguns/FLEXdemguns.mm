#line 1 "/Users/Matt/iOS/Projects/FLEXdemguns/FLEXdemguns/FLEXdemguns.xm"








#import "FLEXDGLaunchListener.h"

static NSDictionary *settings;
static FLEXDGLaunchListener *listener;


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class FLEXWindow; 
static bool _logos_method$_ungrouped$FLEXWindow$_shouldCreateContextAsSecure(_LOGOS_SELF_TYPE_NORMAL FLEXWindow* _LOGOS_SELF_CONST, SEL); 

#line 14 "/Users/Matt/iOS/Projects/FLEXdemguns/FLEXdemguns/FLEXdemguns.xm"



static bool _logos_method$_ungrouped$FLEXWindow$_shouldCreateContextAsSecure(_LOGOS_SELF_TYPE_NORMAL FLEXWindow* _LOGOS_SELF_CONST self, SEL _cmd) {
    
    return YES;
}



static __attribute__((constructor)) void _logosLocalCtor_432c7a00(int argc, char **argv, char **envp) {
    
    CFPreferencesAppSynchronize(CFSTR("com.matchstic.flexdemguns"));
    settings = (__bridge NSDictionary *)CFPreferencesCopyMultiple(CFPreferencesCopyKeyList(CFSTR("com.matchstic.flexdemguns"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost), CFSTR("com.matchstic.flexdemguns"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    
    NSString *currentBundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    id thing = [settings objectForKey:[NSString stringWithFormat:@"AppList-%@", currentBundleIdentifier]];
    
    BOOL enabled = thing ? [thing boolValue] : NO;
    
    if (enabled) {
        listener = [[FLEXDGLaunchListener alloc] init];
        {Class _logos_class$_ungrouped$FLEXWindow = objc_getClass("FLEXWindow"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'B'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$FLEXWindow, @selector(_shouldCreateContextAsSecure), (IMP)&_logos_method$_ungrouped$FLEXWindow$_shouldCreateContextAsSecure, _typeEncoding); }}
    }
}
