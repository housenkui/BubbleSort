//
//  main.m
//  BubbleSort
//
//  Created by Code_Hou on 2017/3/5.
//  Copyright © 2017年 侯森魁. All rights reserved.
//

#import <Foundation/Foundation.h>

//FIXME:这里N不能大于10^6，排序的元素过多，需要使用外排序
#define N 10

/*
 
 数组中元素在移动时叫做记录。
 数组元素在比较时叫做关键码。
 
《数据结构与算法C语言版》胡明 王红梅 编著 216页~217页 始终没有给出 关键码的定义。而且看书上的了第一插入排序代码就是错的，编者估计自己没有在真机上面运行。
 
 CSDN http://blog.csdn.net/hguisu/article/details/7776068#comments 这位前辈做已经很好了，但是就是没有说如何计算关键码的比较次数和记录的移动次数?
 
 另外本文作者技术水平有限，欢迎大家批评指正！
 */

/*
 每趟排序都是数组中的相邻两个元素在比较，
 
 */


//这里传入数组的首地址 和数组的长度
void BubbleSort(long a[],long n){
    //升序排序
    long compareCount = 0;
    long moveCount    = 0;
    long temp  = 0;
    long j     = 0;
    long i = 0;
    
    
    for (; i < n; i++) {
        
        for (j = i+1; j < n; j++) {
            
            compareCount++;
            
            if (a[j] < a[i]) {//关键码的比较    //数组中的值在比较，但是一般不这样叫，当数组中的值在比较时叫做关键码  YY? 书上就是这么叫的
                
                temp  = a[j];
                a[j]  = a[i];//记录的移动     //数组中的值在移动，但是一般不这样叫，当数组中的值在移动时叫做记录  YY?书上就是这么叫的
                a[i]  = temp;
                
                
                moveCount += 3;
                
            }
        }
        
    }
    
    unsigned  long sumCount = compareCount+moveCount;
    
    //实际值
    float  power  =  log2(sumCount)/log2(N);
    
    //当N = 10^1时 ，power =1.968483
    //当N = 10^2时 ，power =2.009225
    //当N = 10^3时 ，power =2.009586
    //当N = 10^4时 ，power =2.005717
    //当N = 10^5时 ，power =2.004560
    
    printf(" \n\n理论值 2  实际值%lf\n\n",power);
    
    
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        long Array[N] ={0};
        
        //生成随机的数组
        for (long i = 0; i < N; i++) {
            
            Array[i]  =arc4random()%N;
            
        }
        
        BubbleSort(Array,N);
        
        
    }
    return 0;
}
