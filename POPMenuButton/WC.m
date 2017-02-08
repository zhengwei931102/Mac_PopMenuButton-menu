//
//  WC.m
//  POPMenuButton
//
//  Created by admin on 17/2/7.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "WC.h"

@interface WC ()

@end

@implementation WC

- (void)windowDidLoad {
    [super windowDidLoad];
    
    self.btn.defaultImage = [NSImage imageNamed:@"1"];
    self.btn.selectedImage = [NSImage imageNamed:@"2"];
    self.btn.toolTip   = @"Open HDD movie";
    self.btn.menuItemStringArray = [[NSMutableArray alloc] init];
    [self.btn.menuItemStringArray addObject:@"Open a DVD movie on the hard disk"];
    [self.btn.menuItemStringArray addObject:@"Open an ISO file on the hard disk"];
    [self.btn.menuItemStringArray addObject:@"Open a directory on the hard disk"];
    self.btn.delegate = self;
}
- (void)PopMenuButtonDelegate_ClickItem:(NSInteger)tag{
    if(tag==0){
        NSLog(@"点击第1个");
    }else if (tag==1){
        NSLog(@"点击第2个");
        
    }else if(tag==2){
        NSLog(@"点击第3个");
    }
}

@end
