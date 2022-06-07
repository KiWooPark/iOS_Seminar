//
//  ViewController.swift
//  test220526
//
//  Created by PKW on 2022/06/07.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class ViewController: UIViewController {

    let googleLogionButton: GIDSignInButton = {
        let button = GIDSignInButton()
        button.style = .standard
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapGoogleLoginButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        configureConstraint()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let loginInfo = Auth.auth().currentUser else {
            print("로그인 정보 없음")
            return
        }
        
        if loginInfo.email != nil {
            print("정보 있음")
            let userInfoVC = UserInfoViewController()
            userInfoVC.userInfo = loginInfo
            self.present(userInfoVC, animated: true)
        }
    }
    
    func configureConstraint() {
        self.view.addSubview(googleLogionButton)
      
        googleLogionButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        googleLogionButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    @objc func tapGoogleLoginButton() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        print("clientID = \(clientID)")
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        print("config = \(config)")

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

          if let error = error {
            print("구글 로그인 실패 \(error)")
            return
          }

          guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
            print("authentication = \(authentication), idToken = \(idToken)")

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: authentication.accessToken)

            print("credential = \(credential)")
            
            // 파이어베이스에 유저 정보 저장
            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    print("파이어 베이스에 유저 정보 저장 실패 = \(error)")
                }
                
                let vc = UserInfoViewController()
                vc.userInfo = result?.user
                self.present(vc, animated: true)
                
            }
            
        }
    }
}

