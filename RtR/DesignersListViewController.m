//
//  ViewController.m
//  RtR
//
//  Created by Jay on 6/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "DesignersListViewController.h"
#import "ProductListViewController.h"
#import "DesignersProductsDataManager.h"
#import "Model.h"
#import "Util.h"
#import "AppDependency.h"

@interface DesignersListViewController (){
    
    Designer *gSelectedDesigner;
}

@end

@implementation DesignersListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [AppDependency configureDependencyForDesigners:self];
    [self.presenter loadDesignersData];
    self.tableView.delegate = _presenter;
    self.tableView.dataSource = _presenter;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showProductList"]) {
        ProductListViewController *controller = (ProductListViewController*)[segue destinationViewController];
        if (gSelectedDesigner.numberOfProducts > 0) {
            [controller setDesigner:gSelectedDesigner];
        }
    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    gSelectedDesigner = [self.presenter getDesignerAtIndex:[self.tableView indexPathForSelectedRow]];
    if (gSelectedDesigner.numberOfProducts > 0) {
        
        return YES;
    } else {
        [self showAlert];
        
        return NO;
    }
}

- (void)showAlert {
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Awww!"
                                  message:@"No products to show now. Check back later."
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

@end