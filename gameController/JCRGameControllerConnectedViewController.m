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

- (void)gameControllerManager:(JCRGameControllerManager *)manager
      gameControllerConnected:(JCRGameController *)gameController {
    
    NSInteger playerIndex = [[gameController controller] playerIndex];
    [self __logMessage:[NSString stringWithFormat:@"+ Gamecontroller connected with index: %ld", (long)playerIndex]];
    
    [gameController setPauseButtonBlock:^(GCController *controller) {
        [self __logMessage:@"Pause!"];
    }];
    
    [gameController setAButtonValueChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"A"];
    }];
    
    [gameController setBButtonValueChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"B"];
    }];
    
    [gameController setXButtonValueChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"X"];
    }];
    
    [gameController setYButtonValueChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"Y"];
    }];
    
    [gameController setLeftShoulderButtonValueChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"Left shoulder"];
    }];
    
    [gameController setRightShoulderButtonValueChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"Right shoulder"];
    }];
    
    [gameController setLeftTriggerButtonValueChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"Left trigger"];
    }];
    
    [gameController setRightTriggerButtonValueChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"Right trigger"];
    }];
    
    [gameController setAButtonPressedChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"A pressed"];
    }];
    
    [gameController setBButtonPressedChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"B pressed"];
    }];
    
    [gameController setXButtonPressedChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"X pressed"];
    }];
    
    [gameController setYButtonPressedChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"Y pressed"];
    }];
    
    [gameController setLeftShoulderButtonPressedChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"Left shoulder pressed"];
    }];
    
    [gameController setRightShoulderButtonPressedChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"Right shoulder pressed"];
    }];
    
    [gameController setLeftTriggerButtonPressedChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"Left trigger pressed"];
    }];
    
    [gameController setRightTriggerButtonPressedChangeBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"Right trigger pressed"];
    }];
    
    [gameController setLeftThumbstickBlock:^(GCControllerDirectionPad *dpad, float xValue, float yValue) {
        [self __logMessage:[NSString stringWithFormat:@"Left Thumbstick -- X: %f || F: %f", xValue, yValue]];
    }];
    
    [gameController setRightThumbstickBlock:^(GCControllerDirectionPad *dpad, float xValue, float yValue) {
        [self __logMessage:[NSString stringWithFormat:@"Right Thumbstick -- X: %f || F: %f", xValue, yValue]];
    }];
    
    [gameController setDPadBlock:^(GCControllerDirectionPad *dpad, float xValue, float yValue) {
        [self __logMessage:[NSString stringWithFormat:@"Dpad -- X: %f || F: %f", xValue, yValue]];
    }];
}

- (void)gameControllerManagerGameControllerDisconnected:(JCRGameControllerManager *)manager {
    [self __logMessage:@"- Gamecontroller disconnected"];
}

@end
