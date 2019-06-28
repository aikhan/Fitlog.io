//
//  SelectAgeViewController.swift
//  FitLog.io
//
//  Created by Asad Khan on 01/10/2018.
//  Copyright © 2018 Robotika. All rights reserved.
//

import UIKit
import os.log

class SelectAgeViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var agePickerView: UIPickerView!
    var ageArray = Array(12...100)
    var delegate: PageViewCustomDelegate!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageArray.count
    }
  
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view as? UILabel { label = v }
        label.font = UIFont (name: "HelveticaNeue-Bold", size: 40)
        label.textColor = UIColor.white
        label.text =  "\(ageArray[row])"
        label.textAlignment = .center
        return label
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonTapped(_ sender: Any) {
        os_log("Next button Tapped", type: .debug)
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        os_log("Back button Tapped", type: .debug)
        delegate.goPreviousPage!(forwardTo: 0)
    }
}
