//
//  JSONValueTransformer+URLTransformer.h
//  TNews
//
//  Created by Soner Güler on 24/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface JSONValueTransformer (URLTransformer)

- (NSURL*)NSURLFromNSString:(NSString *)string;
- (NSString*)JSONObjectFromNSURL:(NSURL *)url;

@end
