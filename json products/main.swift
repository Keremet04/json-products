//
//  main.swift
//  json products
//
//  Created by Керемет  on 5/1/23.
//


import Foundation

let products = """

[
{
    "name": "chicken",
    "price": 700,
    "weight": "1 kg"
},

{
    "name": "tomatos",
    "price": 150,
    "weight": "1 kg"
}
]
"""

struct Products: Codable {
    
    var name: String
    var price: Int?
    var weight: String
}

class Shop: Decodable {
    private var goods: [Products] = [] {
        didSet {
            print(goods)
        }
    }
    
    func getProducts() {
        let productsData = Data(products.utf8)
        let productsDecoder = JSONDecoder()
        
        do {
            let decodedProducts = try productsDecoder.decode([Products].self, from: productsData)
           goods = decodedProducts
        }catch{
            print("Error: \(error.localizedDescription)")
        }
    }
}

let controller = Shop()
controller.getProducts()
