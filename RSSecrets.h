//
//  RSSecrets.h
//  Secrets
//
// Copyright (C) 2012, Jeff Argast. All rights reserved.
// 
// The author make NO WARRANTY or representation, either express or implied,
// with respect to this software, its quality, accuracy, merchantability, or
// fitness for a particular purpose.  This software is provided "AS IS", and you,
// its user, assume the entire risk as to its quality and accuracy.
// 
// Permission is hereby granted to use, copy, modify, and distribute this
// software or portions thereof for any purpose, without fee, subject to these
// conditions:
// 
// (1) If any part of the source code is distributed, then this
// statement must be included, with this copyright and no-warranty notice
// unaltered.
// 
// (2) Permission for use of this software is granted only if the user accepts
// full responsibility for any undesirable consequences; the author accepts
// NO LIABILITY for damages of any kind.
//

#import <Foundation/Foundation.h>

@interface RSSecrets : NSObject

+ (void) setData: (NSData*) object forKey: (NSString*) key;
+ (void) setString: (NSString*) object forKey: (NSString*) key;

+ (NSData*) dataForKey: (NSString*) key;
+ (NSString*) stringForKey: (NSString*) key;

+ (void) removeKey: (NSString*) key;

@end
