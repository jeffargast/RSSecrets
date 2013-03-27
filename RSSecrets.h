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

/**
 * Set and get encrypted values from the iOS keychain.
 */
@interface RSSecrets : NSObject

/**
 Adds a given key-value pair to the keychain.
 
 @param data    The data value to set for _key_.
 @param key     The key for _string_.
 
 @discussion If an object for _key_ already exists in the keychain, _data_ takes its place.
 */
+ (void)setData:(NSData *)data forKey:(NSString *)key;

/**
 Adds a given key-value pair to the keychain.
 
 @param string  The string value to set for _key_.
 @param key     The key for _string_.
 
 @discussion If an object for _key_ already exists in the keychain, _string_ takes its place.
 */
+ (void)setString:(NSString *)string forKey:(NSString *)key;


/**
 Returns the data value associated with a given key.
 
 @param key     The key for which to return the corresponding value.
 @return        The data associated with _key_, or `nil` if no value is associated with _key_.
 */
+ (NSData *)dataForKey:(NSString *)key;

/**
 Returns the string value associated with a given key.
 
 @param key     The key for which to return the corresponding value.
 @return        The string associated with _key_, or `nil` if no value is associated with _key_.
 */
+ (NSString *)stringForKey:(NSString *)key;

/**
 Remove the value for a key
 
 @param key     The key to remove
 
 @deprecated    Use removeObjectForKey: instead
 */
+ (void)removeKey:(NSString *)key __attribute__((deprecated));


/**
 Remove the value for a key
 
 @param key     The key to remove
 */
+ (void)removeObjectForKey:(NSString *)key;

@end
