//
//  DRViewController.m
//  BouncingBall
//
//  Created by Cyrus on 1/17/14.
//  Copyright (c) 2014 Daniel Ramteke. All rights reserved.
//

#import "DRViewController.h"
#import "DRMyScene.h"

@implementation DRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    NSLog(@"bounds: %f, %f", skView.bounds.size.width, skView.bounds.size.height);
    SKScene * scene = [DRMyScene sceneWithSize:CGSizeMake( skView.bounds.size.height, skView.bounds.size.width)];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
