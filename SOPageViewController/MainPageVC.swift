//
//  MainPageVC.swift
//  SOPageViewController
//
//  Created by Hitesh on 9/20/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit

class MainPageVC: UIPageViewController, UIPageViewControllerDataSource {
    
    var arrViewControllers: [UIViewController]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create array of ViewControllers
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let firstVC = storyBoard.instantiateViewControllerWithIdentifier("FirstVCID")
        let secondVC = storyBoard.instantiateViewControllerWithIdentifier("SecondVCID")
        let thirdVC = storyBoard.instantiateViewControllerWithIdentifier("ThirdVCID")
        
        arrViewControllers = [firstVC, secondVC, thirdVC]
        
        self.dataSource = self
        
        //Get fist viewcontroller show in screen.
        self.setViewControllers([arrViewControllers![0]], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        /*
        if let objFirstVC = arrViewControllers!.first {
            setViewControllers([objFirstVC],
                               direction: .Forward,
                               animated: true,
                               completion: nil)
        }*/
        // Do any additional setup after loading the view.
    }
    

    
    //MARK: DataSource of UIPageViewController
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = arrViewControllers!.indexOf(viewController) else {
            return nil
        }
        
        let preIndex = vcIndex - 1
        
        guard preIndex >= 0 else {
            return nil
        }
        
        guard arrViewControllers!.count > preIndex else {
            return nil
        }
        
        return arrViewControllers![preIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = arrViewControllers!.indexOf(viewController) else {
            return nil
        }
        
        let nextIndex = vcIndex + 1
        let vcCount = arrViewControllers!.count
        
        guard vcCount != nextIndex else {
            return nil
        }
        
        guard vcCount > nextIndex else {
            return nil
        }
        
        return arrViewControllers![nextIndex]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
