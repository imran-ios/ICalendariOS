# ICalenderiOS

## Installation

To install this package to your iOS application import `https://github.com/imran-ios/ICalendariOS.git` using SPM


## Uses Example

import  `ICalendariOS` in your file

```swift
let calenderView = ICalendarView()
calenderView.delegate = self
calenderView.calendarConfiguration = ICalendarConfiguration(tintColor: .systemYellow)
calenderView.showCalendarView()

```



To get selected date Confirm `ICalendarViewDelegate`

```swift
extension ViewController:ICalendarViewDelegate {
    func didClickedDoneBtn(selectedDate: Date) {
        print("selected Date===\(selectedDate.formatted(date: .complete, time: .omitted))")
    }
    
}


```
![image alt](https://github.com/imran-ios/ICalendariOS/blob/main/Sources/Assets/ICalendar.png)
