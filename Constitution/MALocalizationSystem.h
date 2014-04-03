#import <Foundation/Foundation.h>

@interface MALocalizationSystem : NSObject

+ (MALocalizationSystem *) sharedLocalizationSystem;
// следующие объявления сгенерируют compile time ошибки при попытке их вызвать вручную.
// добавляем -copyWithZone: -allocWithZone: -copy по вкусу
+(MALocalizationSystem *) alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));
-(MALocalizationSystem *) init __attribute__((unavailable("init not available, call sharedInstance instead")));
+(MALocalizationSystem *) new __attribute__((unavailable("new not available, call sharedInstance instead")));

- (NSString *) localizedStringForKey:(NSString *)key value:(NSString *)comment;
- (void) setLanguage:(NSString *) language;
- (NSString *) getLanguage;
- (void) resetLocalization;
- (NSBundle *) getBundle;

@end

#define MALocalizedString(key, comment) [[MALocalizationSystem sharedLocalizationSystem] localizedStringForKey:(key) value:(comment)]

#define MALocalizationSetLanguage(language) [[MALocalizationSystem sharedLocalizationSystem] setLanguage:(language)]

#define MALocalizationGetLanguage [[MALocalizationSystem sharedLocalizationSystem] getLanguage]

