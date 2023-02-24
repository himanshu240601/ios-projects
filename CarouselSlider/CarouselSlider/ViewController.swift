//
//  ViewController.swift
//  CarouselSlider
//
//  Created by Himanshu on 2/23/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {

    // MARK: outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: properties
    var imagesDataArray = ["image1", "image2", "image3", "image4"]
    
    // MARK: lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        pageControl.numberOfPages = imagesDataArray.count
        pageControl.currentPage = 0
    }
    
    // MARK: actions
    @IBAction func pageControlTapped(_ sender: UIPageControl) {
        let index = IndexPath(item: sender.currentPage, section: 0)
        self.collectionView?.scrollToItem(at: index, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
    }
}

