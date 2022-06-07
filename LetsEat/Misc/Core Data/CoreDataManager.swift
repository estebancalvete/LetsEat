//
//  CoreDataManager.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 7/6/22.
//

import Foundation
import CoreData

struct CoreDataManager {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "LetsEatModel")
        container.loadPersistentStores { (storeDesc, error) in
            error.map {
                print($0)
            }
        }
    }
    
    func addReview(_ reviewItem: ReviewItem) {
        let review = Review(context: container.viewContext)
        review.date = Date()
        if let reviewItemRating = reviewItem.rating {
            review.rating = reviewItemRating
        }
        review.title = reviewItem.title
        review.name = reviewItem.name
        review.customerReview = reviewItem.customerReview
        if let reviewItemRestID = reviewItem.restaurantID {
            review.restaurantID = reviewItemRestID
        }
        review.uuid = reviewItem.uuid
        save()
    }
    
    func addPhoto(_ restPhotoItem: RestaurantPhotoItem) {
        let restPhoto = RestaurantPhoto(context: container.viewContext)
        restPhoto.date = Date()
        restPhoto.photo = restPhotoItem.photoData
        if let restPhotoID = restPhotoItem.restaurantID {
            restPhoto.restaurantID = restPhotoID
        }
        restPhoto.uuid = restPhotoItem.uuid
        save()
    }
    
    func fetchReviews(by identifier: Int) -> [ReviewItem] {
        // This gets a reference of a NSManagedObjectContext instance.
        let moc = container.viewContext
        // This creates a fetch request that gets Review instances from the persistent store.
        let request = Review.fetchRequest()
        // This creates a fetch predicate that only gets those Review instances with the specified restaurantID.
        let predicate = NSPredicate(format: "restaurantID = %i", identifier)
        var reviewItems: [ReviewItem] = []
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        request.predicate = predicate
        do {
            for review in try moc.fetch(request) {
                reviewItems.append(ReviewItem(review: review))
            }
            return reviewItems
        } catch {
            fatalError("Failed to fetch reviews: \(error)")
        }
    }
    
    func fetchRestPhotos(by identifier: Int) -> [RestaurantPhotoItem] {
        let moc = container.viewContext
        let request = RestaurantPhoto.fetchRequest()
        let predicate = NSPredicate(format: "restaurantID = %i", identifier)
        var restPhotoItems: [RestaurantPhotoItem] = []
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        request.predicate = predicate
        do {
            for restPhoto in try moc.fetch(request) {
                restPhotoItems.append(RestaurantPhotoItem(restaurantPhoto: restPhoto))
            }
            return restPhotoItems
        } catch {
            fatalError("Failed to fetch restaurant photos: \(error)")
        }
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
