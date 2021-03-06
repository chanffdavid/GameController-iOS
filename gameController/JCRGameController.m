//
//  JCRGameController.m
//  gameController
//
//  Created by César Manuel Pinto Castillo on 20/04/14.
//  Copyright (c) 2014 JagCesar. All rights reserved.
//

#import "JCRGameController.h"

@interface JCRGameController ()

@property (nonatomic) GCGamepad *gamepad;
@property (nonatomic) GCExtendedGamepad *extendedGamepad;

@end

@implementation JCRGameController

#pragma mark - Public properties

- (void)setController:(GCController *)controller {
    if (_controller == controller) {
        return;
    }
    
    _controller = controller;
    
    [[self controller] setControllerPausedHandler:^(GCController *controller) {
        if ([self PauseButtonBlock]) {
            self.PauseButtonBlock(controller);
        }
    }];
    
    if ([controller extendedGamepad]) {
        [self setExtendedGamepad:[controller extendedGamepad]];
        [self __setupExtendedGamepad];
    } else if ([controller gamepad]) {
        [self setGamepad:[controller gamepad]];
        [self __setupGamepad];
    }
}

- (JCRGamepadType)gamePadType {
    if ([[self controller] extendedGamepad]) {
        return JCRGamepadTypeExtended;
    } else if ([[self controller] gamepad]) {
        return JCRGamepadTypeSimple;
    } else {
        return JCRGamepadTypeNA;
    }
}

#pragma mark - Private functions

- (void)__setupExtendedGamepad {
    
    GCControllerButtonInput *a = [[self extendedGamepad] buttonA];
    GCControllerButtonInput *b = [[self extendedGamepad] buttonB];
    GCControllerButtonInput *x = [[self extendedGamepad] buttonX];
    GCControllerButtonInput *y = [[self extendedGamepad] buttonY];
    GCControllerButtonInput *leftShoulder = [[self extendedGamepad] leftShoulder];
    GCControllerButtonInput *leftTrigger = [[self extendedGamepad] leftTrigger];
    GCControllerButtonInput *rightShoulder = [[self extendedGamepad] rightShoulder];
    GCControllerButtonInput *rightTrigger = [[self extendedGamepad] rightTrigger];
    
    GCControllerDirectionPad *dPad = [[self extendedGamepad] dpad];
    GCControllerDirectionPad *leftThumbstick = [[self extendedGamepad] leftThumbstick];
    GCControllerDirectionPad *rightThumbstick = [[self extendedGamepad] rightThumbstick];
    
    [a setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self aButtonValueChangeBlock]) {
            self.aButtonValueChangeBlock(button, value, pressed);
        }
    }];
    [b setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self bButtonValueChangeBlock]) {
            self.bButtonValueChangeBlock(button, value, pressed);
        }
    }];
    [x setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self xButtonValueChangeBlock]) {
            self.xButtonValueChangeBlock(button, value, pressed);
        }
    }];
    [y setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self yButtonValueChangeBlock]) {
            self.yButtonValueChangeBlock(button, value, pressed);
        }
    }];
    [leftShoulder setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self leftShoulderButtonValueChangeBlock]) {
            self.leftShoulderButtonValueChangeBlock(button,value,pressed);
        }
    }];
    [leftTrigger setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self leftTriggerButtonValueChangeBlock]) {
            self.leftTriggerButtonValueChangeBlock(button,value,pressed);
        }
    }];
    [rightShoulder setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self rightShoulderButtonValueChangeBlock]) {
            self.rightShoulderButtonValueChangeBlock(button,value,pressed);
        }
    }];
    [rightTrigger setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self rightTriggerButtonValueChangeBlock]) {
            self.rightTriggerButtonValueChangeBlock(button,value,pressed);
        }
    }];
    
    [a setPressedChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self aButtonPressedChangeBlock] && pressed) {
            self.aButtonPressedChangeBlock(button, value, pressed);
        }
    }];
    [b setPressedChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self bButtonPressedChangeBlock] && pressed) {
            self.bButtonPressedChangeBlock(button, value, pressed);
        }
    }];
    [x setPressedChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self xButtonPressedChangeBlock] && pressed) {
            self.xButtonPressedChangeBlock(button, value, pressed);
        }
    }];
    [y setPressedChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self yButtonPressedChangeBlock] && pressed) {
            self.yButtonPressedChangeBlock(button, value, pressed);
        }
    }];
    [leftShoulder setPressedChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self leftShoulderButtonPressedChangeBlock] && pressed) {
            self.leftShoulderButtonPressedChangeBlock(button,value,pressed);
        }
    }];
    [leftTrigger setPressedChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self leftTriggerButtonPressedChangeBlock] && pressed) {
            self.leftTriggerButtonPressedChangeBlock(button,value,pressed);
        }
    }];
    [rightShoulder setPressedChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self rightShoulderButtonPressedChangeBlock] && pressed) {
            self.rightShoulderButtonPressedChangeBlock(button,value,pressed);
        }
    }];
    [rightTrigger setPressedChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self rightTriggerButtonPressedChangeBlock] && pressed) {
            self.rightTriggerButtonPressedChangeBlock(button,value,pressed);
        }
    }];
    
    // DPad and sticks
    [dPad setValueChangedHandler:^(GCControllerDirectionPad *dpad, float xValue, float yValue){
        if ([self dPadBlock]) {
            self.dPadBlock(dpad,xValue,yValue);
        }
    }];
    [leftThumbstick setValueChangedHandler:^(GCControllerDirectionPad *dpad, float xValue, float yValue){
        if ([self leftThumbstickBlock]) {
            self.leftThumbstickBlock(dpad,xValue,yValue);
        }
    }];
    [rightThumbstick setValueChangedHandler:^(GCControllerDirectionPad *dpad, float xValue, float yValue){
        if ([self rightThumbstickBlock]) {
            self.rightThumbstickBlock(dpad,xValue,yValue);
        }
    }];
}

