//
//  CustomCell.swift
//  onBoardingApp
//
//  Created by Putut Yusri Bahtiar on 24/07/23.
//

import UIKit

class CustomCell: UICollectionViewCell {
    // Define UI elements as properties
    let imageView = UIImageView()
    let topImageView = UIImageView()
    let txtTitle = UILabel()
    let txtDesc = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup cell's UI elements and constraints
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.backgroundColor = .systemBackground
        
        // Background Image View
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        
        // Image on top of Background Image View
        topImageView.contentMode = .scaleToFill
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(topImageView)
        
        // Label for Title
        txtTitle.textColor = .black
        txtTitle.numberOfLines = 0
        txtTitle.font = .boldSystemFont(ofSize: 24)
        txtTitle.textAlignment = .left
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(txtTitle)
        
        // Label for Description
        txtDesc.numberOfLines = 0
        txtDesc.textColor = .black
        txtDesc.font = .systemFont(ofSize: 13)
        txtDesc.textAlignment = .justified
        txtDesc.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(txtDesc)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Constraints for imageView
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 395),
            
            // Constraints for topImageView
            topImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 179),
            topImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            topImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            topImageView.heightAnchor.constraint(equalToConstant: 331),
            
            // Constraints for txtTitle
            txtTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 125),
            txtTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 39),
            txtTitle.widthAnchor.constraint(equalToConstant: 242),
            txtTitle.heightAnchor.constraint(equalToConstant: 84),
            
            // Constraints for txtDesc
            txtDesc.topAnchor.constraint(equalTo: txtTitle.bottomAnchor, constant: 12),
            txtDesc.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 39),
            txtDesc.widthAnchor.constraint(equalToConstant: 296),
            txtDesc.heightAnchor.constraint(equalToConstant: 57)
        ])
    }
    
    func configure(with modelData: ModelData) {
        // Set the UI elements with data from the ModelData object
        imageView.image = UIImage(named: modelData.imageBg)
        topImageView.image = UIImage(named: modelData.imageObject)
        txtTitle.text = modelData.txtTitle
        txtDesc.text = modelData.txtDesc
    }
}


