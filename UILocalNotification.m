//
//  UILocalNotification.m
//  SupplementTracker
//
//  Created by Chris Sheldrick on 6/12/11.
//  Copyright 2011 Chris Sheldrick. All rights reserved.
//

#import "UILocalNotification.h"

@implementation UILocalNotification (incrementBadge)

+(void)setBadge 
{
    NSArray *notifArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
    int count = [notifArray count];
    for (int x = 0; x < count; x++) 
    {
        if (count > 0 )
        {
            UILocalNotification *localNotif = [notifArray objectAtIndex:x];
            [[UIApplication sharedApplication] cancelLocalNotification:localNotif];
            localNotif.applicationIconBadgeNumber = x + 1;
            [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
            NSLog(@"notif: %@ badge %i", localNotif, localNotif.applicationIconBadgeNumber);
        } 
    }

}
@end
