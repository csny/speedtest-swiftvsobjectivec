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

@implementation SpeedTest

// debug variable
long allcounter = 0;
int zerocounter=0;
int loopcounter=0;

+(void)minusCalc:(NSInteger)cnt
{
    allcounter++;
    if( cnt == 0 ){
        zerocounter++;
        return;
    }else{
        [SpeedTest minusCalc:--cnt];
    }
}

+(BOOL)initCalc
{
    for( int i = 0 ; i < 100 ; ++i ){
        for( int j = 0 ; j < 100 ; ++j ){
            [SpeedTest minusCalc:100000];
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
            NSLog(@"zerocnt:%d, loopcnt:%d, allcnt:%ld",zerocounter,loopcounter,allcounter);
        } else {
            NSLog(@"Error!");
        }
    }
    return 0;
}
