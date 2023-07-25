//
//  ViewController.swift
//  onBoardingApp
//
//  Created by Putut Yusri Bahtiar on 24/07/23.
//

import UIKit

class ViewController: UIViewController {
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let garisGaris: UIView = {
        let garisgaris = UIView()
        garisgaris.translatesAutoresizingMaskIntoConstraints = false // Add this line to deactivate autoresizing mask constraints
        garisgaris.frame = CGRect(x: 0, y: 0, width: 100, height: 5)
        garisgaris.layer.borderWidth = 2.0
        garisgaris.layer.borderColor = UIColor.black.cgColor
        garisgaris.layer.cornerRadius = 4.0
        garisgaris.backgroundColor = .clear
        return garisgaris
    }()
    
    let garisGaris1: UIView = {
        let garisgaris1 = UIView()
        garisgaris1.translatesAutoresizingMaskIntoConstraints = false // Add this line to deactivate autoresizing mask constraints
        //        garisgaris1.frame = CGRect(x: 140, y: 0, width: 100, height: 5)
        garisgaris1.layer.borderWidth = 2.0
        garisgaris1.layer.borderColor = UIColor.black.cgColor
        garisgaris1.layer.cornerRadius = 4.0
        garisgaris1.backgroundColor = .clear
        return garisgaris1
    }()
    
    let garisGaris2: UIView = {
        let garisgaris2 = UIView()
        garisgaris2.translatesAutoresizingMaskIntoConstraints = false // Add this line to deactivate autoresizing mask constraints
        garisgaris2.layer.borderWidth = 2.0
        garisgaris2.layer.borderColor = UIColor.black.cgColor
        garisgaris2.layer.cornerRadius = 4.0
        garisgaris2.backgroundColor = .clear
        
        return garisgaris2
    }()
    
    let buttonSkip: UIButton = {
        let buttonSkip = UIButton()
        buttonSkip.translatesAutoresizingMaskIntoConstraints = false // Add this line to deactivate autoresizing mask constraints
        buttonSkip.layer.borderWidth = 1.0
        buttonSkip.layer.borderColor = UIColor.black.cgColor
        buttonSkip.layer.cornerRadius = 10
        buttonSkip.backgroundColor = .black
        
        return buttonSkip
    }()
    
    
    let cellReuseIdentifier = "CustomCell"
    let dummyData = DummyData().data
    
    var indicatorLeadingConstraint: NSLayoutConstraint!
    var selectedCellIndex = 0
//    var initialIndicatorLeadingConstant: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        // Add collectionView to the view
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //add garisGaris indicator to view
        view.addSubview(garisGaris)
        view.addSubview(garisGaris1)
        view.addSubview(garisGaris2)
        view.addSubview(buttonSkip)
        
        // Set up Garis garis untuk indicator
        indicatorLeadingConstraint = garisGaris.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
        indicatorLeadingConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            garisGaris.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110),
            garisGaris1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110),
            garisGaris2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110),
            garisGaris.widthAnchor.constraint(equalToConstant: 26.5),
            garisGaris1.widthAnchor.constraint(equalToConstant: 26.5),
            garisGaris2.widthAnchor.constraint(equalToConstant: 26.5),
            garisGaris.heightAnchor.constraint(equalToConstant: 10),
            garisGaris1.heightAnchor.constraint(equalToConstant: 10),
            garisGaris2.heightAnchor.constraint(equalToConstant: 10),
            garisGaris.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            garisGaris1.leadingAnchor.constraint(equalTo: garisGaris.leadingAnchor, constant: 50),
            garisGaris2.leadingAnchor.constraint(equalTo: garisGaris1.leadingAnchor, constant: 50)
        ])
        
        // Update the indicator colors based on the initial selected index (0)
        updateIndicatorColors(for: 0)
        
        // Register custom cell class for the collectionView
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        
        // Set up constraints for the collectionView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CustomCell
        let modelData = dummyData[indexPath.item]
        cell.configure(with: modelData)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Calculate the indicator's position based on the content offset
        let contentWidth = collectionView.contentSize.width
        let contentOffsetX = scrollView.contentOffset.x
        let collectionViewWidth = collectionView.bounds.width
        let indicatorPosition = (contentOffsetX / contentWidth) * collectionViewWidth
        
        // Update the indicator's position
        indicatorLeadingConstraint.constant = 100 + indicatorPosition
        
        // Update the indicator colors based on the current selected index
        let currentIndex = Int(round(contentOffsetX / collectionViewWidth))
        if selectedCellIndex != currentIndex {
            selectedCellIndex = currentIndex
            updateIndicatorColors(for: currentIndex)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Scroll to the selected cell when it's tapped
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        // Update the indicator colors based on the selected cell index
        updateIndicatorColors(for: indexPath.item)
    }
    
    func updateIndicatorColors(for index: Int) {
        // Update the colors of all indicators based on the selected index
        garisGaris.backgroundColor = index == 0 ? .black : .clear
        garisGaris1.backgroundColor = index == 1 ? .black : .clear
        garisGaris2.backgroundColor = index == 2 ? .black : .clear
    }
}
