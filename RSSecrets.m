//
//  RSSecrets.m
//  Secrets
//
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

#import "RSSecrets.h"

@implementation RSSecrets

+ (void) setData: (NSData*) object forKey: (NSString*) key {	
	NSMutableDictionary* dict = [NSMutableDictionary dictionary];

	[dict setObject: (__bridge id) kSecClassGenericPassword forKey: (__bridge id) kSecClass];
	[dict setObject: key forKey: (__bridge id) kSecAttrService];
	
	SecItemDelete((__bridge CFDictionaryRef) dict);

	if (object) {
		[dict setObject: object forKey: (__bridge id) kSecValueData];
		SecItemAdd ((__bridge CFDictionaryRef) dict, NULL);
	}
}

+ (NSData*) dataForKey: (NSString*) key {
	NSMutableDictionary* query = [NSMutableDictionary dictionary];
	[query setObject: (__bridge id) kSecClassGenericPassword forKey: (__bridge id) kSecClass];
	[query setObject: key forKey: (__bridge id) kSecAttrService];
	[query setObject: (id) kCFBooleanTrue forKey: (__bridge id) kSecReturnData];

	CFTypeRef result = nil;
	SecItemCopyMatching((__bridge CFDictionaryRef) query, &result);
	if (!result)
		return nil;

	return (__bridge NSData*) result;
}

+ (void) setString: (NSString*) object forKey: (NSString*) key {	
	[self setData: [object dataUsingEncoding: NSUTF8StringEncoding] forKey: key];
}

+ (NSString*) stringForKey: (NSString*) key {
	NSData* data = [self dataForKey: key]; 
	if (!data)
		return nil;
	
	return [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
}

+ (void) removeKey: (NSString*) key {
	NSMutableDictionary* dict = [NSMutableDictionary dictionary];

	[dict setObject: (__bridge id) kSecClassGenericPassword forKey: (__bridge id) kSecClass];
	[dict setObject: key forKey: (__bridge id) kSecAttrService];
	
	SecItemDelete((__bridge CFDictionaryRef) dict);
}

@end
