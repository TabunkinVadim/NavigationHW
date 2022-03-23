//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Табункин Вадим on 03.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeader = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"
    }
    
    override func viewWillLayoutSubviews() {
        self.view.addSubview(profileHeader)
        self.view.addSubview(logOutOfAccountButtom)
        layoutSubviews()
    }
    
    private func layoutSubviews() {
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        logOutOfAccountButtom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeader.heightAnchor.constraint(equalToConstant: 200),
            logOutOfAccountButtom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            logOutOfAccountButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            logOutOfAccountButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
    }
    
    let logOutOfAccountButtom: UIButton = {
        let buttom = UIButton()
        buttom.setTitle("Выйти", for: .normal)
        buttom.backgroundColor = .link
        buttom.addTarget(self, action: #selector(pressLogOutButtom), for: .touchUpInside)
        return buttom
    }()
    
    @objc func pressLogOutButtom(_ sender:Any) {
        navigationController?.pushViewController( LogInViewController(), animated: true)
    }
}
