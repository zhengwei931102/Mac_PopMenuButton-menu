//
//  PopMenuButton.m
//  RIPperDVD
//
//  Created by admin on 17/1/22.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "PopMenuButton.h"

@implementation PopMenuButton{
    BOOL mouseIn;
}
- (id)initWithFrame:(NSRect)frameRect{
    self = [super initWithFrame:frameRect];
    if(self){
        
        //图片充满
        [self setImagePosition: NSImageOnly];
        [[self cell] setImageScaling:NSImageScaleAxesIndependently];
        //        self.wantsLayer = YES;
        //        self.layer.masksToBounds = YES;
        //        self.layer.cornerRadius = 15.0;
        //取消按下变灰效果
        //        [self.cell setHighlightsBy:NSNoCellMask];
        mouseIn = NO;
        
        
    }
    return self;
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    //点击无白框
    [self.cell setHighlightsBy:1];
    //默认字体大小和颜色
    if(!self.fontSize){
        self.fontSize = 13;
    }
    if(!self.titleColor){
        self.titleColor = [NSColor whiteColor];
    }
    if(self.text.length==0){
        self.text = @"";
    }
    //文字居中
    NSFont *font = [NSFont systemFontOfSize:self.fontSize];
    NSDictionary * attrs = [NSDictionary dictionaryWithObjectsAndKeys:font,
                            NSFontAttributeName,
                            self.titleColor,
                            NSForegroundColorAttributeName, nil];
    
    NSAttributedString* attributedString = [[NSAttributedString alloc] initWithString:self.text attributes:attrs];
    
    
    NSSize txtSize = attributedString.size;
    double topGap = txtSize.height - (font.ascender + fabs(font.descender));
    NSPoint drawPoint = NSMakePoint(NSMidX(self.bounds)-txtSize.width/2, NSMidY(self.bounds)-txtSize.height/2);
    drawPoint.y -= topGap;
    
    [attributedString drawAtPoint:drawPoint];
    mouseIn = NO;
    
    
    
}
-(void)updateTrackingAreas{
    
    NSTrackingAreaOptions options = NSTrackingMouseEnteredAndExited|NSTrackingActiveAlways|NSTrackingMouseMoved|NSTrackingInVisibleRect ;
    NSTrackingArea *trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds
                                                                options:options
                                                                  owner:self
                                                               userInfo:nil];
    [self addTrackingArea:trackingArea];
    
}
-(void)mouseEntered:(NSEvent *)theEvent{
    
    mouseIn = YES;
    [self updateImage];
    
}

-(void)mouseExited:(NSEvent *)theEvent{
    mouseIn = NO;
    [self updateImage];
    
}

- (void)updateImage{
    if (mouseIn) {
        
        [self setImage:self.selectedImage];
    }else {
        [self setImage:self.defaultImage];
    }
}

- (void)mouseDown:(NSEvent *)theEvent{
    
    NSMenu *mContextualMenu = [[NSMenu alloc] initWithTitle:@""];
    NSMenuItem *menuItem;
    for (int i = 0; i < self.menuItemStringArray.count ; i ++ ) {
        menuItem = [[NSMenuItem alloc] initWithTitle:self.menuItemStringArray[i] action:@selector(clickItem:) keyEquivalent:@""];
        menuItem.tag = i;
        [mContextualMenu addItem:menuItem];
        
    }
    [NSMenu popUpContextMenu:mContextualMenu withEvent: theEvent forView:self];
    
}
- (void)clickItem:(NSMenuItem *)sender{
    if(_delegate){
        [_delegate PopMenuButtonDelegate_ClickItem:sender.tag];
    }
    
}
@end
