//
//  AutoLinkAppDelegate.m
//  AutoLink
//
//  Created by Randall Brown on 8/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AutoLinkAppDelegate.h"
#import "NSTextView+AutomaticLinkDetection.h"
@implementation AutoLinkAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
   [myTextView setString:@"http://google.com http://apple.com"]; 
   [myTextView detectAndAddLinks];
   
   [myOtherTextView setString:@"http://google.com http://apple.com"];
}

@end
