//
//  IconTextField.m
//  timerTest
//
//  Created by duly on 2018/10/30.
//  Copyright © 2018年 duly. All rights reserved.
//

#import "IconTextField.h"


//height and width
#define SELF_HEIGHT self.frame.size.height
#define SELF_WIDTH self.frame.size.width

@interface IconTextField ()
{
    NSInteger countDown;
    NSTimer *countDownTimer;
}


@end

@implementation IconTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame andIcon:(NSString *)icon andLocalKey:(NSString *)key andBtnIcon:(NSString *)btnIcon andTextDelegate:(id)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        //判断是否有图标
        if (icon != nil) {
            _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SELF_HEIGHT*.2, SELF_HEIGHT*.25, SELF_HEIGHT*.5, SELF_HEIGHT*.5)];
            _imageView.image = [UIImage imageNamed:icon];
            [self addSubview:_imageView];
        }
       
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(SELF_HEIGHT+5, SELF_HEIGHT*.25, SELF_WIDTH*.7, SELF_HEIGHT*.6)];
        
        _textField.delegate = delegate;
        [self addSubview:_textField];
        
        _deleteText = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteText.backgroundColor = [UIColor clearColor];
        _deleteText.frame = CGRectMake(270, 0, 50, 50);
        [_deleteText setImage:[UIImage imageNamed:@"login_close.png"] forState:UIControlStateNormal];
        [_deleteText setImageEdgeInsets:UIEdgeInsetsMake(17.5, 17.5, 17.5, 17.5)];
        [_deleteText addTarget:self action:@selector(deleteTextClick) forControlEvents:UIControlEventTouchUpInside];
        _deleteText.hidden = YES;
        [self addSubview:_deleteText];
    }
    return self;
}
- (void)deleteTextClick
{
    _textField.text = @"";
    _deleteText.hidden = YES;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    UITextRange *textPutRange = [textField markedTextRange];
    NSInteger len = [textField offsetFromPosition:textPutRange.start toPosition:textPutRange.end];
    NSInteger relLength = textField.text.length - len;
    
    if (string.length >= 2 && (relLength + string.length) > self.characters) {
        return NO;
    }
    
    if ((relLength) > self.characters || (string.length > self.characters)) {
        return NO;
    }
    return YES;
}

- (void)dealloc
{
    if (countDownTimer) {
        [countDownTimer invalidate];
    }
}


@end
