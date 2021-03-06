//
//  YLT_TangramLabel.m
//  AFNetworking
//
//  Created by 项普华 on 2018/12/19.
//

#import "YLT_TangramLabel.h"
#import <YLT_Kit/YLT_Kit.h>
#import "YLT_TangramUtils.h"

@interface YLT_TangramLabel () {
}
@property (nonatomic, strong) UILabel *label;
@end

@implementation YLT_TangramLabel

- (void)refreshPage {
    if ([self.content isKindOfClass:[TangramLabel class]]) {
        if (self.content.text.ylt_isValid) {
            self.label.text = self.content.text;
        }
        self.label.ylt_textColor(self.content.textColor.ylt_androidColorFromHexString);
        switch (self.content.gravity) {
            case LayoutGravity_Top:
                break;
            case LayoutGravity_Left: {
                self.label.textAlignment = NSTextAlignmentLeft;
            }
                break;
            case LayoutGravity_Right: {
                self.label.textAlignment = NSTextAlignmentRight;
            }
                break;
            case LayoutGravity_Bottom: {
            }
                break;
            case LayoutGravity_H_center: {
                self.label.textAlignment = NSTextAlignmentCenter;
            }
                break;
            case LayoutGravity_V_center: {
            }
                break;
        }
        
        switch (self.content.textStyle) {
            case TextStyle_Normal: {
                self.label.font = [UIFont systemFontOfSize:self.content.fontSize];
            }
                break;
            case TextStyle_Bold: {
                self.label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:self.content.fontSize];
            }
                break;
            case TextStyle_Italic: {
            }
                break;
            case TextStyle_Strike: {
            }
                break;
            case TextStyle_UnderLine: {
            }
                break;
                
            default: {
                self.label.font = [UIFont systemFontOfSize:self.content.fontSize];
            }
                break;
        }
        self.label.numberOfLines = (self.content.maxLines != 0 )?self.content.maxLines:self.content.lines;
        
        if (self.pageData && self.content.text.ylt_isValid) {
            NSString *content = [YLT_TangramUtils valueFromSourceData:self.pageData keyPath:self.content.text];
            self.label.text = ([content isKindOfClass:[NSString class]])?content:@"";
        }
    }
}

#pragma mark - setter getter

- (TangramLabel *)content {
    return (TangramLabel *)self.pageModel;
}

- (UILabel *)label {
    if (!_label) {
        _label = UILabel.ylt_createLayout(self, ^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }).ylt_convertToLabel();
    }
    return _label;
}

@end
