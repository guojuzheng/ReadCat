//
//  FileReadAndWriteManager.m
//  FlowWallet
//
//  Created by YangQin on 14-12-26.
//  Copyright (c) 2014年 YangQin. All rights reserved.
//

#import "JCFileReadAndWriteManager.h"

static JCFileReadAndWriteManager *fileManager;

@implementation JCFileReadAndWriteManager

+ (JCFileReadAndWriteManager *)sharedAnimationCheckManager
{
    @synchronized([JCFileReadAndWriteManager class]) {
        if(!fileManager) {
            fileManager = [[self alloc] init];
        }
        return  fileManager;
    }
    return nil;
}


- (id)init
{
    self =[super init];
    if (self) { 
        
    }
    return self;
}


- (void)writeToBundleFile:(NSString *)fileName withData:(NSMutableDictionary *)writeData
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    [data setDictionary:writeData];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentsDirectory;
    if (paths && paths.count > 0) {
        documentsDirectory = [paths objectAtIndex:0];
    }
    NSString *plistFile = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", fileName]];
    [data writeToFile:plistFile atomically:YES];
}

- (NSMutableDictionary *)readFromBundleFile:(NSString *)fileName
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    NSMutableDictionary *readData = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    return readData;
}

- (void)writeToFile:(NSString *)fileName withData:(NSNumber *)versionNumber withKey:(NSNumber *)key;
{
    NSString *path = CACHES_FOLDER;
    NSString *filePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", fileName]];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath] == NO){
        [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
        
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"version", @"id", nil];
        [dic writeToFile:filePath atomically:YES];
    }
    
    NSMutableDictionary *writeData = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    
    [writeData setObject:versionNumber forKey:[NSString stringWithFormat:@"%@", key]];
    
    [writeData writeToFile:filePath atomically:YES];
}

- (NSMutableDictionary *)readFromFile:(NSString *)fileName
{
    NSString *path = CACHES_FOLDER;
    NSString *filePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", fileName]];
    
    NSMutableDictionary *readData = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    
    return readData;
}

- (BOOL)writeToDocumentPath:(NSString *)filePath fileName:(NSString *)fileName withData:(NSData *) data;
{
    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //获取document路径,括号中属性为当前应用程序独享
    NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory;
    if (directoryPaths && directoryPaths.count > 0) {
        documentDirectory = [directoryPaths objectAtIndex:0];
    }
    
    NSString *path = [documentDirectory stringByAppendingPathComponent:filePath];
    
    NSError *error;
    BOOL isDirectory;
    if (![fileManager fileExistsAtPath:path isDirectory:&isDirectory]) {
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    }
    path = [path stringByAppendingPathComponent:fileName];
    //查找文件，如果不存在，就创建一个文件
    BOOL isSuccess = [fileManager createFileAtPath:path contents:data attributes:nil];
    return isSuccess;
}

- (BOOL)documentFileExists:(NSString *)filePath fileName:(NSString *)fileName
{
    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //获取document路径,括号中属性为当前应用程序独享
    NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory;
    if (directoryPaths && directoryPaths.count > 0) {
        documentDirectory = [directoryPaths objectAtIndex:0];
    }
    NSString *path = [documentDirectory stringByAppendingPathComponent:filePath];
    path = [path stringByAppendingPathComponent:fileName];
    
    return [fileManager fileExistsAtPath:path];
}

- (NSString *)documentFilePath:(NSString *)filePath fileName:(NSString *)fileName
{
    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //获取document路径,括号中属性为当前应用程序独享
    NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory;
    if (directoryPaths && directoryPaths.count > 0) {
        documentDirectory = [directoryPaths objectAtIndex:0];
    }
    
    NSError *error;
    BOOL isDirectory;
    
    NSString *path = [documentDirectory stringByAppendingPathComponent:filePath];
    if (![fileManager fileExistsAtPath:path isDirectory:&isDirectory]) {
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    }
    path = [path stringByAppendingPathComponent:fileName];
    return path;
}

- (NSData *)readFileFromDocument:(NSString *)filePath fileName:(NSString *)fileName
{
    //获取document路径,括号中属性为当前应用程序独享
    NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory;
    if (directoryPaths && directoryPaths.count > 0) {
        documentDirectory = [directoryPaths objectAtIndex:0];
    }
    NSString *path = [documentDirectory stringByAppendingPathComponent:filePath];
    path = [path stringByAppendingPathComponent:fileName];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    return data;
}

- (BOOL)deleteFileFromDocument:(NSString *)filePath
{
    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //获取document路径,括号中属性为当前应用程序独享
    NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory;
    if (directoryPaths && directoryPaths.count > 0) {
        documentDirectory = [directoryPaths objectAtIndex:0];
    }
    NSString *path = [documentDirectory stringByAppendingPathComponent:filePath];
    
    NSError *error;
    [fileManager removeItemAtPath:path error:&error];
    return error? YES: NO;
}

@end
