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
void BubbleSort1_0(long a[],long n){
    //升序排序
    long compareCount = 0;
    long moveCount    = 0;
    long temp  = 0;
    long j     = 0;
    long i = 0;
    
    
    for (; i < n-1; i++) {
        
        for (j = 0; j < n-i-1; j++) {
            
            compareCount++;
            
            if (a[j] > a[j+1]) {//关键码的比较    //数组中的值在比较，但是一般不这样叫，当数组中的值在比较时叫做关键码  YY? 书上就是这么叫的
                
                temp  = a[j+1];
                a[j+1]  = a[j];//记录的移动     //数组中的值在移动，但是一般不这样叫，当数组中的值在移动时叫做记录  YY?书上就是这么叫的
                a[j]  = temp;
                
                
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


//每一趟排序在两两比较的过程中找到较大值  "正向交换"，找到较小值"逆向交换"，这样每趟排序就会多做一些比较和移动，相比1_0版本的冒泡排序看似效率更好，其实效率一样！！!因为始终是相邻的两个元素移动，没有跳跃式的移动，
void BubbleSort_1_1(int a[],int n){


    int low =0;
    int high = n-1;
    int temp,j;
    while (low <high) {
        
        for (j = low ; j< high; j++) {
            
            
            if (a[j]>a[j+1]) {
                
                temp = a[j+1];
                a[j+1] = a[j];
                a[j]   = temp;
                
            }
            
        }
        high--;
        for (j = high; j>low; j--) {
            
            
            if (a[j]<a[j-1]) {
                
                temp = a[j];
                a[j] = a[j-1];
                a[j-1]= temp;
                
            }
            
        }
        low++;
    }
   
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int Array[N] ={0};
        
        //生成随机的数组
        for (int i = 0; i < N; i++) {
            
            Array[i]  =arc4random()%N;
            
        }

        printf("排序前的数组Array\n");

        for (int i = 0; i < N; i ++) {
            
            printf("Array[%d] = %d\n",i,Array[i]);
        }
        
        BubbleSort_1_1(Array,N);
        
        printf("排序后的数组Array\n");
        
        for (int i = 0; i < N; i ++) {
            
            printf("Array[%d] = %d\n",i,Array[i]);
        }

        
        
    }
    return 0;
}
