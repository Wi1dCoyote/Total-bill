//
//  TotalBillView.swift
//  total bill
//
//  Created by Сергей Оськин on 30.01.2023.
//

import UIKit

class TotalBillView: UIView {
    
    let titleLabel: UILabel = {
      let label = UILabel()
        label.text = "Total Bill"
        label.textColor = #colorLiteral(red: 0.1882352941, green: 0.2235294118, blue: 0.2784313725, alpha: 1)
//        label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sumTextField: UITextField = {
       let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.textColor = .black
//        textField.font = UIFont(name: "AvenirNext-Bold", size: 48)
        textField.textAlignment = .center
        textField.tintColor = #colorLiteral(red: 0.5647058824, green: 0.1529411765, blue: 0.5568627451, alpha: 1)
        textField.keyboardType = .numberPad
        textField.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9490196078, blue: 0.9411764706, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        titleLabel.font = UIFont(name: "Avenir Next", size: frame.width / 26.7)
        sumTextField.font = UIFont(name: "AvenirNext-Bold", size: frame.height / 1.9)
    }
    
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(titleLabel)
        addSubview(sumTextField)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            sumTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            sumTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            sumTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            sumTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        
        ])
    }
    
}
