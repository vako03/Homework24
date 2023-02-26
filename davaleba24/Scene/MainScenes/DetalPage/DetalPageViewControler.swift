//
//  DetalPageViewControler.swift
//  davaleba24
//
//  Created by anzori  on 2/24/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class DetalPageViewControler: UIViewController {
    
     
      @IBOutlet private weak var titleLable: UILabel!
      @IBOutlet private weak var image: UIImageView!
      @IBOutlet private weak var textLable: UILabel!
      @IBOutlet private weak var dateLable: UILabel!

      
      override func viewDidLoad() {
        image.layer.cornerRadius = 20
          super.viewDidLoad()
          if let item = DataModel.shared.items.first {
              titleLable.text = item.title
              textLable.text = item.description
            dateLable.text = item.publisheddate
            let url = URL(string: item.poster_path)
            let data = try? Data(contentsOf: url!)
            if let imageData = data {
                    self.image.image = UIImage(data: imageData)
        }
     }
        
    }

    
}
