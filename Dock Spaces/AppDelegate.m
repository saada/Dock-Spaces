//
//  AppDelegate.m
//  Dock Spaces
//
//  Created by SAADA on 1/26/14.
//  Copyright (c) 2014 Mahmoud Saada. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void)awakeFromNib {
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setMenu:statusMenu];
//    [statusItem setTitle:@"Dock Sapces"];
    [statusItem setHighlightMode:YES];
    [statusItem setImage:[NSImage imageNamed:@"fish24x24"]];
}

- (IBAction)addSpace:(id)sender {
    NSString *path = @"/usr/bin/defaults";
    NSArray *args = [NSArray arrayWithObjects:@"write",@"com.apple.dock", @"persistent-apps", @"-array-add", @"{\"tile-type\"=\"spacer-tile\";}", nil];
    [[NSTask launchedTaskWithLaunchPath:path arguments:args] waitUntilExit];
    
    NSLog(@"Adding dock space...");
    [self restartDock:nil];
    
}

- (IBAction)restartDock:(id)sender {
    NSString *path = @"/usr/bin/killall";
    NSArray *args = [NSArray arrayWithObjects:@"Dock", nil];
    [[NSTask launchedTaskWithLaunchPath:path arguments:args] waitUntilExit];
    NSLog(@"restarting dock...");
}

- (IBAction)quit:(id)sender {
    [NSApp terminate:nil];
}
@end
