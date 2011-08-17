//
//  NSString+FindURLs.m
//  timezone
//
//  Created by Randall Brown on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+FindURLs.h"

@implementation NSString (NSString_FindURLs)

-(NSArray*)arrayOfLinks
{
    NSString *regexToReplaceRawLinks = @"(\\b(https?):\\/\\/[-A-Z0-9+&@#\\/%?=~_|!:,.;]*[-A-Z0-9+&@#\\/%=~_|])";   
    
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexToReplaceRawLinks
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    NSArray *results = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    
    NSMutableArray *links = [NSMutableArray array];
    
    for( id result in results )
    {
        [links addObject:[self substringWithRange:[result range]]];
    }
    
    
    return links;  
}

-(NSArray*)locationsOfLinks
{
   NSString *regexToReplaceRawLinks = @"(\\b(https?):\\/\\/[-A-Z0-9+&@#\\/%?=~_|!:,.;]*[-A-Z0-9+&@#\\/%=~_|])";   
   
   NSError *error = NULL;
   NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexToReplaceRawLinks
                                                                          options:NSRegularExpressionCaseInsensitive
                                                                            error:&error];
   
   NSArray *results = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];
   return results;
}

@end
