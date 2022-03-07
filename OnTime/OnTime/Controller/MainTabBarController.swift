//
//  ViewController.swift
//  OnTime
//
//  Created by Igor Manakov on 15.02.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    func setupTabBar() {
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .systemBackground
        
        let scheduleController = createNavController(with: ScheduleViewController(), selected: UIImage(systemName: "house.fill"), unselected: UIImage(systemName: "house"), title: "Tasks")
        
        let calendarController = createNavController(with: CalendarViewController(), selected: UIImage(systemName: "calendar"), unselected: UIImage(systemName: "calendar"), title: "Calendar")
        
        let mapController = createController(with: MapViewController(), selected: UIImage(systemName: "map.fill"), unselected: UIImage(systemName: "map"), title: "Map")
        self.setViewControllers([scheduleController, calendarController, mapController], animated: false)
    }

    func createNavController(with vc: UIViewController, selected: UIImage?, unselected: UIImage?, title: String) -> UINavigationController {
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselected
        navController.tabBarItem.image = selected
        navController.title = title
        
        return navController
    }
    
    func createController(with vc: UIViewController, selected: UIImage?, unselected: UIImage?, title: String) -> UIViewController {
        let viewController = vc
        viewController.tabBarItem.image = unselected
        viewController.tabBarItem.image = selected
        viewController.title = title
        
        return viewController
    }
}
