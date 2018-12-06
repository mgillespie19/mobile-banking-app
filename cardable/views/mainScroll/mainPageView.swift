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
    
    init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [String : Any]? = nil) {
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let landing = landingView()
    let debit = debitView()
    let credit = creditView()
    
    fileprivate lazy var pages: [UIViewController] = {
        return [
            landing,
            credit,
            debit
        ]
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
                
        setupPageView()
    }
    
    func setupPageView () {
        self.dataSource = self
        self.delegate   = self
        
        if let firstVC = pages.first
        {
            setViewControllers([firstVC], direction: .reverse, animated: true, completion: nil)
        }
        
        createGradientLayer(v: self.view, colors: [Preferences.accentColor.cgColor, Preferences.moneyGreen.cgColor], rotation: Preferences.gradientPref, locations: [0.32, 1.3])
    }

}

// PAGE VIEW DATA SOURCE
extension PageViewController: UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
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

// PAGE VIEW DELEGATE
extension PageViewController: UIPageViewControllerDelegate {
    
    
}
