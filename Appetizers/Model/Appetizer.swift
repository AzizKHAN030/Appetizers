//
//  Appetizer.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 11/01/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Float
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 00001, name: "Test Appetizer", description: "Test descrdmkdmckdck ckdm cdkmckd mkcd kcmd iption for APpetizer", price: 9.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 99, protein: 129, carbs: 93)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItem1 = Appetizer(id: 00001, name: "Test Appetizer 1", description: "Test descrdmkdmckdck ckdm cdkmckd mkcd kcmd iption for APpetizer", price: 9.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 99, protein: 129, carbs: 93)
    static let orderItem2 = Appetizer(id: 00002, name: "Test Appetizer 2", description: "Test descrdmkdmckdck ckdm cdkmckd mkcd kcmd iption for APpetizer", price: 9.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 99, protein: 129, carbs: 93)
    static let orderItem3 = Appetizer(id: 00003, name: "Test Appetizer 3", description: "Test descrdmkdmckdck ckdm cdkmckd mkcd kcmd iption for APpetizer", price: 9.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 99, protein: 129, carbs: 93)
    
    static let orderItems = [orderItem1, orderItem2, orderItem3]
}
