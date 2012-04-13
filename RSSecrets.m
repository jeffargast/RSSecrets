//
//  RSSecrets.m
//  Secrets
//
//  Created by Jeff Argast on 4/13/12.
//  Copyright (c) 2012 Jeff Argast. All rights reserved.
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
