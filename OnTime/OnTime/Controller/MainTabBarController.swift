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
        tabBar.isTranslucent = true
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    func setupTabBar() {
        let scheduleController = createNavController(with: ScheduleViewController(), selected: UIImage(systemName: "house.fill"), unselected: UIImage(systemName: "house"), title: "Tasks")
        
        let calendarController = createNavController(with: CalendarViewController(), selected: UIImage(systemName: "calendar"), unselected: UIImage(systemName: "calendar"), title: "Calendar")
        
        let mapController = createNavController(with: MapViewController(), selected: UIImage(systemName: "map.fill"), unselected: UIImage(systemName: "map"), title: "Map")
        
        self.setViewControllers([scheduleController, calendarController, mapController], animated: true)
    }

    func createNavController(with vc: UIViewController, selected: UIImage?, unselected: UIImage?, title: String) -> UINavigationController {
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselected
        navController.tabBarItem.image = selected
        navController.navigationBar.barStyle = .default
        navigationController?.navigationBar.prefersLargeTitles = true
        navController.title = title
        return navController
    }

}
