//
//  UpperTabPageController.swift
//  UpperTabUI
//
//  Created by satoutakeshi on 2019/08/19.
//  Copyright © 2019 satoutakeshi. All rights reserved.
//

import UIKit

final class UpperTabPageController: UIPageViewController {

    private let timeLineViewController = TimeLineViewController()
    private let historyViewController = HistoryViewController()
    
    var dataSourceControllers: [UIViewController] {
        return [timeLineViewController, historyViewController]
    }
    var currentIndex = 0
    
    enum IndexType {
        case timeLine
        case history
    }
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
    }
    
    convenience init() {
        self.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([timeLineViewController], direction: .forward, animated: true, completion: nil)
        dataSource = self
    }
    
    func setTab(indexType: IndexType) {
        switch indexType {
        case .timeLine:
            setViewControllers([timeLineViewController], direction: .reverse, animated: true, completion: nil)
        case .history:
            setViewControllers([historyViewController], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension UpperTabPageController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController is HistoryViewController {
            return timeLineViewController
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController is TimeLineViewController {
            return historyViewController
        } else {
            return nil
        }
    }
}
