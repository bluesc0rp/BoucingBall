//
//  DRBallNode.m
//  BouncingBall
//
//  Created by Cyrus on 1/17/14.
//  Copyright (c) 2014 Daniel Ramteke. All rights reserved.
//

#import "DRBallNode.h"

@implementation DRBallNode
-(id)initAtPoint:(CGPoint)point {
    self = [super initWithImageNamed:@"ball"];
    if (self) {
        self.name = @"ball";
        self.position = point;
        self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:(self.size.width/2.0)];
        self.physicsBody.usesPreciseCollisionDetection = YES;
        self.physicsBody.density = 1;
        self.physicsBody.categoryBitMask = 1 << 1;
        self.physicsBody.contactTestBitMask = 1 << 0;
    }
    return self;
}
@end
