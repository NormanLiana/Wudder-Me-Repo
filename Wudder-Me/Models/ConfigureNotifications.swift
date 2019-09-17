//
//  ConfigureNotifications.swift
//  Wudder-Me
//
//  Created by EricM on 9/17/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation
import UserNotifications

struct MakeNotification {
    
    static func configureAlerts(identify:String, title: String, subtitle: String, body: String, time: Double){
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: true)
        let request = UNNotificationRequest(identifier: identify, content: content, trigger: trigger)
        center.add(request) {error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

