//
//  RSSecrets.h
//  Secrets
//
// Copyright (c) 2012-2015 Jeff Argast
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
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
