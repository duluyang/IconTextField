//
//  IconTextField.h
//  timerTest
//
//  Created by duly on 2018/10/30.
//  Copyright © 2018年 duly. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    TextFieldEditModePassword,
    TextFieldEditModeVeriCode,
} TextFieldEditMode;

typedef void(^ClickBlock)(void);

@interface IconTextField : UIView<UITextFieldDelegate>

@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,strong)UILabel *textLabel;
@property(nonatomic)BOOL isDrawLine;
@property(nonatomic,strong)UIButton *deleteText;
@property(nonatomic)BOOL isChangePassword;
@property(nonatomic,strong)UIImageView *imageView1;
@property (nonatomic, assign) NSInteger characters;
//点击按钮回调
@property(nonatomic,strong)ClickBlock clickBlock;


//图标 ＋ 输入框
-(id)initWithFrame:(CGRect)frame andIcon:(NSString *)icon andLocalKey:(NSString *)key andTextDelegate:(id)delegate;

@end
