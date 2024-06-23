#import "DesPlugin.h"
#import "DES3Util.h"
#import "Des3Tools.h"

@implementation DesPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"des_plugin"
            binaryMessenger:[registrar messenger]];
  DesPlugin* instance = [[DesPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"encrypt" isEqualToString:call.method]) {
    NSDictionary *dic = call.arguments;
    NSLog(@"arguments = %@", dic);
    NSLog(@"data = %@", [dic objectForKey:@"data"]);
    NSLog(@"key = %@", [dic objectForKey:@"key"]);
    
    NSString *encryptedData = [DES3Util encryptUseDES:[dic objectForKey:@"data"] key:[dic objectForKey:@"key"]];
    result(encryptedData);
    
  } else if ([@"decrypt" isEqualToString:call.method]) {
    NSDictionary *dic = call.arguments;
    NSLog(@"arguments = %@", dic);
    NSLog(@"data = %@", [dic objectForKey:@"data"]);
    NSLog(@"key = %@", [dic objectForKey:@"key"]);
    
    NSString *decryptedData = [DES3Util decryptUseDES:[dic objectForKey:@"data"] key:[dic objectForKey:@"key"]];
    result(decryptedData);
    
  } else if ([@"threeDecrypt" isEqualToString:call.method]) {
    NSDictionary *dic = call.arguments;
    NSLog(@"arguments = %@", dic);
    NSLog(@"data = %@", [dic objectForKey:@"data"]);
    NSLog(@"iv = %@", [dic objectForKey:@"iv"]);
    
    NSString *decryptedData = [Des3Tools decryptWithText:[dic objectForKey:@"data"] withIv:[dic objectForKey:@"iv"]];
    result(decryptedData);
    
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
