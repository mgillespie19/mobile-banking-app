//
//  mainScrollView.swift
//  cardable
//
//  Created by Max Gillespie on 11/26/18.
//  Copyright © 2018 Max Gillespie. All rights reserved.
//

import Foundation
import UIKit


class PageViewController: UIPageViewController
{
    fileprivate lazy var pages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: "landing"),
            self.getViewController(withIdentifier: "debit"),
            self.getViewController(withIdentifier: "credit")
        ]
    }()
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate   = self
        
        
        if let firstVC = pages.first
        {
            setViewControllers([firstVC], direction: .reverse, animated: true, completion: nil)
        }
    }
    
    func setupPageView () {
        pages.append(creditView())
        pages.append(debitView())
        pages.append(landingView())
    }
}

extension PageViewController: UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        
        print(viewControllerIndex)
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0
            else {
                if previousIndex == -1 {
                    return pages.last
                }
                else {
                    return nil
                }
            }
        
        if viewControllerIndex == 2 {
            return nil
        }
        
        guard pages.count - 1 > previousIndex else { return nil }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
       guard nextIndex < pages.count - 1 else { return nil }
        
        guard pages.count - 1 > nextIndex else { return nil         }
        
        return pages[nextIndex]
    }
}

extension PageViewController: UIPageViewControllerDelegate { }
