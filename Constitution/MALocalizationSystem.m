#import "MALocalizationSystem.h"

@implementation MALocalizationSystem

static NSBundle *bundle = nil;
static NSString *_currentLanguage = nil;


+(MALocalizationSystem *) sharedLocalizationSystem{
    static dispatch_once_t pred;
    static MALocalizationSystem *_sharedLocalizationSystem = nil;
    dispatch_once(&pred, ^{
        _sharedLocalizationSystem= [[super alloc] initUniqueInstance];
    });
    return _sharedLocalizationSystem;
}

-(MALocalizationSystem *) initUniqueInstance {
    bundle=[[NSBundle alloc]init];
    bundle = [NSBundle mainBundle];
    return [super init];
}

- (void) resetLocalization
{
    bundle = [NSBundle mainBundle];
    _currentLanguage =nil;
}

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment
{
    return [bundle localizedStringForKey:key value:comment table:nil];
}

#pragma mark Accessory Methods
- (void) setLanguage:(NSString*) lang
{
    if (_currentLanguage && [lang isEqualToString:_currentLanguage])
    {
        return;
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:lang ofType:@"lproj"];
    _currentLanguage = lang;
    
    if (path == nil)
    {
        [self resetLocalization];
    }
    else
    {
        bundle = [NSBundle bundleWithPath:path];
    }
}

- (NSString*) getLanguage
{
    if (!_currentLanguage)
    {
        NSArray* languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        _currentLanguage =      [languages objectAtIndex:0];
        NSString *path = [[NSBundle mainBundle] pathForResource:_currentLanguage ofType:@"lproj"];
        
        if (path == nil)
        {
            [self resetLocalization];
            _currentLanguage = @"en";
        }
    }
    
    return _currentLanguage;
}


- (NSBundle *) getBundle{
    return bundle;
}

@end


