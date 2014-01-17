//
//  DRMyScene.m
//  BouncingBall
//
//  Created by Cyrus on 1/17/14.
//  Copyright (c) 2014 Daniel Ramteke. All rights reserved.
//

#import "DRMyScene.h"
#import "DRBallNode.h"
#import "DRFloorNode.h"
#import "NSObject+DRTap.h"

@interface DRMyScene ()
@property BOOL contentCreated;
@end

@implementation DRMyScene

- (void)didMoveToView: (SKView *) view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

-(void)createSceneContents {
    self.physicsWorld.contactDelegate = self;
    
    self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
    

    NSInteger floorHeight = 10;
    SKSpriteNode* floor =  [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(self.size.width, floorHeight)];
    floor.position = CGPointMake(self.size.width/2.0, 0);
    floor.physicsBody = [[SKPhysicsBody bodyWithRectangleOfSize:floor.size] tap:^(SKPhysicsBody* body) {
        body.dynamic = NO;
        body.categoryBitMask = 1 << 0;
        body.restitution = 0.7;
    }];
    floor.name = @"floor";

    
    [self addChild:floor];
    
    
    [self addChild:[[[DRBallNode alloc] initAtPoint:CGPointMake(self.size.width/2.0, 400)] tap:^(DRBallNode* ball) {
        ball.physicsBody.categoryBitMask = 1 << 1;
        ball.physicsBody.contactTestBitMask =1 << 0;
    }]];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        [self enumerateChildNodesWithName:@"ball" usingBlock:^(SKNode *node, BOOL *stop) {

            [node.physicsBody applyImpulse:CGVectorMake(0, 100)];
        }];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

- (void)didEndContact:(SKPhysicsContact *)contact {
    NSLog(@"body A: %@, body B: %@, Collision impulse: %f",
              contact.bodyA.node.name,
          contact.bodyB.node.name,
          contact.collisionImpulse);

//    [contact.bodyB applyImpulse:CGVectorMake(0,  contact.collisionImpulse/2)];

}

@end
