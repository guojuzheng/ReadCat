//
//  FileReadAndWriteManager.h
//  FlowWallet
//
//  Created by YangQin on 14-12-26.
//  Copyright (c) 2014年 YangQin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCFileReadAndWriteManager: NSObject

/*!
 @method sharedAnimationCheckManager
 @abstract share AnimationCheckManager
 @discussion share AnimationCheckManager
 @result ZDAnimationCheckManager
 */
+ (JCFileReadAndWriteManager *)sharedAnimationCheckManager;

/*!
 @method writeToBundleFile:withData:
 @abstract write data to plist in bundle
 @discussion write data to plist in bundle
 */
- (void)writeToBundleFile:(NSString *)fileName withData:(NSMutableDictionary *)writeData;

/*!
 @method readFromBundleFile:
 @abstract read data from plist in bundle
 @discussion read data from plist in bundle
 @result NSMutableDictionary
 */
- (NSMutableDictionary *)readFromBundleFile:(NSString *)fileName;

/*!
 @method writeToFile:withData:withKey:
 @abstract write animation gif file version & key(animationId) to plist
 @discussion write animation gif file version & key(animationId) to plist
 */
- (void)writeToFile:(NSString *)fileName withData:(NSNumber *)versionNumber withKey:(NSNumber *)key;

/*!
 @method readFromFile:
 @abstract read data from plist
 @discussion read data from plist
 @result NSMutableDictionary
 */
- (NSMutableDictionary *)readFromFile:(NSString *)fileName;

/*!
 @method writeToDocumentPath:
 @abstract write data to document
 @discussion write data to document
 @result BOOL
 */
- (BOOL)writeToDocumentPath:(NSString *)filePath fileName:(NSString *)fileName withData:(NSData *) data;

/*!
 @method documentFileExists:
 @abstract documentFileExists
 @discussion documentFileExists
 @result BOOL
 */
- (BOOL)documentFileExists:(NSString *)filePath fileName:(NSString *)fileName;

/*!
 @method documentFilePath:
 @abstract get document file path
 @discussion get document file path
 @result NSString
 */
- (NSString *)documentFilePath:(NSString *)filePath fileName:(NSString *)fileName;

/*!
 @method readFromFile:
 @abstract read data from document
 @discussion read data from document
 @result NSData
 */
- (NSData *)readFileFromDocument:(NSString *)filePath fileName:(NSString *)fileName;

/*!
 @method deleteFileFromDocument:
 @abstract delete file from document
 @discussion delete file from document
 @result BOOL
 */
- (BOOL)deleteFileFromDocument:(NSString *)filePath;

@end