- (void)__setupGamepad {
    
    GCControllerButtonInput *a = [[self gamepad] buttonA];
    GCControllerButtonInput *b = [[self gamepad] buttonB];
    GCControllerButtonInput *x = [[self gamepad] buttonX];
    GCControllerButtonInput *y = [[self gamepad] buttonY];
    GCControllerButtonInput *leftShoulder = [[self gamepad] leftShoulder];
    GCControllerButtonInput *rightShoulder = [[self gamepad] rightShoulder];
    
    GCControllerDirectionPad *dPad = [[self gamepad] dpad];
    
    [a setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self aButtonValueChangeBlock]) {
            self.aButtonValueChangeBlock(button, value, pressed);
        }
    }];
    [b setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self bButtonValueChangeBlock]) {
            self.bButtonValueChangeBlock(button, value, pressed);
        }
    }];
    [x setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self xButtonValueChangeBlock]) {
            self.xButtonValueChangeBlock(button, value, pressed);
        }
    }];
    [y setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self yButtonValueChangeBlock]) {
            self.yButtonValueChangeBlock(button, value, pressed);
        }
    }];
    [leftShoulder setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self leftShoulderButtonValueChangeBlock]) {
            self.leftShoulderButtonValueChangeBlock(button,value,pressed);
        }
    }];
    [rightShoulder setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self rightShoulderButtonValueChangeBlock]) {
            self.rightShoulderButtonValueChangeBlock(button,value,pressed);
        }
    }];
    
    
    [a setPressedChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self aButtonPressedChangeBlock] && pressed) {
            self.aButtonPressedChangeBlock(button, value, pressed);
        }
    }];
    [b setPressedChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self bButtonPressedChangeBlock] && pressed) {
            self.bButtonPressedChangeBlock(button, value, pressed);
        }
    }];
    [x setPressedChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self xButtonPressedChangeBlock] && pressed) {
            self.xButtonPressedChangeBlock(button, value, pressed);
        }
    }];
    [y setPressedChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self yButtonPressedChangeBlock] && pressed) {
            self.yButtonPressedChangeBlock(button, value, pressed);
        }
    }];
    [leftShoulder setPressedChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self leftShoulderButtonPressedChangeBlock] && pressed) {
            self.leftShoulderButtonPressedChangeBlock(button,value,pressed);
        }
    }];
    [rightShoulder setPressedChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self rightShoulderButtonPressedChangeBlock] && pressed) {
            self.rightShoulderButtonPressedChangeBlock(button,value,pressed);
        }
    }];
    
    // DPad and sticks
    [dPad setValueChangedHandler:^(GCControllerDirectionPad *dpad, float xValue, float yValue){
        if ([self dPadBlock]) {
            self.dPadBlock(dpad,xValue,yValue);
        }
    }];
}

@end
