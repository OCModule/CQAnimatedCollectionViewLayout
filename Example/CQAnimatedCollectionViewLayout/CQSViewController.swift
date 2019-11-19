//
//  CQSViewController.swift
//  CQAnimatedCollectionViewLayout_Example
//
//  Created by steve on 2019/11/19.
//  Copyright © 2019 王承权. All rights reserved.
//

import UIKit
import SwiftUI

class CQSViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            let child = UIHostingController(rootView: SwiftUIView())
            child.view.frame = self.view.bounds
            self.addChildViewController(child)
            self.view.addSubview(child.view)
        } else {
            // Fallback on earlier versions
        }
        self.view.backgroundColor = .red
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true) {}
    }
    
}
