//
//  ViewController.swift
//  UpperTabUI
//
//  Created by satoutakeshi on 2019/08/18.
//  Copyright © 2019 satoutakeshi. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var containerView: UIView!

    let upperTabPageViewController = UpperTabPageController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(upperTabPageViewController)
        containerView.addSubview(upperTabPageViewController.view)
        upperTabPageViewController.didMove(toParent: self)
    }
    
    @IBAction func tappedTimeLine(_ sender: UIButton) {
        upperTabPageViewController.setTab(indexType: .timeLine)
    }
    
    @IBAction func tappedHistory(_ sender: UIButton) {
        upperTabPageViewController.setTab(indexType: .history)
    }
}

