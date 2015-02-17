//
//  RSSecrets.m
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

#import "RSSecrets.h"

@implementation RSSecrets

+ (void)setData:(NSData *)data forKey:(NSString *)key {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    [dict setObject:key forKey:(__bridge id)kSecAttrService];
    
    SecItemDelete((__bridge CFDictionaryRef)dict);
    
    if (data) {
        [dict setObject:data forKey:(__bridge id)kSecValueData];
        SecItemAdd((__bridge CFDictionaryRef)dict, NULL);
    }
}

+ (NSData *)dataForKey:(NSString *)key {
    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    
    [query setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    [query setObject:key forKey:(__bridge id)kSecAttrService];
    [query setObject:(id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    
    CFTypeRef result = nil;
    SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
    
    if (!result) return nil;
    
    return (__bridge NSData *)result;
}

+ (void)setString:(NSString *)string forKey:(NSString *)key {
    [self setData:[string dataUsingEncoding:NSUTF8StringEncoding] forKey:key];
}

+ (NSString *)stringForKey:(NSString *)key {
    NSData *data = [self dataForKey:key];
    
    if (!data) return nil;
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+ (void)removeKey:(NSString *)key {
    [self removeObjectForKey:key];
}

+ (void)removeObjectForKey:(NSString *)key {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    [dict setObject:key forKey:(__bridge id)kSecAttrService];
    
    SecItemDelete((__bridge CFDictionaryRef)dict);
}

@end
