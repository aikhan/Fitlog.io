//
//  AlarmListViewController.swift
//  FitLog.io
//
//  Created by Asad Khan on 02/10/2018.
//  Copyright © 2018 Robotika. All rights reserved.
//

import UIKit
import os.log

class AlarmListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var alarmTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        alarmTableView.delegate = self
        alarmTableView.dataSource = self
        alarmTableView.backgroundColor = UIColor.darkGray
        alarmTableView.backgroundView?.alpha = 0.2
        
        // Do any additional setup after loading the view.
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.backgroundColor = UIColor.gray 
        cell.contentView.backgroundColor = UIColor.darkGray
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.isUserInteractionEnabled = true
        for view in self.view.subviews{
            if view is UISwitch{
                view.tag = 100 + indexPath.row
            }
            else if view is UIButton{
                view.tag = 200 + indexPath.row
            }
            let timeLabel : UILabel  = cell.contentView.viewWithTag(1)! as! UILabel
            let dayLabel : UILabel  = cell.contentView.viewWithTag(2)! as! UILabel
            let shortMessageLabel : UILabel  = cell.contentView.viewWithTag(3)! as! UILabel
            if indexPath.row == 1 {
                timeLabel.text = "11:15 am"
                dayLabel.text = "Mon,Tue,Wed,Thu,Fri"
                shortMessageLabel.text = "Enjoy some lunch"
            }else if indexPath.row == 2 {
                timeLabel.text = "03:00 pm"
                dayLabel.text = "Mon,Tue,Wed,Thu,Fri"
                shortMessageLabel.text = "Afternoon Healty snack"
            }
        }
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
    @IBAction func dotsButtonTapped(_ sender: UIButton) {
        print("DOTS Button Clicked with tag \(sender.tag)")
    }
    
    @IBAction func switchTapped(_ sender: UISwitch) {
        print("Tag value is \(sender.tag)")
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailScreenlViewController") as? DetailScreenlViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
        
    }
    
}
