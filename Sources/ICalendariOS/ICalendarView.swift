//
//  ICalendarView.swift
//  ICalendariOS
//
//  Created by Md Imran Ali on 08/02/25.
//

import UIKit

open class ICalendarView: UIViewController {
    public  weak var delegate: ICalendarViewDelegate?
    public var calendarConfiguration: ICalendarConfiguration?  {
        didSet{
            minimumDate = calendarConfiguration?.minimumDate
            maximumDate = calendarConfiguration?.maximumDate
            tintColor = calendarConfiguration?.tintColor
        }
    }
    private var  minimumDate: Date?
    private var maximumDate: Date?
    private var tintColor: UIColor?
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        if #available(iOS 14.0, *) {
            picker.preferredDatePickerStyle = .inline
        } else {
            
        }
        picker.datePickerMode = .date
        picker.backgroundColor =  .white
        return picker
    }()
    
    
    lazy var cancelBtn: UIButton = {
        let btn = UIButton()
        if #available(iOS 15.0, *) {
            btn.configuration = .tinted()
            btn.setTitle("Cancel", for: .normal)
        } else {
           
        }
        return btn
    }()
    
    
    lazy var doneBtn: UIButton = {
        let btn = UIButton()
        if #available(iOS 15.0, *) {
            btn.configuration = .filled()
            btn.setTitleColor(.white, for: .normal)
            btn.setTitle("Done", for: .normal)
        } else {
           
        }
        return btn
    }()
    
    lazy var btnContainer: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .center
       
        return stack
    }()
   

    open  override func viewDidLoad() {
        super.viewDidLoad()
        
        if minimumDate != nil {
            datePicker.minimumDate = minimumDate
        }
                
        if maximumDate != nil {
            datePicker.maximumDate = maximumDate
        }
        if tintColor != nil {
            datePicker.tintColor = tintColor
            cancelBtn.tintColor = tintColor
            doneBtn.tintColor = tintColor
        }
    
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        btnContainer.addArrangedSubview(cancelBtn)
        btnContainer.addArrangedSubview(doneBtn)
        
        cancelBtn.addTarget(self, action: #selector(cancelBtnAction), for: .touchUpInside)
        doneBtn.addTarget(self, action: #selector(doneBtnAction), for: .touchUpInside)
        let myView = UIView()
        myView.backgroundColor = .white
        myView.clipsToBounds = true
        myView.layer.cornerRadius = 5
        myView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myView)
        myView.addSubview(btnContainer)
        NSLayoutConstraint.activate([
            myView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        
        ])
        
        
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        myView.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
            datePicker.topAnchor.constraint(equalTo: myView.topAnchor, constant: 10),
            datePicker.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -10),
            datePicker.bottomAnchor.constraint(equalTo: btnContainer.bottomAnchor, constant: -50),
            datePicker.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 10),
        ])
        
        btnContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnContainer.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -10),
            btnContainer.bottomAnchor.constraint(equalTo: myView.bottomAnchor, constant: -10),
        ])
        
    }
    
     @objc private func cancelBtnAction(){
         dismiss(animated: true)
        
    }
    
    @objc private func doneBtnAction(){
        dismiss(animated: true) { [self] in
         delegate?.didClickedDoneBtn(selectedDate: datePicker.date)
        }
    }
    public func showCalendarView(){
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overCurrentContext
        if let vc = delegate as? UIViewController {
            vc.present(self, animated: true)
        }
 
    }


}
