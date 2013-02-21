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

//-(void)detectAndAddLinks
//{
//   NSArray *linkLocations = [[self string] locationsOfLinks];
//   NSArray *links = [[self string] arrayOfLinks];
//   
//   int i=0;
//   for( NSString *link in links )
//   {
//      NSAttributedString *linkString = [NSAttributedString hyperlinkFromString:link withURL:[NSURL URLWithString:link]];
//      [[self textStorage] replaceCharactersInRange:[[linkLocations objectAtIndex:i] range] withAttributedString:linkString];
//      i++;
//   }
//   
//}

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
        NSAttributedString *linkString = [NSAttributedString hyperlinkFromString:str withURL:[NSURL URLWithString:link]];
        [textStorage replaceCharactersInRange:range withAttributedString:linkString];
    }
}

@end
