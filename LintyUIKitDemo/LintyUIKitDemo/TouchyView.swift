//
//  TouchyView.swift
//  LintyUIKitDemo
//
//  Created by Quinn McHenry on 5/29/20.
//  Copyright © 2020 Quinn McHenry. All rights reserved.
//

import UIKit

class TouchyView: UIView {
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        super.point(inside: point, with: event)
        return false
    }
    
}
