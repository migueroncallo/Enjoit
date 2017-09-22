//
//  LogInViewController.swift
//  Enjoit
//
//  Created by Miguel Roncallo on 9/21/17.
//
//

import UIKit
import NVActivityIndicatorView
import IQKeyboardManager

class LogInViewController: UIViewController, NVActivityIndicatorViewable{

    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTextFields()
        // Do any additional setup after loading the view.
    }

    //MARK: - Internal Helpers
    
    func setUpTextFields(){
        userTextField.attributedPlaceholder = NSAttributedString(string: "Usuario", attributes:[NSForegroundColorAttributeName: UIColor.white])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Contraseña", attributes: [NSForegroundColorAttributeName: UIColor.white])
    }
    
    @IBAction func logIn(_ sender: UIButton){
       
        self.view.endEditing(true)
        
        if validateTextFields(){
            startAnimating()
            UserAPI().logIn(email: userTextField.text!, password: passwordTextField.text!, cb: { (user, error) in
                
                self.stopAnimating()
                
                if user != nil{
                    print("Successfull log in")
                    let rootVC = self.storyboard?.instantiateViewController(withIdentifier: "RootVC") as! UINavigationController
                    
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = rootVC
                    
                }else{
                    self.presentAlert(text: "Usuario o clave incorrecta")
                    print("Log in error!")
                }
            })
        }else{
            presentAlert(text: "Todos los campos son necesarios para iniciar sesión")
        }
    }
    
    func validateTextFields() -> Bool{
        if userTextField.text!.isEmpty || passwordTextField.text!.isEmpty{
            return false
        }
        
        return true
    }
}

extension UIViewController{
    func presentAlert(title: String? = "Error", text: String){
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
