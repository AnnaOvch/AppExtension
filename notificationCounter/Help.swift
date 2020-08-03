//
//  Help.swift
//  notificationCounter
//
//  Created by Анна on 03.08.2020.
//  Copyright © 2020 anna. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {}

extension UIButton {
    @IBInspectable var cornerRadius: CGFloat {
           set { layer.cornerRadius = newValue  }
           get { return layer.cornerRadius }
       }
}
