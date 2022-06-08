//
//  Device.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 8/6/22.
//

import UIKit

enum Device {
    static var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    static var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}
