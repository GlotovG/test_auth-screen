//
//  ViewController.swift
//  auth-screen
//
//  Created by Gennadiy Glotov on 02.09.2018.
//  Copyright © 2018 Gennadiy Glotov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userLogin: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var registrationBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var forgotLoginBtn: UIButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    
    
    var myInformation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrationBtn.layer.cornerRadius = 5
        loginBtn.layer.cornerRadius = 5
        loginBtn.isEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = myInformation
    }

    @IBAction func loginPressed(_ sender: Any) {
        if (userLogin.text?.isEmpty)! || (userPassword.text?.isEmpty)!{
            //ничего не делать, но можно вывести сообщение о необходимости заполнить логин и пароль
        } else {
            if let userName = userLogin.text {
                myInformation = "Привет, " + userName
                performSegue(withIdentifier: "login", sender: nil)
            }
        }
    }
    
    @IBAction func enrollPressed(_ sender: Any) {
        myInformation = "Регистрация"
        performSegue(withIdentifier: "login", sender: nil)
    }
    
    @IBAction func forgotLoginPressed(_ sender: Any) {
        myInformation = "Забыли логин?"
        performSegue(withIdentifier: "login", sender: nil)
    }
    
    @IBAction func forgotPassPressed(_ sender: Any) {
        myInformation = "Забыли пароль?"
        performSegue(withIdentifier: "login", sender: nil)
    }
    
}
