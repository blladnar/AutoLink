//
//  NSTextView+AutomaticLinkDetection.m
//  AutoLink
//
//  Created by Randall Brown on 8/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSTextView+AutomaticLinkDetection.h"
#import "NSAttributedString+Hyperlink.h"

@implementation NSTextView (NSTextView_AutomaticLinkDetection)

- (void)detectAndAddLinks {

    NSTextStorage* textStorage = [self textStorage];
    NSString* string = [self string];
    NSUInteger length = [string length];
    
    // reset attributes
    [textStorage setAttributes:nil range:NSMakeRange(0, length)];
    
    NSError *error = NULL;
    NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink
                                                               error:&error];
    
    NSArray *matches = [detector matchesInString:string
                                         options:0
                                           range:NSMakeRange(0, [string length])];
    for (NSTextCheckingResult *match in matches) {
        NSRange range = [match range];
        NSURL* url = [match URL];
        NSString* str = [string substringWithRange:range];
        NSAttributedString *linkString = [NSAttributedString hyperlinkFromString:str withURL:url];
        [textStorage replaceCharactersInRange:range withAttributedString:linkString];
    }
}

@end
