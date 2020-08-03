//
//  ViewController.swift
//  notificationCounter
//
//  Created by Анна on 03.08.2020.
//  Copyright © 2020 anna. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
   
    
    private let notificationCenter = UNUserNotificationCenter.current()
    let options: UNAuthorizationOptions = [.alert, .sound, .badge]

    override func viewDidLoad() {
        super.viewDidLoad()
         print("dldldldldl")
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            if !didAllow {
                print("User has declined notifications")
            } else {
                print("allowed")
            }
        }
        
        notificationCenter.getNotificationSettings { (settings) in
          if settings.authorizationStatus != .authorized {
            print("not allowed")
          }
        }
    }
    
    func scheduleNotification(notificationType: String) {
        
        let content = UNMutableNotificationContent() // Содержимое уведомления
        
        content.title = notificationType
        content.body = "This is example how to create " + notificationType
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let identifier = UUID().uuidString
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
    }

   

}

