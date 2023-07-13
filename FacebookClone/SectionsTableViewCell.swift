//
//  SectionsTableViewCell.swift
//  FacebookClone
//
//  Created by Alisher Zinullayev on 09.07.2023.
//

import UIKit

class SectionsTableViewCell: UITableViewCell {

    static let identifier = "SectionsTableViewCell"
    
    private let symbolImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .label
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(symbolImage)
        contentView.addSubview(labelName)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // contentView
    func applyConstraints() {
        let symbolImageConstraints = [
            symbolImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            symbolImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            symbolImage.heightAnchor.constraint(equalToConstant: 20),
            symbolImage.widthAnchor.constraint(equalToConstant: 20),
        ]
        
        let labelNameConstraints = [
            labelName.leadingAnchor.constraint(equalTo: symbolImage.trailingAnchor, constant: 14),
            labelName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(symbolImageConstraints)
        NSLayoutConstraint.activate(labelNameConstraints)
    }
    
    public func configure(picture: String, name: String) {
        symbolImage.image = UIImage(systemName: picture)
        labelName.text = name
        if (name == "Log Out") {
            labelName.textColor = .red
        }
        if (name == "Add favorites..." || name == "See More...") {
            labelName.textColor = .systemCyan
        }
        
    }
    
}
