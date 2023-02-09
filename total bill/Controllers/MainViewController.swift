//
//  ViewController.swift
//  total bill
//
//  Created by Сергей Оськин on 23.08.2022.
//

import UIKit

class MainViewController: UIViewController {

    let titleLabel: UILabel = {
      let label = UILabel()
        label.text = "Total Bill"
        label.textColor = .black
//        label.font = UIFont(name: "AvenirNext-Bold", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoRaccoon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let decriptionLabel: UILabel = {
      let label = UILabel()
        label.text = "Enter the invoice amount and click \"Calculate\""
        label.textColor = .black
        label.font = UIFont(name: "AvenirNext-Bold", size: 15)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
//        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.5647058824, green: 0.1529411765, blue: 0.5568627451, alpha: 1)
//        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let totalBillView = TotalBillView()
    let personsView = PersonsView()
    let tipsView = TipsView()
    
// Метод с которого стартует приложение
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupViews()
        setConstraints()
        addTap()
        
//        printFonts()
    }
    
// Метод для настройки View
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        
        view.addSubview(titleLabel)
        
        titleLabel.font = UIFont(name: "AvenirNext-Bold", size: view.frame.height * 0.046)
        
        view.addSubview(logoImageView)
        view.addSubview(decriptionLabel)
        view.addSubview(totalBillView)
        view.addSubview(personsView)
        view.addSubview(calculateButton)
        view.addSubview(tipsView)
        
        calculateButton.titleLabel?.font = UIFont(name: "Avenir Next", size: view.frame.height / 44)
    }
    
    
    @objc func calculateButtonTapped() {
        guard let totalBill = totalBillView.sumTextField.text,
              let totalBillInt = Int(totalBill) else {
              decriptionLabel.text = "Enter total bill"
              decriptionLabel.textColor = .red
            return
            
        }
        
        let summ = totalBillInt + totalBillInt * tipsView.tipsCount / 100
        print(summ)
        let persons = personsView.counter
        
        
        if persons < 2 {
            decriptionLabel.text = "Enter persons count"
            decriptionLabel.textColor = .red
        } else {
            let result = summ / persons
            decriptionLabel.textColor = .black
            decriptionLabel.text = "\(result) per person"
        }
    }
    
    func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
    

// Расширение для ViewController, которое будет устанивливать констреинты для объектов
extension MainViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            
            decriptionLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            decriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            decriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            totalBillView.topAnchor.constraint(equalTo: decriptionLabel.bottomAnchor, constant: 5),
            totalBillView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalBillView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
            
            personsView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 5),
            personsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
            
            tipsView.topAnchor.constraint(equalTo: personsView.bottomAnchor, constant: 10),
            tipsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tipsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tipsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
            
            calculateButton.topAnchor.constraint(equalTo: tipsView.bottomAnchor, constant: 35),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06)
        ])
    }
}





//func printFonts() {
//    let fontFamilyNames = UIFont.familyNames
//    for familyName in fontFamilyNames {
//        print("------------------------------")
//        print("Font Family Name = [\(familyName)]")
//        let names = UIFont.fontNames(forFamilyName: familyName)
//        print("Font Names = [\(names)]")
//    }
//}

