//
//  DesignerTableViewCell.m
//  RtR
//
//  Created by Jay on 6/21/16.
//  Copyright © 2016 jay. All rights reserved.
//

#import "DesignerTableViewCell.h"

@implementation DesignerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)favBtnPressed:(id)sender {
    if (_favBtn.tag == 0) {
        [_favBtn setImage:[UIImage imageNamed:@"full-heart"] forState:UIControlStateNormal];
        _favBtn.tag = 1;
    } else {
        [_favBtn setImage:[UIImage imageNamed:@"empty-heart"] forState:UIControlStateNormal];
        _favBtn.tag = 0;
    }
    [_delegate toggleFavorite:self];
}

- (void)updateWithDesigner:(Designer *)designer {
    _designerLbl.text = designer.designerName;
    _productCountLbl.text = [NSString stringWithFormat:@"%lu", (unsigned long)designer.numberOfProducts];
    
    if (designer.isFavorite) {
        _favBtn.tag = 1;
        [_favBtn setImage:[UIImage imageNamed:@"full-heart"] forState:UIControlStateNormal];
    } else {
        _favBtn.tag = 0;
        [_favBtn setImage:[UIImage imageNamed:@"empty-heart"] forState:UIControlStateNormal];
    }
}

@end
