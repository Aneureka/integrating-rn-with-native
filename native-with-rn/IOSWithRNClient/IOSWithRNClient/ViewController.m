//
//  ViewController.m
//  IOSWithRNClient
//
//  Created by Aneureka on 2018/10/10.
//  Copyright © 2018 Aneureka. All rights reserved.
//

#import "ViewController.h"
#import <IOSWithRN/ReactNativeViewController.h>

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)startRNButton:(id)sender {
    ReactNativeViewController *reactNativeVC = [[ReactNativeViewController alloc] init];
    [self presentViewController:reactNativeVC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


@end
