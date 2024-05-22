//
//  ExampleViewController.swift
//  Assignment
//
//  Created by 서충원 on 5/22/24.
//

import UIKit

class ExampleViewController: UIViewController {

    @IBOutlet var viewObject: UIView!
    @IBOutlet var viewObjectLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(CFGetRetainCount(self.view))
        print(CFGetRetainCount(viewObject))
        print(CFGetRetainCount(viewObjectLabel))
        
        viewObjectLabel.textAlignment
    }
    
    
    
}
