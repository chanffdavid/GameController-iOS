//
//  JCRGameControllerConnectedViewController.m
//  gameController
//
//  Created by César Manuel Pinto Castillo on 18/04/14.
//  Copyright (c) 2014 JagCesar. All rights reserved.
//

#import "JCRGameControllerConnectedViewController.h"
#import "JCRGameControllerManager.h"
#import "JCRGameController.h"

@interface JCRGameControllerConnectedViewController () <JCRGameControllerManagerDelegate>

@property (nonatomic) UITextView *textView;

@end

@implementation JCRGameControllerConnectedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[self view] setBackgroundColor:[UIColor blueColor]];
        
        [self setTextView:[UITextView new]];
        [[self textView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
        [[self textView] setFrame:[[self view] bounds]];
        [[self view] addSubview:[self textView]];
        [self __logMessage:@"TextView created"];
        
        [[JCRGameControllerManager sharedInstance] setDelegate:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (JCRGameController * gameController in [[[JCRGameControllerManager sharedInstance] connectedJCRGameControllers] allValues])
    {
        [self setupGameController:gameController];
    }
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private functions

- (void)__logMessage:(NSString*)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self textView] setText:[NSString stringWithFormat:@"%@\n%@", message, [[self textView] text]]];
    });
}

#pragma mark - JCRGameControllerManagerDelegate

- (void)setupGameController:(JCRGameController *)gameController {
    
    NSInteger playerIndex = [[gameController controller] playerIndex];
    
    [gameController setPauseButtonBlock:^(GCController *controller) {
        [self __logMessage:[NSString stringWithFormat:@" %ld Pause!",(long)playerIndex]];
    }];
    
    [gameController setAButtonValueChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
     [self __logMessage:[NSString stringWithFormat:@" %ld A",(long)playerIndex]];
    }];
    
    [gameController setBButtonValueChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:[NSString stringWithFormat:@" %ld B",(long)playerIndex]];
    }];
    
    [gameController setXButtonValueChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:[NSString stringWithFormat:@" %ld X",(long)playerIndex]];
    }];
    
    [gameController setYButtonValueChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:[NSString stringWithFormat:@" %ld Y",(long)playerIndex]];
    }];
    
    [gameController setLeftShoulderButtonValueChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:[NSString stringWithFormat:@" %ld Left shoulder",(long)playerIndex]];
    }];
    
    [gameController setRightShoulderButtonValueChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:[NSString stringWithFormat:@" %ld Right shoulder",(long)playerIndex]];
    }];
    
    [gameController setLeftTriggerButtonValueChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:[NSString stringWithFormat:@" %ld Left trigger",(long)playerIndex]];
    }];
    
    [gameController setRightTriggerButtonValueChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:[NSString stringWithFormat:@" %ld Right trigger",(long)playerIndex]];
    }];
    
    [gameController setAButtonPressedChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:[NSString stringWithFormat:@" %ld A pressed",(long)playerIndex]];
    }];
    
    [gameController setBButtonPressedChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:[NSString stringWithFormat:@" %ld B pressed",(long)playerIndex]];
    }];
    
    [gameController setXButtonPressedChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:[NSString stringWithFormat:@" %ld X pressed",(long)playerIndex]];
    }];
    
    [gameController setYButtonPressedChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:[NSString stringWithFormat:@" %ld Y pressed",(long)playerIndex]];
    }];
    
    [gameController setLeftShoulderButtonPressedChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:[NSString stringWithFormat:@" %ld Left shoulder pressed",(long)playerIndex]];
    }];
    
    [gameController setRightShoulderButtonPressedChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:[NSString stringWithFormat:@" %ld Right shoulder pressed",(long)playerIndex]];
    }];
    
    [gameController setLeftTriggerButtonPressedChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:[NSString stringWithFormat:@" %ld Left trigger pressed",(long)playerIndex]];
    }];
    
    [gameController setRightTriggerButtonPressedChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:[NSString stringWithFormat:@" %ld Right trigger pressed",(long)playerIndex]];
    }];
    
    [gameController setLeftThumbstickBlock:^(GCControllerDirectionPad *dpad, float xValue, float yValue) {
        [self __logMessage:[NSString stringWithFormat:@" %ld Left Thumbstick -- X: %f || F: %f",(long)playerIndex , xValue, yValue]];
    }];
    
    [gameController setRightThumbstickBlock:^(GCControllerDirectionPad *dpad, float xValue, float yValue) {
        [self __logMessage:[NSString stringWithFormat:@" %ld Right Thumbstick -- X: %f || F: %f",(long)playerIndex , xValue, yValue]];
    }];
    
    [gameController setDPadBlock:^(GCControllerDirectionPad *dpad, float xValue, float yValue) {
        [self __logMessage:[NSString stringWithFormat:@" %ld DPad Thumbstick -- X: %f || F: %f",(long)playerIndex , xValue, yValue]];
    }];
}


- (void)connectedGameController:(JCRGameController *)gameController {
    NSLog(@"- Gamecontroller connected %ld", (long)gameController.controller.playerIndex);
    [self setupGameController:gameController];
}

- (void)disconnectedGameController:(JCRGameController *)gameController{
    NSLog(@"- Gamecontroller disconnected %ld", (long)gameController.controller.playerIndex);
}

@end
