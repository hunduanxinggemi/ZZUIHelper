//
//  ZZUILabel.m
//  ZZUIHelper
//
//  Created by 李伯坤 on 2017/2/20.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "ZZUILabel.h"

@implementation ZZUILabel
@synthesize properties = _properties;

- (NSMutableArray *)properties
{
    if (!_properties) {
        _properties = [super properties];
        ZZProperty *text = [[ZZProperty alloc] initWithPropertyName:@"text" type:ZZPropertyTypeString defaultValue:@""];
        ZZProperty *font = [[ZZProperty alloc] initWithPropertyName:@"font" selectionData:[ZZControlHelper sharedInstance].fonts andDefaultSelectIndex:7];
        [font setSelected:YES];
        [font setPropertyCodeByValue:^NSString *(id value) {
            return [NSString stringWithFormat:@"setFont:[UIFont %@]", value];
        }];
        ZZProperty *textColor = [[ZZProperty alloc] initWithPropertyName:@"textColor" selectionData:[ZZControlHelper sharedInstance].colors defaultSelectIndex:2 editable:YES];
        [textColor setPropertyCodeByValue:^NSString *(id value) {
            return [NSString stringWithFormat:@"setTextColor:[UIColor %@]", value];
        }];
        ZZProperty *textAlignment = [[ZZProperty alloc] initWithPropertyName:@"textAlignment" selectionData:[ZZControlHelper sharedInstance].textAlignment andDefaultSelectIndex:0];
        ZZProperty *numberOfLines = [[ZZProperty alloc] initWithPropertyName:@"numberOfLines" type:ZZPropertyTypeNumber defaultValue:@"1"];
        ZZPropertyGroup *group = [[ZZPropertyGroup alloc] initWithGroupName:@"UILabel" properties:@[text, font, textColor, textAlignment, numberOfLines]];
        [_properties addObject:group];
    }
    return _properties;
}

@end
