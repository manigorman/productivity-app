//
//  AddTaskController.swift
//  OnTime
//
//  Created by Igor Manakov on 15.02.2022.
//

import UIKit

class AddTaskController: UIViewController {

    override func loadView() {
            self.view = AddTackView()
    }
    
    func view() -> AddTackView {
            return self.view as! AddTackView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSLayoutConstraint.activate(view().sharedConstraints)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
