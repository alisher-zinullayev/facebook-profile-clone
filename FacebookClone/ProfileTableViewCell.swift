//
//  ProfileTableViewCell.swift
//  FacebookClone
//
//  Created by Alisher Zinullayev on 08.07.2023.
//

import UIKit

final class ProfileTableViewCell: UITableViewCell {

    static let identifier = String(describing: ProfileTableViewCell.self)
    
    private let profilePicture: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let username: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let detialProfile: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(profilePicture)
        contentView.addSubview(username)
        contentView.addSubview(detialProfile)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let profilePictureConstraints = [
            profilePicture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            profilePicture.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profilePicture.heightAnchor.constraint(equalToConstant: 80),
            profilePicture.widthAnchor.constraint(equalToConstant: 80),
        ]
        
        let usernameConstraints = [
            username.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 10),
            username.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),
        ]
        
        let detialProfileConstraints = [
            detialProfile.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 10),
            detialProfile.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 3)
        ]
        
        NSLayoutConstraint.activate(profilePictureConstraints)
        NSLayoutConstraint.activate(usernameConstraints)
        NSLayoutConstraint.activate(detialProfileConstraints)
    }
    
    public func configure(picture: String, name: String, detail: String) {
        profilePicture.image = UIImage(named: picture)
        username.text = name
        detialProfile.text = detail
    }
    
}
