#import <UIKit/UIKit.h>
#import "MALocalizationSystem.h"

@interface ArticlesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *chapterNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *chapterText;

@property (weak,nonatomic) NSString *chapterTitleName;
@property (weak,nonatomic) NSString *content;
@property (weak,nonatomic) NSString *chapterFileName;

@end
