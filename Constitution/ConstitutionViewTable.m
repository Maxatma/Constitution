#import "ConstitutionViewTable.h"

@interface ConstitutionViewTable ()

@end

@implementation ConstitutionViewTable


- (void)viewDidLoad{
    [super viewDidLoad];
    titleString = MALocalizedString(@"Title", @"");
    NSString *path =[MALocalizationGetBundle pathForResource:@"Titles" ofType:@"plist"];
	_titlesArray = [[NSArray alloc] initWithContentsOfFile:path];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_titlesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }


    NSString *titlesText = [NSString stringWithFormat:@"%@ %i",titleString,indexPath.row+1];

    cell.detailTextLabel.text=[self.titlesArray objectAtIndex:indexPath.row];
    cell.textLabel.text = titlesText;
    return cell;
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"showTitleText"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ArticlesViewController *destViewController = segue.destinationViewController;
        NSString *titlesText = [NSString stringWithFormat:@"%@ %i",titleString,indexPath.row+1];
        destViewController.navigationItem.title=titlesText;
        destViewController.chapterTitleName=[self.titlesArray objectAtIndex:indexPath.row ];
        destViewController.chapterFileName = [NSString stringWithFormat:@"Chapter %i",indexPath.row+1];
    }
}



@end
