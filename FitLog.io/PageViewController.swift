//
//  PageViewController.swift
//  FitLog.io
//
//  Created by Asad Khan on 01/10/2018.
//  Copyright © 2018 Robotika. All rights reserved.
//

import UIKit

@objc protocol PageViewCustomDelegate {
    @objc optional func goNextPage(forwardTo position: Int)
    @objc optional func goPreviousPage(forwardTo position: Int)
}

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource, PageViewCustomDelegate{
    
    lazy var subViewControllers:[UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectGenderViewController") as! SelectGenderViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectAgeViewController") as! SelectAgeViewController
        ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        
        setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)
        
        let genderVC = subViewControllers[0] as! SelectGenderViewController
        genderVC.delegate = self
        
        let ageVC = subViewControllers[1] as! SelectAgeViewController
        ageVC.delegate = self    
    }
    
    func goNextPage(forwardTo position: Int) {
        let viewController = self.subViewControllers[position]
        setViewControllers([viewController], direction:
            UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
    }
    
    func goPreviousPage(forwardTo position: Int) {
        let viewController = self.subViewControllers[position]
        setViewControllers([viewController], direction:
            UIPageViewControllerNavigationDirection.reverse, animated: true, completion: nil)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews{
            if view is UIScrollView{
                view.frame = UIScreen.main.bounds
            }else if view is UIPageControl{
                view.backgroundColor = UIColor.clear
                let pageControl = view as! UIPageControl
                pageControl.pageIndicatorTintColor = UIColor.darkGray
                pageControl.currentPageIndicatorTintColor  = UIColor.green
                pageControl.clipsToBounds = true
                pageControl.isUserInteractionEnabled = false
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int{
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = subViewControllers.index(of: firstViewController) else {
          return 0
        }
        return firstViewControllerIndex
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.index(of: viewController) ?? 0
        if(currentIndex <= 0) {
            return nil
        }
        return subViewControllers[currentIndex-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.index(of: viewController) ?? 0
        if(currentIndex >= subViewControllers.count-1) {
            return nil
        }
        return subViewControllers[currentIndex+1]
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
