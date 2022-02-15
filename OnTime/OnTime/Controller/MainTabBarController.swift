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
        tabBar.barTintColor = .white
        setupTabBar()
        
    }
    
    func setupTabBar() {
        let scheduleController = UINavigationController(rootViewController: ScheduleViewController())
        scheduleController.tabBarItem.image = UIImage(systemName: "house")
        scheduleController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        let calendarController = UINavigationController(rootViewController: CalendarViewController())
        calendarController.tabBarItem.image = UIImage(systemName: "calendar")
        calendarController.tabBarItem.selectedImage = UIImage(systemName: "calendar")
        
        let mapController = UINavigationController(rootViewController: MapViewController())
        mapController.tabBarItem.image = UIImage(systemName: "map")
        mapController.tabBarItem.selectedImage = UIImage(systemName: "map.fill")
        
        viewControllers = [scheduleController, calendarController, mapController]
    }


}

