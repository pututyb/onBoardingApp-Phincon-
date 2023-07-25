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
    
    let buttonNext: UIButton = {
        let buttonNext = UIButton()
        buttonNext.translatesAutoresizingMaskIntoConstraints = false // Add this line to deactivate autoresizing mask constraints
        buttonNext.layer.borderWidth = 1.0
        buttonNext.layer.borderColor = UIColor.black.cgColor
        buttonNext.layer.cornerRadius = 10
        buttonNext.backgroundColor = .black
        
        buttonNext.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        buttonNext.setTitle("Next ", for: .normal)
        buttonNext.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        let image = UIImage(systemName: "arrow.right")
        buttonNext.setImage(image, for: .normal)
        buttonNext.semanticContentAttribute = .forceRightToLeft
        buttonNext.tintColor = .white
        
        buttonNext.largeContentImageInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 16)
        buttonNext.contentHorizontalAlignment = .center
        
        return buttonNext
    }()
    
    
    let buttonSkip: UIButton = {
        let buttonSkip = UIButton()
        buttonSkip.translatesAutoresizingMaskIntoConstraints = false // Add this line to deactivate autoresizing mask constraints
        buttonSkip.layer.cornerRadius = 10
        buttonSkip.setTitleColor(.lightGray, for: .normal)
        //        buttonSkip.backgroundColor = .black
        
        buttonSkip.setTitle("Skip", for: .normal)
        buttonSkip.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        buttonSkip.largeContentImageInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 16)
        buttonSkip.contentHorizontalAlignment = .center
        
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
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        // Add collectionView to the view
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //add garisGaris indicator to view
        view.addSubview(garisGaris)
        view.addSubview(garisGaris1)
        view.addSubview(garisGaris2)
        view.addSubview(buttonNext)
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
        
        // Set up buttonNext
        NSLayoutConstraint.activate([
            buttonNext.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            buttonNext.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            buttonNext.widthAnchor.constraint(equalToConstant: 100),
            buttonNext.heightAnchor.constraint(equalToConstant: 33)
        ])
        
        // Set up buttonSkip
        NSLayoutConstraint.activate([
            buttonSkip.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            buttonSkip.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonSkip.widthAnchor.constraint(equalToConstant: 100),
            buttonSkip.heightAnchor.constraint(equalToConstant: 33)
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
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Calculate the updated selected index after the user scrolls
        let currentIndex = Int(round(scrollView.contentOffset.x / scrollView.bounds.width))
        if selectedCellIndex != currentIndex {
            selectedCellIndex = currentIndex
            
            // Update the indicator colors based on the updated selectedCellIndex
            updateIndicatorColors(for: selectedCellIndex)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Update the selectedCellIndex to the tapped cell's index
        selectedCellIndex = indexPath.item
        
        // Scroll to the selected cell when it's tapped
//        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
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


// MARK: - UIViewController for buttonNextTapped
extension ViewController {
    @objc func nextButtonTapped() {
        // Calculate the next index
        let nextIndex = selectedCellIndex + 1

        // Check if the next index is within the bounds of the collection view data
        if nextIndex >= 0 && nextIndex < dummyData.count {
            // Update the selectedCellIndex to the next index
            selectedCellIndex = nextIndex

            // Scroll the collection view to the desired index
            let indexPath = IndexPath(item: selectedCellIndex, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)

            // Update the indicator colors based on the updated selectedCellIndex
            updateIndicatorColors(for: selectedCellIndex)
        }
    }
}

extension ViewController {
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        // Call the nextButtonTapped method when the view is tapped
        nextButtonTapped()
    }
}



