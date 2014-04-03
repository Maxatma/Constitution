#import <UIKit/UIKit.h>
#import "MALocalizationSystem.h"

@interface ArticlesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *chapterName;
@property (weak,nonatomic) NSString *chapterNameString;
@property (weak, nonatomic) IBOutlet UITextView *chapterText;
@property (weak,nonatomic) NSString *content;

@end
