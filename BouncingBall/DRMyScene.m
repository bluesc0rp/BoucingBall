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
    floor.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:floor.size];
    floor.physicsBody.dynamic = NO;
    floor.physicsBody.contactTestBitMask = 0 << 1;
    
    [self addChild:floor];
    
    
    [self addChild:
     [[DRBallNode alloc] initAtPoint:CGPointMake(40, 400)]
    ];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        [self enumerateChildNodesWithName:@"ball" usingBlock:^(SKNode *node, BOOL *stop) {
            NSLog(@"touch %f", node.physicsBody.mass);
            node.position = CGPointMake(node.position.x, node.position.y + 150);
        }];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

- (void)didEndContact:(SKPhysicsContact *)contact {
    NSLog(@"contact");
}

@end
