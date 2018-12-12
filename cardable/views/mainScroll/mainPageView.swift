//
//  mainScrollView.swift
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
        
        self.view.addSubview(leftBtn)
        self.view.addSubview(midBtn)
        self.view.addSubview(rightBtn)
        
        if let firstVC = pages.first
        {
            setViewControllers([firstVC], direction: .reverse, animated: true, completion: nil)
        }
        
        createGradientLayer(v: self.view, colors: [Preferences.accentColor.cgColor, Preferences.moneyGreen.cgColor], rotation: Preferences.gradientPref, locations: [0.32, 1.3])
    }
    
    @objc func goLeft() {
        print("go left")
    }
    
    @objc func goMid() {
        print("go middle")
    }
    
    @objc func goRight() {
        print("go right")
    }

    // BUTTONS
    lazy var leftBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: self.view.frame.width / 15 , y: self.view.frame.height * 7 / 8, width: self.view.frame.width / 5, height: self.view.frame.width / 5))
        button.setTitle("debit", for: .normal)
        button.layer.cornerRadius = self.view.frame.width / 10
        button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 20)
        //button.backgroundColor = Preferences.moneyGreen
        button.backgroundColor = UIColor(displayP3Red: 50/255, green: 160/255, blue: 57/255, alpha: 1)
        button.addTarget(self, action: #selector(goLeft), for: .touchDown)
        
        //let leftBtn = UIImageView(frame: .zero)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowRadius = 5
        button.layer.masksToBounds = false
        
        return button
    }()
    
    lazy var midBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: self.view.frame.width / 2 - self.view.frame.width / 8, y: self.view.frame.height * 7 / 8 - self.view.frame.width / 12, width: self.view.frame.width / 4, height: self.view.frame.width / 4))
        button.setTitle("landing", for: .normal)
        button.layer.cornerRadius = self.view.frame.width / 8

        button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 20)
        //button.backgroundColor = Preferences.moneyGreen
        button.backgroundColor = UIColor(displayP3Red: 50/255, green: 160/255, blue: 57/255, alpha: 1)
        button.addTarget(self, action: #selector(goMid), for: .touchDown)
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowRadius = 5
        button.layer.masksToBounds = false
        
        return button
    }()
    
    lazy var rightBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: self.view.frame.width * 14 / 15 - self.view.frame.width / 5, y: self.view.frame.height * 7 / 8, width: self.view.frame.width / 5, height: self.view.frame.width / 5))
        button.setTitle("credit", for: .normal)
        button.layer.cornerRadius = self.view.frame.width / 10

        button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 20)
        //button.backgroundColor = Preferences.moneyGreen
        button.backgroundColor = UIColor(displayP3Red: 50/255, green: 160/255, blue: 57/255, alpha: 1)
        button.addTarget(self, action: #selector(goRight), for: .touchDown)
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowRadius = 5
        button.layer.masksToBounds = false
        
        return button
    }()
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
