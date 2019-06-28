//
//  FitLogoBackgroundViewController.swift
//  FitLog.io
//
//  Created by Asad Khan on 01/10/2018.
//  Copyright © 2018 Robotika. All rights reserved.
//

import UIKit


class FitLogoBackgroundViewController: UIViewController {

        override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view.
        //Add background Image
        
        let backgroundImage = UIImage(named: "background.png")
        let backgroundImageView = UIImageView(image: backgroundImage!)
        backgroundImageView.frame = UIScreen.main.bounds
        self.view.addSubview(backgroundImageView)
        
        //Add Logo
        let logoImage = UIImage(named: "logo.png")
        let logoImageView = UIImageView(image: logoImage!)
        let point = CGPoint(x: backgroundImageView.frame.midX - (logoImage!.size.width/8), y:150)//We need to get half the size of logo so we need to divide by 2, 8 here because we're already scaling it down by a factor of 4
        let size = CGSize(width: logoImageView.frame.size.width/4, height:logoImageView.frame.size.height/4)
        logoImageView.frame = CGRect(origin: point, size:size)
        //logoImageView.contentMode = .scaleAspectFit
        backgroundImageView.addSubview(logoImageView)
        
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
