//
//  Tester.m
//  BlockTest
//
//  Created by Ronald Hernandez on 6/8/15.
//  Copyright (c) 2015 Wahoo. All rights reserved.
//

#import "BlockTester.h"
@interface BlockTester()
//creating a block as a property to use later.
@property (nonatomic, copy) void (^block)(id, NSUInteger, BOOL *);

@end
@implementation BlockTester


-(void)runTest{

    //Creating and Calling a block.
    void (^MyBlock)(id,NSUInteger, BOOL *) = ^(id obj, NSUInteger ind, BOOL *stop){
        NSLog(@"Video game: %@", (NSString *)obj);

    };

    BOOL stop;

    MyBlock(@"Tekken", 0, &stop);

    //2 - Passing a block to a method.

    NSArray *videoGames = @[@"Fallout 2", @"Need For Speed", @"Mario"];
    [videoGames enumerateObjectsUsingBlock:MyBlock];


    //3 - IN line form
        NSString *favoriteGame = @"Super Mario";
    [videoGames enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
          NSLog(@"Video game: %@", (NSString *)obj);

        NSString *game = (NSString *)obj;
        if ([game isEqualToString:favoriteGame]) {
            NSLog(@"%@", favoriteGame  );
        }
    }];


    //4 - test it.
    [self doSomethingWithBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"Done");
    }];




}

-(void)doSomethingWithBlock:(void (^)(id, NSUInteger, BOOL*))block {

    self.block = block;

    [self performSelector:@selector(afterOneSecond) withObject:nil afterDelay:1.0];


}
-(void)afterOneSecond{
    BOOL stop;
    self.block(@"Pokemon", 0, &stop);
}

@end
