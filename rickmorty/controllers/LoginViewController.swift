//
//  LoginViewController.swift
//  rickmorty
//
//  Created by Antonio Gabriel Marín on 20/08/2019.
//  Copyright © 2019 Antonio. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var firebaseManager: FirebaseManager = FirebaseManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        if !nameTextfield.text!.isEmpty && !passwordTextfield.text!.isEmpty {
            
           //comprueba si se puede logear el usuario
           firebaseManager.loginUser(username: nameTextfield.text!, password: passwordTextfield.text!) { (result, error) in
            
                if result == nil {
                    
                    //como no puede logearse, es que no existe el usuario, asi que intenta crear uno nuevo
                    self.firebaseManager.createUser(username: self.nameTextfield.text!, password: self.passwordTextfield.text!) { (result, error) in
                        
                        if result == nil {
                            let alert = UIAlertController(title: "No se pudo logear usuario", message: "El usuario no existe y no puede crearse; compruebe los datos", preferredStyle: .alert)
                            
                            let comfirmAction = UIAlertAction(title: "OK", style: .default) { (_) in
                                alert.dismiss(animated: true, completion: nil)
                            }
                            alert.addAction(comfirmAction)
                            self.present(alert, animated: true, completion: nil)
                        }
                            //usuario creado correctamente
                        else {
                            let alert = UIAlertController(title: "Usuario creado", message: "Ahora ya puede logearse con este usuario", preferredStyle: .alert)
                            
                            let comfirmAction = UIAlertAction(title: "OK", style: .default) { (_) in
                                alert.dismiss(animated: true, completion: nil)
                            }
                            alert.addAction(comfirmAction)
                            self.present(alert, animated: true, completion: nil)
                        }

                    }
                }
                    //se hace el login correctamente, y se cambia el viewcontroller main para pasar al otro storyboard ya de la aplicacion como tal
                else {
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    let window = appDelegate.window
                    window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainController")
                }
            }
        }
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
