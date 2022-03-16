//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Табункин Вадим on 13.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String = ""

    override init(frame:CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let avatar: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.masksToBounds = true
        image.image = UIImage(named: "Avatar")
        return image
    }()

    let name: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.boldSystemFont(ofSize: 18)
        lable.textColor = .black
        lable.text = "Иван Иванович"
        return lable
    }()

    let statusButtom: UIButton = {
        let buttom = UIButton(frame: CGRect(x: 16, y: 116, width: 200, height: 50))
        buttom.backgroundColor = .blue
        buttom.setTitle("Show status", for: .normal)
        buttom.setTitleColor(.white, for: .normal)

        buttom.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttom.layer.shadowRadius = 4
        buttom.layer.shadowColor = UIColor.black.cgColor
        buttom.layer.shadowOpacity = 0.7
        buttom.layer.cornerRadius = 4
        buttom.addTarget(self, action: #selector(pressStatusButtom), for: .touchUpInside)
        return buttom
    }()
    @objc func pressStatusButtom(_ sender:Any) {
        status.text = statusText
        print(status.text ?? "Статус отсутствует")
    }
    
    let status: UILabel = {
        let lable = UILabel(frame: CGRect(x: 100, y: 400, width: 200, height: 40))
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.text = "Я в шоке..."
        lable.textColor = .gray
        return lable
    }()

    let statusSet: UITextField = {
        let field = UITextField()
        field.font = UIFont.systemFont(ofSize: 15)
        field.textColor = .black
        field.backgroundColor = .white
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: field.frame.height))
        field.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: field.frame.height))
        field.leftViewMode = .always
        field.rightViewMode = .always
        field.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return field
    }()

    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? ""
    }

    func setupView () {
        self.addSubview(avatar)
        self.addSubview(name)
        self.addSubview(statusButtom)
        self.addSubview(status)
        self.addSubview(statusSet)
    }
    func setupConstraints () {
        avatar.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        statusButtom.translatesAutoresizingMaskIntoConstraints = false
        status.translatesAutoresizingMaskIntoConstraints = false
        statusSet.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatar.heightAnchor.constraint(equalToConstant: 100),
            avatar.widthAnchor.constraint(equalToConstant: 100),
            
            name.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            name.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16),
            name.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            statusButtom.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16),
            statusButtom.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            statusButtom.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            status.bottomAnchor.constraint(equalTo: statusSet.topAnchor, constant: -10),
            status.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16),
            status.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            statusSet.bottomAnchor.constraint(equalTo: statusButtom.topAnchor, constant: -8),
            statusSet.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16),
            statusSet.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusSet.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}

