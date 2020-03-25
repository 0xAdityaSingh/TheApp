//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_local_notifications_extended/FlutterLocalNotificationsPlugin.h>)
#import <flutter_local_notifications_extended/FlutterLocalNotificationsPlugin.h>
#else
@import flutter_local_notifications_extended;
#endif

#if __has_include(<ssh/SshPlugin.h>)
#import <ssh/SshPlugin.h>
#else
@import ssh;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterLocalNotificationsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterLocalNotificationsPlugin"]];
  [SshPlugin registerWithRegistrar:[registry registrarForPlugin:@"SshPlugin"]];
}

@end
