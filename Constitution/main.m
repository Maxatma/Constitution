//
//  main.m
//  Constitution
//
//  Created by Admin on 19.03.14.
//  Copyright (c) 2014 Max Atma. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
         [MALocalizationSystem sharedLocalizationSystem];
     //   NSLog(MALocalizationGetLanguage);
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
