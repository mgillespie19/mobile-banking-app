//
//  StartController.swift
//  myEhrBeta
//
//  Created by Brad Hodkinson on 11/24/18.
//  Copyright © 2018 Brad Hodkinson. All rights reserved.
//

import UIKit

protocol StartControllerDelegate {
    func login()
    func animateToPage(pageIndex: Int)
}

class StartController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate, StartControllerDelegate {
    
    let loginCellId = "loginCell"
    let createAccountCellId = "createAccountCell"
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.item == 0){
            let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCellId, for: indexPath) as! LoginPageCell
            loginCell.delegate = self
            return loginCell
        } else {
            let startCell = collectionView.dequeueReusableCell(withReuseIdentifier: createAccountCellId, for: indexPath) as! CreateAccountPageCell
            startCell.delegate = self
            return startCell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        //check to see if the current device is a phone
        if UIDevice.current.userInterfaceIdiom == .phone {
            //if it is a phone make it only return portait mode
            return .portrait
        } else {
            //any other device make it work with any mode
            return .all
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStartController()
        setUpAutoLayout()
        
        startCollection.register(LoginPageCell.self, forCellWithReuseIdentifier: loginCellId)
        startCollection.register(CreateAccountPageCell.self, forCellWithReuseIdentifier: createAccountCellId)
        startCollection.bounces = false
        observeDismissKeyboard()
        observeKeyboardNotifications()
        
        
    }
    
    func setUpStartController(){
        view.addSubview(startCollection)
        view.addSubview(startPageControl)
        
    }
    
    lazy var startCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.clipsToBounds = true
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    lazy var startPageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .gray
        pageControl.numberOfPages = 2
        pageControl.currentPageIndicatorTintColor = Preferences.complimentary
        return pageControl
    }()
    
    func observeDismissKeyboard(){
        //make it to so the keyboard can be dismissed when done edditing by tapping anywhere
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        //make the view have a gesture recognizer listing for taps
        view.addGestureRecognizer(tap)
        
    }
    
    private func observeKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShown), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let currentPage = Int(targetContentOffset.pointee.x/view.frame.width)
        startPageControl.currentPage = currentPage
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    func setUpAutoLayout(){
        //enable auto layout
        startCollection.translatesAutoresizingMaskIntoConstraints = false
        startPageControl.translatesAutoresizingMaskIntoConstraints = false
        
        //activate constraints
        NSLayoutConstraint.activate([
            startCollection.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            startCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            startCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            startCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            startPageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            startPageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            startPageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            startPageControl.heightAnchor.constraint(equalToConstant: 30)
            
            ])
    }
    
    
    
    func animateToPage(pageIndex: Int){
        print("animate to next page")
        let indexPath = IndexPath(item: pageIndex, section: 0)
        startCollection.scrollToItem(at:  indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func login(){
        //let mainTabBarController = MainTabBarController()
        print("Logging in")
        //present(mainTabBarController, animated: true, completion: nil)
    }
    
    //function to dismiss the keyboard
    @objc func dismissKeyboard() {
        //end the editing session allowing the keyboard to be dismissed
        view.endEditing(true)
    }
    
    @objc func keyboardShown() {
        
        //figure out how much to adjust the whole view up to account for keyboard covering up items
        var adjustHeight: CGFloat = 0
        if(startPageControl.currentPage == 0){
            let freeHeight = (self.view.frame.height-896)/3
            adjustHeight = freeHeight < 0 ? freeHeight : 0
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            
            self.view.frame = CGRect(x: 0, y: adjustHeight, width: self.view.frame.width, height: self.view.frame.height)
            
        }, completion: nil)
    }
    
    @objc func keyboardHidden() {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            
        }, completion: nil)
    }
    
    
    
}
