//
//  TipsView.swift
//  total bill
//
//  Created by Сергей Оськин on 30.01.2023.
//

import UIKit

class TipsView: UIView {
    
    let titleLabel: UILabel = {
      let label = UILabel()
        label.text = "Tips"
        label.textColor = #colorLiteral(red: 0.1882352941, green: 0.2235294118, blue: 0.2784313725, alpha: 1)
//        label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        return collectionView
    }()
    
    let tipsArray = ["0%", "10%", "15%", "20%"]
    var tipsCount = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        titleLabel.font = UIFont(name: "Avenir Next", size: frame.width / 26.7)
    }
    func setupView() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(collectionView)
        collectionView.register(TipsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension TipsView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?
                TipsCollectionViewCell else {
        return UICollectionViewCell()
       }
        cell.procentLabel.text = tipsArray[indexPath.row]
        return cell
    }
}

extension TipsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            tipsCount = 10
        case 2:
            tipsCount = 15
        case 3:
            tipsCount = 20
        default:
            tipsCount = 0
            
        }
    }
}

extension TipsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: collectionView.frame.width / 5,
               height: collectionView.frame.width / 5)
    }
}
extension TipsView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        
        ])
    }
}
