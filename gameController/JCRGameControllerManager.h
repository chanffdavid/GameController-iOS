//
//  JCRGameControllerManager.h
//  gameController
//
//  Created by César Manuel Pinto Castillo on 02/05/14.
//  Copyright (c) 2014 JagCesar. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JCRGameControllerManager;
@class JCRGameController;

@protocol JCRGameControllerManagerDelegate <NSObject>

@required

- (void)connectedGameController:(JCRGameController *)gameController;
- (void)disconnectedGameController:(JCRGameController *)gameController;


@end

@interface JCRGameControllerManager : NSObject

@property (nonatomic,assign) id <JCRGameControllerManagerDelegate> delegate;

+ (instancetype)sharedInstance;
- (JCRGameController *)firstReadyGameController;
- (NSDictionary *)connectedJCRGameControllers;

@end
