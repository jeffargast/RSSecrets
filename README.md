# RSSecrets

Set and get encrypted values from the iOS keychain. Usage is straight forward:

```objective-c
// Set string to be encrypted in the keychain
[RSSecrets setString:@"Secret String" forKey:@"aKey"];

// Get string from the keychain for the key 
NSString *secretString = [RSSecrets stringForKey:@"aKey"];

// Delete string/data for a given key
[RSSecrets removeObjectForKey:@"aKey"];
```

Also works with NSData:

```objective-c
// Set data to be encrypted in the keychain. Presupposes a pointer named
// bytes of bytesLength size
NSData* byteData = [NSData dataWithBytes:bytes length:bytesLength];
[RSSecrets setData:byteData forKey:@"aKey"];

// Get data from the keychain for the key 
NSData *secretData = [RSSecrets dataForKey:@"aKey"];

// Delete string/data for a given key
[RSSecrets removeObjectForKey:@"aKey"];
```
