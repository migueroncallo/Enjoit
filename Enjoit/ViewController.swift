//
//  ViewController.swift
//  Enjoit
//
//  Created by Miguel Roncallo on 9/4/17.
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func presentLogin(_ sender: UIButton) {
        
       let logInVc = self.storyboard?.instantiateViewController(withIdentifier: "LogInVC") as! LogInViewController
        
        self.present(logInVc, animated: true, completion: nil)
    }
}

