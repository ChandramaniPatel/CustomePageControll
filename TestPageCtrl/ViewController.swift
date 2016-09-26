//
//  ViewController.swift
//  TestPageCtrl
//
//  Created by Chandramani Patel on 26/09/16.
//  Copyright © 2016 Ninestars. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
     let   sliderMenu=self.storyboard!.instantiateViewController(withIdentifier: "InspirationViewController") as! InspirationViewController
        sliderMenu.view.frame=self.containerView.bounds;
        //sliderMenu.menuTableViewControllerDelegate = self
        self.containerView.addSubview(sliderMenu.view)
        self.addChildViewController(sliderMenu);

    }

}

