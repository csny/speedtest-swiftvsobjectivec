//
//  main.swift
//  speedtest-swift
//
//  Created by macbook on 2015/04/07.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

import Foundation

// debug variable
var allcounter: Int=0
var zerocounter: Int=0
var loopcounter: Int=0

func recurseDecreasing(var cnt: Int)
{
    allcounter++
    if( cnt == 0 ){
        zerocounter++
        return
    }else{
        recurseDecreasing(--cnt)
    }
}

func initCalc() -> Bool
{
    for var i:Int=0;i<100;++i{
        for var j:Int=0;j<100;++j{
            recurseDecreasing(100000)
            loopcounter++
        }
    }
    return true
}

let startDate = NSDate()
println("Start!")

if initCalc() {
    println("End")
    let elapsed = NSDate().timeIntervalSinceDate(startDate)
    println(elapsed)
    println("allcnt:\(allcounter), zerocnt:\(zerocounter), loopcnt:\(loopcounter)")
}else{
    println("Error!")
}
