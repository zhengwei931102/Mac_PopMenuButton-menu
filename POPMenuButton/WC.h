//
//  WC.h
//  POPMenuButton
//
//  Created by admin on 17/2/7.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PopMenuButton.h"
@interface WC : NSWindowController<PopMenuButtonDelegate>
@property (weak) IBOutlet PopMenuButton *btn;

@end
