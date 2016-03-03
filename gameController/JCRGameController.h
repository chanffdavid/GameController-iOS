//
//  JCRGameController.h
//  gameController
//
//  Created by César Manuel Pinto Castillo on 20/04/14.
//  Copyright (c) 2014 JagCesar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameController/GameController.h>

typedef NS_ENUM(NSInteger, JCRGamepadType) {
    JCRGamepadTypeSimple,
    JCRGamepadTypeExtended,
    JCRGamepadTypeNA
};

@interface JCRGameController : NSObject

typedef void (^JCRGameControllerPauseBlock)(GCController* controller);
typedef void (^JCRGameControllerButtonValueChangeBlock)(GCControllerButtonInput *button, float value, BOOL pressed);
typedef void (^JCRGameControllerDirectionPadBlock)(GCControllerDirectionPad *dpad, float xValue, float yValue);

@property (nonatomic,strong) GCController *controller;
@property (nonatomic) JCRGamepadType gamePadType;

@property (copy) JCRGameControllerPauseBlock PauseButtonBlock;

@property (copy) JCRGameControllerButtonValueChangeBlock aButtonValueChangeBlock;
@property (copy) JCRGameControllerButtonValueChangeBlock bButtonValueChangeBlock;
@property (copy) JCRGameControllerButtonValueChangeBlock xButtonValueChangeBlock;
@property (copy) JCRGameControllerButtonValueChangeBlock yButtonValueChangeBlock;

@property (copy) JCRGameControllerButtonValueChangeBlock leftShoulderButtonValueChangeBlock;
@property (copy) JCRGameControllerButtonValueChangeBlock rightShoulderButtonValueChangeBlock;
@property (copy) JCRGameControllerButtonValueChangeBlock leftTriggerButtonValueChangeBlock;
@property (copy) JCRGameControllerButtonValueChangeBlock rightTriggerButtonValueChangeBlock;

@property (copy) JCRGameControllerDirectionPadBlock dPadBlock;
@property (copy) JCRGameControllerDirectionPadBlock leftThumbstickBlock;
@property (copy) JCRGameControllerDirectionPadBlock rightThumbstickBlock;

// The only reason we have these set-functions is because xCode isn't doing
// proper auto completion on the above properties.

- (void)setPauseButtonBlock:(JCRGameControllerPauseBlock)PauseButtonBlock;

- (void)setAButtonValueChangeBlock:(JCRGameControllerButtonValueChangeBlock)aButtonValueChangeBlock;
- (void)setBButtonValueChangeBlock:(JCRGameControllerButtonValueChangeBlock)bButtonValueChangeBlock;
- (void)setXButtonValueChangeBlock:(JCRGameControllerButtonValueChangeBlock)xButtonValueChangeBlock;
- (void)setYButtonValueChangeBlock:(JCRGameControllerButtonValueChangeBlock)yButtonValueChangeBlock;

- (void)setLeftShoulderButtonValueChangeBlock:(JCRGameControllerButtonValueChangeBlock)leftShoulderButtonValueChangeBlock;
- (void)setRightShoulderButtonValueChangeBlock:(JCRGameControllerButtonValueChangeBlock)rightShoulderButtonValueChangeBlock;
- (void)setLeftTriggerButtonValueChangeBlock:(JCRGameControllerButtonValueChangeBlock)leftTriggerButtonValueChangeBlock;
- (void)setRightTriggerButtonValueChangeBlock:(JCRGameControllerButtonValueChangeBlock)rightTriggerButtonValueChangeBlock;

- (void)setDPadBlock:(JCRGameControllerDirectionPadBlock)dPadBlock;
- (void)setLeftThumbstickBlock:(JCRGameControllerDirectionPadBlock)leftThumbstickBlock;
- (void)setRightThumbstickBlock:(JCRGameControllerDirectionPadBlock)rightThumbstickBlock;

@end
