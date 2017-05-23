//
//  SnapsViewController.swift
//  Snapchat
//
//  Created by Lois Talagrand on 5/22/17.
//  Copyright © 2017 Lois Talagrand. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutTapped(_ sender: Any) {
        // The current VC is called modally => just need to dismiss it
        dismiss(animated: true, completion: nil)
    }
   
}
