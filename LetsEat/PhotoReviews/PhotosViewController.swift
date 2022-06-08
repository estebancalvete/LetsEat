//
//  PhotoReviewViewController.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 8/6/22.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    var selectedRestaurantID: Int?
    
    private var photoReviewItems: [RestaurantPhotoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkPhotoReviews()
    }
    
}

private extension PhotosViewController {
    func initialize() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 7
        flow.scrollDirection = .horizontal
        collectionView.collectionViewLayout = flow
    }
    
    func checkPhotoReviews() {
        let viewController = self.parent as? RestaurantDetailViewController
        if let restauratnID = viewController?.selectedRestaurant?.restaurantID {
            photoReviewItems = CoreDataManager.shared.fetchRestPhotos(by: restauratnID)
            if !photoReviewItems.isEmpty {
                collectionView.backgroundView = nil
            } else {
                let view = NoDataView(frame: CGRect(x: 0, y: 0, width: collectionView.frame.width, height: collectionView.frame.height))
                view.set(title: "Photos", desc: "There are currently no photos")
                collectionView.backgroundView = view
            }
        }
        collectionView.reloadData()
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoReviewItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        let photoReviewItem = photoReviewItems[indexPath.item]
        if let photo = photoReviewItem.photo { cell.set(image: photo) }
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if photoReviewItems.count == 1 {
            let cellWidth = collectionView.frame.size.width - 14
            return CGSize(width: cellWidth, height: 200)
        } else {
            let cellWidth = collectionView.frame.size.width - 21
            return CGSize(width: cellWidth, height: 200)
        }
    }
}
