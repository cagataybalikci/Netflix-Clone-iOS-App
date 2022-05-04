//
//  Extensions.swift
//  NetflixClone
//
//  Created by Çağatay Balıkçı on 4.05.2022.
//

import Foundation


extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
