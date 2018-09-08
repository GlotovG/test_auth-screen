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
        
        //для скрытия клавиатуры по тапу
        addTapGestureToHideKeyboard()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = myInformation
    }

    @IBAction func loginPressed(_ sender: Any) {
        if (userLogin.text?.isEmpty)! || (userPassword.text?.isEmpty)!{
            alertView(title: "Ошибка", message: "Пожалуйста, заполните поля логин и пароль.", titleButton: "Ок")
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
    
    func alertView(title:String, message: String, titleButton: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: titleButton, style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
    }
    
}

//общая функция скрытия клавиатуры по тапу
extension UIViewController {
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
}
