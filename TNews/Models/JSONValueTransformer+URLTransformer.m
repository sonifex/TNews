//
//  JSONValueTransformer+URLTransformer.m
//  TNews
//
//  Created by Soner Güler on 24/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "JSONValueTransformer+URLTransformer.h"

@implementation JSONValueTransformer (URLTransformer)


- (NSURL*)NSURLFromNSString:(NSString *)string {
    
    if ([string hasPrefix:@"http:"]) {
        return [NSURL URLWithString:string];
    }else {
        return [NSURL URLWithString:[NSString stringWithFormat:@"http:%@",string]];
    }
}

- (NSString*)JSONObjectFromNSURL:(NSURL *)url {
    return url.absoluteString;
}
@end
