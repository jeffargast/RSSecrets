//
//  RSSecrets.h
//  Secrets
//
//  Created by Jeff Argast on 4/13/12.
//  Copyright (c) 2012 Jeff Argast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSecrets : NSObject

+ (void) setData: (NSData*) object forKey: (NSString*) key;
+ (void) setString: (NSString*) object forKey: (NSString*) key;

+ (NSData*) dataForKey: (NSString*) key;
+ (NSString*) stringForKey: (NSString*) key;

+ (void) removeKey: (NSString*) key;

@end
