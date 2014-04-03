#import "ArticlesViewController.h"

@interface ArticlesViewController ()

@end

@implementation ArticlesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //editing Label Title
    [super viewDidLoad];
    [self.chapterName initWithFrame:CGRectMake(0, 0, 0, 0)].text = _chapterNameString;
    _chapterName.numberOfLines=0;
    _chapterName.textColor = [UIColor blueColor];
    [_chapterName sizeToFit];
    [self.view addSubview:_chapterName];
    
    
    //editing Text
    NSString *path = [[[MALocalizationSystem sharedLocalizationSystem]getBundle] pathForResource:self.navigationItem.title ofType:@"txt"];
    
    _content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    _chapterText.text=_content;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
