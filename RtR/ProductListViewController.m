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
#import "AppDependency.h"
#import "ProductsPresenter.h"

@interface ProductListViewController (){

    Designer *gDesigner;
}
@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [AppDependency configureDependencyForProducts:self];
    [self setTitle:gDesigner.designerName];
    self.tableView.delegate = self.presenter;
    self.tableView.dataSource = self.presenter;
    [self.presenter loadProductsForDesigner:gDesigner.designerName];
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
        Product *aProduct = [self.presenter getProductAtIndex:[self.tableView indexPathForSelectedRow]];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setProduct:aProduct];
    }
}

@end