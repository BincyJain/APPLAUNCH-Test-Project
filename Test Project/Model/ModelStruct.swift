//
//  ModelStruct.swift
//  Test Project
//
//  Created by Bincy Jain on 01/10/21.
//

import Foundation


struct Home {
    let text: String
    let image: String
    
    init(text: String, image: String) {
        self.text = text
        self.image = image
    }
}

struct OrderAgain {
    let restaurant: String
    let duration: String
    let offer: String
    let location: String
    let image: String
    init(restaurant: String, duration: String, offer: String, location: String, image: String) {
        self.restaurant = restaurant
        self.duration = duration
        self.offer = offer
        self.location = location
        self.image = image
    }
}

struct Restaurant {
    let category: String
    let duration: String
    let offer: String
    let upto: String
    let orderCount: String
    let rate: String
    let rating: String
    let restaurantName: String
    var bookmark: String
    let image: String
    let location: String
    let order: String
    
    init(category: String, duration: String, offer: String, upto: String, orderCount: String, rate: String, rating: String, restaurantName: String, bookmark: String, image: String, location: String, order: String) {
        self.category = category
        self.duration = duration
        self.offer = offer
        self.upto = upto
        self.orderCount = orderCount
        self.rate = rate
        self.rating = rating
        self.restaurantName = restaurantName
        self.bookmark = bookmark
        self.image = image
        self.location = location
        self.order = order
    }
    
}


var restaurantArray = [Restaurant(category: "Burger, Fast Food, Beverages, Desserts", duration: "51", offer: "20", upto: "50", orderCount: "2525", rate: "250", rating: "4.0", restaurantName: "KFC", bookmark: "0", image: "foodImage1", location: "Bangalore", order: "1"), Restaurant(category: "Andhra, North Indian, Seafood, Biryani", duration: "59", offer: "30", upto: "50", orderCount: "25250", rate: "250", rating: "4.3", restaurantName: "Meghana Foods", bookmark: "1", image: "foodImage2", location: "Indiranagar", order: "1"), Restaurant(category: "Bakery, Desserts", duration: "43", offer: "60", upto: "40", orderCount: "10575", rate: "250", rating: "4.4", restaurantName: "Magnolia Bakery", bookmark: "0", image: "foodImage3", location: "Whitefield", order: "0"), Restaurant(category: "Biryani, North Indian, Chinese, Mughlai, Kebab, Seafood, Desserts, Beverages", duration: "52", offer: "20", upto: "60", orderCount: "8150", rate: "250", rating: "4.0", restaurantName: "Hyderabad Biryaani House", bookmark: "0", image: "foodImage1", location: "Varthur", order: "1"), Restaurant(category: "Ice Cream, Desserts, Beverages", duration: "46", offer: "20%", upto: "200", orderCount: "400", rate: "200", rating: "4.2", restaurantName: "Baskin Robbins", bookmark: "0", image: "foodImage2", location: "Karnataka", order: "1"), Restaurant(category: "Burger, Fast Food, Beverages, Desserts", duration: "51", offer: "20", upto: "50", orderCount: "2525", rate: "250", rating: "4.0", restaurantName: "KFC1", bookmark: "0", image: "foodImage1", location: "Bangalore", order: "1"), Restaurant(category: "Burger, Fast Food, Beverages, Desserts", duration: "51", offer: "20", upto: "50", orderCount: "2525", rate: "250", rating: "4.0", restaurantName: "KFC2", bookmark: "0", image: "foodImage1", location: "Bangalore", order: "1"), Restaurant(category: "Burger, Fast Food, Beverages, Desserts", duration: "51", offer: "20", upto: "50", orderCount: "2525", rate: "250", rating: "4.0", restaurantName: "KFC", bookmark: "0", image: "foodImage1", location: "Bangalore", order: "1")]
var locationAddress: String = ""
