//
//  MenuController.swift
//  guessNumber
//
//  Created by Hanataba on 19/11/2562 BE.
//  Copyright © 2562 Hanataba. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
