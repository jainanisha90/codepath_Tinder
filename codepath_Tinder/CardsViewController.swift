//
//  ViewController.swift
//  codepath_Tinder
//
//  Created by Anisha Jain on 4/26/17.
//  Copyright © 2017 Anisha Jain. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    @IBOutlet weak var customImageView: DraggableImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customImageView.image = UIImage(named: "ryan")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

