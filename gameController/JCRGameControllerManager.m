//
//  JCRGameControllerManager.m
//  gameController
//
//  Created by César Manuel Pinto Castillo on 02/05/14.
//  Copyright (c) 2014 JagCesar. All rights reserved.
//

#import "JCRGameControllerManager.h"
#import "JCRGameController.h"

@implementation JCRGameControllerManager

NSMutableDictionary * jcrGameControllerDic;


+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static JCRGameControllerManager *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [JCRGameControllerManager new];
        
        [[NSNotificationCenter defaultCenter] addObserver:sharedInstance
                                                 selector:@selector(__gameControllerConnected:)
                                                     name:GCControllerDidConnectNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:sharedInstance
                                                 selector:@selector(__gameControllerDisconnected:)
                                                     name:GCControllerDidDisconnectNotification
                                                   object:nil];
        
        
        jcrGameControllerDic = [[NSMutableDictionary alloc] init];
    });
    
    
    
    
    
    return sharedInstance;
}

-(NSString *)objectToKey:(NSObject *)object{

    return [NSString stringWithFormat:@"%lu",(unsigned long)object.hash];
}

- (NSDictionary *)connectedJCRGameControllers {
    int i=0;
    for (GCController * controller in [GCController controllers]) {
        if(![jcrGameControllerDic objectForKey:[self objectToKey:controller]])
        {

            
            JCRGameController *gameController = [JCRGameController new];
            [gameController setController:controller];
            [jcrGameControllerDic setObject:gameController forKey:[self objectToKey:controller]];
        }
        if ([controller playerIndex] == -1) {
            [controller setPlayerIndex:i];
        }
        i++;
    }
    
    return jcrGameControllerDic;
}

- (JCRGameController *)firstReadyGameController{
   
    return [[self connectedJCRGameControllers]  objectForKey:[[[self connectedJCRGameControllers] allKeys] firstObject]];
}


#pragma mark - Private functions

- (void)__gameControllerConnected:(NSNotification*)notification {
    if ([[self delegate] respondsToSelector:@selector(connectedGameController:)]) {
        GCController *controller = [notification object];
        NSString * controllerKey = [NSString stringWithFormat:@"%lu",(unsigned long)controller.hash];
        
        [[self delegate] connectedGameController:[[self connectedJCRGameControllers] objectForKey:controllerKey]];
        
    }
}

- (void)__gameControllerDisconnected:(NSNotification*)notification {
    if ([[self delegate] respondsToSelector:@selector(disconnectedGameController:)]) {
        GCController *controller = [notification object];
        NSString * controllerKey = [NSString stringWithFormat:@"%lu",(unsigned long)controller.hash];
        
        [[self delegate] disconnectedGameController:[[self connectedJCRGameControllers] objectForKey:controllerKey]];
    }
}

@end
