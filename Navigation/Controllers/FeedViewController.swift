//
//  FeedViewController.swift
//  Navigation
//
//  Created by Табункин Вадим on 03.03.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Feed"
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let feedButton = UIButton(frame: CGRect(x: 0, y: 0, width: screenWidth - 20, height: screenHeight / 9))
        feedButton.layer.cornerRadius = 10
        feedButton.layer.borderWidth = 1
        feedButton.setTitle(newPost.title, for: .normal)
        feedButton.setTitleColor(.blue, for: .normal)
        feedButton.addTarget(self, action: #selector(pressFeedButtom), for: .touchUpInside)
        self.view.addSubview(feedButton)
//        Констрейны
        feedButton.translatesAutoresizingMaskIntoConstraints = false
        let bottomAnchor = feedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
        let leftAnchor = feedButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40)
        let rightAnchor = feedButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)

        NSLayoutConstraint.activate([bottomAnchor, leftAnchor, rightAnchor])
        
    }

    @IBAction func pressFeedButtom(_ sender:Any) {
        navigationController?.pushViewController( PostViewController(), animated: true)
    }
}

let newPost = Post(title: "Новости")
