//
//  UImageView+Dowload.swift
//  Disney Characters
//
//  Created by user on 17/08/23.
//

import UIKit

extension UIImageView {
    func download(from imageURL: String) {
        let url = URL(string: imageURL)!
        
        URLSession.shared.dataTask(with: .init(url: url))
        {
            data, _, error in
            
            if error != nil { return }
            
            if let data
            {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            } else { return }
        }.resume()
    }
}
