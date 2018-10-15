//
//  IOSWithRN.m
//  IOSWithRN
//
//  Created by Aneureka on 2018/10/8.
//  Copyright © 2018 Aneureka. All rights reserved.
//

#import "ReactNativeViewController.h"
#import <React/RCTRootView.h>
#import <React/RCTBundleURLProvider.h>

@interface ReactNativeViewController ()

@end

@implementation ReactNativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeReactView];
}

- (void) initializeReactView {
    
    NSURL *jsCodeLocation = [[NSBundle bundleForClass:self.class] URLForResource:@"main" withExtension:@"jsbundle"];
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                 moduleName:@"MyReactNativeApp"
                                                 initialProperties: @{ @"content" : @"hello" }
                                                 launchOptions:nil];
    self.view = rootView;
}

@end

