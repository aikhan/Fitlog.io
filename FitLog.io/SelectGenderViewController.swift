//
//  SelectGenderViewController.swift
//  FitLog.io
//
//  Created by Asad Khan on 01/10/2018.
//  Copyright © 2018 Robotika. All rights reserved.
//

import UIKit
import os.log

class SelectGenderViewController: UIViewController {
    
    @IBOutlet weak var largeLabel: UILabel!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    var delegate: PageViewCustomDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nextButton.isEnabled = false
        nextButton.setTitleColor(UIColor.darkGray, for: .normal)
        
        self.view.bringSubview(toFront: nextButton)
        self.view.bringSubview(toFront: backButton)
    }
    
    @IBAction func maleButtonTapped(_ sender: Any) {
        os_log("Male button Tapped", type: .debug)
        maleButton.setImage(UIImage(named: "male-green.png"), for: UIControlState.normal)
        femaleButton.setImage(UIImage(named: "female-gray.png"), for: UIControlState.normal)
        nextButton.isEnabled = true
        nextButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    @IBAction func femaleButtonTapped(_ sender: Any) {
        os_log("Female button Tapped", type: .debug)
        maleButton.setImage(UIImage(named: "male-gray.png"), for: UIControlState.normal)
        femaleButton.setImage(UIImage(named: "female-green.png"), for: UIControlState.normal)
        nextButton.isEnabled = true
        nextButton.setTitleColor(UIColor.white, for: .normal)
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        os_log("Back button Tapped", type: .debug)
        //delegate.goPreviousPage!(fowardTo: 0)
    }
    @IBAction func nextButtonTapped(_ sender: Any) {
        os_log("NEXT button Tapped", type: .debug)
        delegate.goNextPage!(forwardTo: 1)
    }
    
    /*
    func updateIndicator(with percent: Double, isAnimated: Bool = false) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = progressShape.strokeEnd
        animation.toValue = percent / 100.0
        animation.duration = 2.5
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut);
        
        
        let shortestSide = min(view.frame.size.width, view.frame.size.height) - 30
        let strokeWidth: CGFloat = 7.0
        let frame = CGRect(x:100, y:100, width:150, height:150 )//CGRect(x: 0, y: 0, width: shortestSide - strokeWidth, height: shortestSide - strokeWidth)
        
        
        backgroundShape.frame = frame
        backgroundShape.position = view.center
        backgroundShape.path = UIBezierPath(ovalIn: frame).cgPath
        backgroundShape.strokeColor = UIColor.darkGray.cgColor
        backgroundShape.lineWidth = strokeWidth
        backgroundShape.fillColor = UIColor.clear.cgColor
        
        progressShape.frame = frame
        progressShape.path = backgroundShape.path
        progressShape.position = backgroundShape.position
        progressShape.strokeColor = UIColor.green.cgColor
        progressShape.lineWidth = backgroundShape.lineWidth
        progressShape.fillColor = UIColor.clear.cgColor
        progressShape.strokeEnd = CGFloat(percent/100.0)
        
        if isAnimated {
            progressShape.add(animation, forKey: nil)
        }
    }
    */
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
