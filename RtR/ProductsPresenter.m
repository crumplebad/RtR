//
//  ProductsPresenter.m
//  RtR
//
//  Created by Jay on 6/21/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "ProductsPresenter.h"
#import "Product.h"

@implementation ProductsPresenter {
    NSMutableArray *gProductsArray;
}


- (void)loadProductsForDesigner:(NSString *)designer {
    [self.input getAllProductsForDesigner:designer];
}

- (void)returnAllProducts:(NSMutableArray *)productsArray {
    gProductsArray = productsArray;
}

- (Product *)getProductAtIndex:(NSIndexPath *)indexpath {
    
    return gProductsArray[indexpath.row];
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