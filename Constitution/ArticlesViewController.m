#import "ArticlesViewController.h"

@interface ArticlesViewController ()

@end

@implementation ArticlesViewController



- (void)viewDidLoad{
    
    //editing Label Title
    [super viewDidLoad];
    [self.chapterNameLabel initWithFrame:CGRectMake(0, 0, 0, 0)].text = _chapterTitleName;
    _chapterNameLabel.numberOfLines=0;
    _chapterNameLabel.textColor = [UIColor blueColor];
    [_chapterNameLabel sizeToFit];
    [self.view addSubview:_chapterNameLabel];
    
    
    //Text
    NSString *path = [MALocalizationGetBundle pathForResource:_chapterFileName ofType:@"txt"];
    
    _content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    _chapterText.text=_content;
    
}

@end
