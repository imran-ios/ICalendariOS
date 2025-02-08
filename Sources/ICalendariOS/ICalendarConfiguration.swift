//
//  ICalendarConfiguration.swift
//  ICalendariOS
//
//  Created by Md Imran Ali on 08/02/25.
//

import UIKit

public struct ICalendarConfiguration {
    public var  minimumDate: Date? =  nil
    public var maximumDate: Date? = nil
    public var tintColor: UIColor = UIColor.tintColor
    public  init(minimumDate: Date? = nil, maximumDate: Date? = nil, tintColor: UIColor) {
        self.minimumDate = minimumDate
        self.maximumDate = maximumDate
        self.tintColor = tintColor
    }
}
