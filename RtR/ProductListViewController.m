//
//  ProductListViewController.m
//  RtR-MD
//
//  Created by Jay on 6/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "ProductListViewController.h"
#import "DetailViewController.h"
#import "Product.h"
#import "Designer.h"
#import "Model.h"

@interface ProductListViewController (){
    NSMutableArray *gProductsArray;
    Designer *gDesigner;
}
@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTitle:gDesigner.designerName];
    gProductsArray = [[[[Model sharedinstance] products] value] objectForKey:gDesigner.designerName];
}

- (void)setDesigner:(Designer *)designer {
    gDesigner = designer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showProductDetail"]) {
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setProduct:gProductsArray[[self.tableView indexPathForSelectedRow].row]];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [gProductsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
    cell.textLabel.text = [(Product *)gProductsArray[indexPath.row] displayName];
    
    return cell;
}

@end