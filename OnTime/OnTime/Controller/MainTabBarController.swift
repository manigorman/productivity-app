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
    
    func setupTabBar() {
        let scheduleController = createNavController(with: ScheduleViewController(), selected: UIImage(systemName: "house.fill"), unselected: UIImage(systemName: "house"))
        
        let calendarController = createNavController(with: CalendarViewController(), selected: UIImage(systemName: "calendar"), unselected: UIImage(systemName: "calendar"))
        
        let mapController = createNavController(with: MapViewController(), selected: UIImage(systemName: "map.fill"), unselected: UIImage(systemName: "map"))
        
        viewControllers = [scheduleController, calendarController, mapController]
    }

    func createNavController(with vc: UIViewController, selected: UIImage?, unselected: UIImage?) -> UINavigationController {
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselected
        navController.tabBarItem.image = selected
        
        return navController
    }

}

