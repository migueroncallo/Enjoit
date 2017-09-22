//
//  RegisterViewController.swift
//  Enjoit
//
//  Created by Miguel Roncallo on 9/22/17.
//
//

import UIKit
import NVActivityIndicatorView

class RegisterViewController: UIViewController, NVActivityIndicatorViewable {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var idTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTextFields()
    }
    
    //MARK:-Internal Helpers
    
    func validateInfo() -> Bool{
        
        if nameTextField.text!.isEmpty || lastNameTextField.text!.isEmpty || emailTextField.text!.isEmpty || phoneTextField.text!.isEmpty ||
            passwordTextField.text!.isEmpty || idTextField.text!.isEmpty{
            return false
        }
        
        return true
    }
    
    func setUpTextFields(){
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Nombre", attributes:[NSForegroundColorAttributeName: UIColor.white])
        
        lastNameTextField.attributedPlaceholder = NSAttributedString(string: "Apellido", attributes:[NSForegroundColorAttributeName: UIColor.white])
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Correo Electrónico", attributes:[NSForegroundColorAttributeName: UIColor.white])
        
        phoneTextField.attributedPlaceholder = NSAttributedString(string: "Teléfono", attributes:[NSForegroundColorAttributeName: UIColor.white])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Contraseña", attributes:[NSForegroundColorAttributeName: UIColor.white])
        
        idTextField.attributedPlaceholder = NSAttributedString(string: "Identificación", attributes:[NSForegroundColorAttributeName: UIColor.white])
    }
    
    //MARK:-IBActions
    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func register(_ sender: UIButton) {
        
        if validateInfo(){
            startAnimating()
            UserAPI().register(email: emailTextField.text!, password: passwordTextField.text!, name: nameTextField.text!, lastName: lastNameTextField.text!, phone: phoneTextField.text!, id: idTextField.text!, cb: { (success) in
                
                self.stopAnimating()
                if success{
                    self.dismiss(animated: true, completion: nil)
                }else{
                    self.presentAlert(text: "Error al crear el usuario")
                }
            })
        }else{
            self.presentAlert(text: "Todos los campos son necesarios para inciar sesión")
        }
    }
    
    
}
