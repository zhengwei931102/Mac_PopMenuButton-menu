//
//  PopMenuButton.h
//  RIPperDVD
//
//  Created by admin on 17/1/22.
//  Copyright © 2017年 admin. All rights reserved.
//
/**
 *  自定义的menu选择的按钮可enter/exit变换图片，高亮图片无法变换
 *
 *
 */
#import <Cocoa/Cocoa.h>
@protocol PopMenuButtonDelegate
- (void)PopMenuButtonDelegate_ClickItem:(NSInteger)tag;
@end
@interface PopMenuButton : NSButton
@property (strong) NSImage *defaultImage;
@property (strong) NSImage *selectedImage;
@property (nonatomic,retain)NSColor *titleColor;//有默认值白色
@property (nonatomic,assign)int fontSize;//有默认值13
@property (nonatomic,copy) NSString *text;//默认为空
@property (nonatomic,retain) NSMutableArray *menuItemStringArray;
@property (nonatomic,assign) id<PopMenuButtonDelegate>delegate;
@end
