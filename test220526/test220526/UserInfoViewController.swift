//
//  UserInfoViewController.swift
//  test220526
//
//  Created by PKW on 2022/06/07.
//

import UIKit
import GoogleSignIn
import FirebaseAuth

class UserInfoViewController: UIViewController {
    
    var userInfo: User?

    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var userEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그아웃", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(tapLogoutButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        view.backgroundColor = .white
        configureAddSubView()
        configureContraint()
        
        userNameLabel.text = userInfo?.displayName
        userEmailLabel.text = userInfo?.email
        
    }
    
    @objc func tapLogoutButton() {
      
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            dismiss(animated: true)
            print("로그아웃 완료")
        } catch let signOutError as NSError {
            print("로그아웃 실패 = \(signOutError)")
        }
        
       
    }
    
    func configureAddSubView() {
        self.view.addSubview(stackView)
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(userEmailLabel)
        stackView.addArrangedSubview(logoutButton)
    }
    
    func configureContraint() {
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        logoutButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        logoutButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
    }
}
