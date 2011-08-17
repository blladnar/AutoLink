//
//  AutoLinkAppDelegate.h
//  AutoLink
//
//  Created by Randall Brown on 8/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AutoLinkAppDelegate : NSObject <NSApplicationDelegate, NSTextViewDelegate> {
   NSWindow *window;
   IBOutlet NSTextView *myTextView;

   IBOutlet NSTextView *myOtherTextView;
}

@property (assign) IBOutlet NSWindow *window;

@end
