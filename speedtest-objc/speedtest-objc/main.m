//
//  main.m
//  speedtest-objc
//
//  Created by macbook on 2015/04/07.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpeedTest : NSObject

@end

// debug class variable
static long allcounter;
static int zerocounter;
static int loopcounter;

@implementation SpeedTest


+(void)decreaseRecursion:(NSInteger)cnt
{
    allcounter++;
    if( cnt == 0 ){
        zerocounter++;
        return;
    }else{
        [SpeedTest decreaseRecursion:--cnt];
    }
}

+(BOOL)initCalc
{
    allcounter=0;
    zerocounter=0;
    loopcounter=0;
    
    for( int i = 0 ; i < 100 ; ++i ){
        for( int j = 0 ; j < 100 ; ++j ){
            [SpeedTest decreaseRecursion:100000];
            loopcounter++;
        }
    }
    return YES;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDate *startDate = [NSDate date];
        NSLog(@"Start!\n");
        
        if([SpeedTest initCalc]){
            NSLog(@"End\n");
            NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:startDate];
            NSLog(@"%lf",interval);
            NSLog(@"allcnt:%ld, zerocnt:%d, loopcnt:%d",allcounter,zerocounter,loopcounter);
        } else {
            NSLog(@"Error!");
        }
    }
    return 0;
}