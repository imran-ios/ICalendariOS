//
//  File.swift
//  ICalendariOS
//
//  Created by Md Imran Ali on 08/02/25.
//

import Foundation

/// Description
public protocol ICalendarViewDelegate: AnyObject {
    
    /// didClickedDoneBtn(selectedDate: Date)  is called when user  click on done button
    /// - Parameter selectedDate: selected date is user selected date
    func didClickedDoneBtn(selectedDate: Date)
}
