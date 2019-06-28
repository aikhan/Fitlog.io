//
//  DetailScreenlViewController.swift
//  FitLog.io
//
//  Created by Asad Khan on 02/10/2018.
//  Copyright © 2018 Robotika. All rights reserved.
//

import UIKit

class DetailScreenlViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var containerViewForDays: UIView!
    
    @IBOutlet weak var labelContainerView: UIView!
    @IBOutlet weak var selectedAlarmContainer: UIView!
    
    @IBAction func dayButtonTapped(_ sender: UIButton) {
        if sender.backgroundColor != UIColor.green{
            sender.backgroundColor = UIColor.green
        }else if sender.backgroundColor == UIColor.green{
            sender.backgroundColor = UIColor.gray
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        // Do any additional setup after loading the view.
        containerViewForDays.layer.cornerRadius = 10
        containerViewForDays.backgroundColor = UIColor.gray
        containerViewForDays.alpha = 0.7
        
        labelContainerView.layer.cornerRadius = 10
        labelContainerView.backgroundColor = UIColor.gray
        labelContainerView.alpha = 0.7
        
        selectedAlarmContainer.layer.cornerRadius = 10
        selectedAlarmContainer.backgroundColor = UIColor.gray
        selectedAlarmContainer.alpha = 0.7
    }

    @IBAction func selectAlarmTapped(_ sender: Any) {
        print("select alarm tapped")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
