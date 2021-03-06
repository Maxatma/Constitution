#import "LanguageView.h"

@implementation LanguageView

#pragma mark - Button Methods

- (IBAction)enButtonPressed:(UIButton*)sender {
    [self choosedButton:sender];
    [self presentLocalizedStoryboard:@"en"];
}

- (IBAction)ruButtonPressed:(UIButton*)sender {
    [self choosedButton:sender];
    [self presentLocalizedStoryboard:@"ru"];
}

- (IBAction)ukButtonPressed:(UIButton*)sender {
    [self choosedButton:sender];
    [self presentLocalizedStoryboard:@"uk"];
}
#pragma mark -

- (void)viewDidLoad
{
    UIImage *normalButtonImage = [UIImage imageNamed:@"tick_2.png"];

    [ _enButton setBackgroundImage:normalButtonImage forState:UIControlStateNormal];
    [ _ruButton setBackgroundImage:normalButtonImage forState:UIControlStateNormal];
    [ _ukButton setBackgroundImage:normalButtonImage forState:UIControlStateNormal];
  
    if ([MALocalizationGetLanguage isEqualToString:@"en"]) {
        [self choosedButton:_enButton];
    }
    if ([MALocalizationGetLanguage isEqualToString:@"ru"] ) {
        [self choosedButton:_ruButton];
    }
    if  ([MALocalizationGetLanguage isEqualToString:@"uk"] ) {
        [self choosedButton:_ukButton];
    }

    
    [super viewDidLoad];
}


#pragma mark - Support Methods

- (void)choosedButton:(UIButton *)ourButton{
    
    UIImage *tickButtonImage = [UIImage imageNamed:@"tick.png"];
    [ourButton setBackgroundImage:tickButtonImage forState:UIControlStateNormal];
}

-(void) presentLocalizedStoryboard:(NSString*)lang{
    
    if (![MALocalizationGetLanguage isEqualToString:lang]) {
        
        MALocalizationSetLanguage(lang);
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[[MALocalizationSystem sharedLocalizationSystem] getBundle] ];
        [self presentViewController:[sb instantiateInitialViewController] animated:YES completion:NULL];
    }
    
}



@end
