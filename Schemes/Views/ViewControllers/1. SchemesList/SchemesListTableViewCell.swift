//
//  SchemesListTableViewCell.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 14/07/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class SchemesListTableViewCell: UITableViewCell {

    var viewModel: SchemesListCellViewModelType? {
        willSet (newModel){
            guard let model = newModel else { return }
            schemeName.text = model.schemeName()
//            let titleColor = UIColor(red: CGFloat(model.schemeTitleColor()[0]), green: CGFloat(model.schemeTitleColor()[1]), blue: CGFloat(model.schemeTitleColor()[2]), alpha: CGFloat(model.schemeTitleColor()[3]))
            let titleColor = UIColor.black
            schemeName.textColor = titleColor
            schemeCreationDate.text = model.schemeCreationDate()
            
//            let borderColor = UIColor(red: CGFloat(model.borderColor()[0]), green: CGFloat(model.borderColor()[1]), blue: CGFloat(model.borderColor()[2]), alpha: CGFloat(model.borderColor()[3]))
            let borderColor = newModel?.borderColor() as! Array<Float>
//            self.layer.borderColor = UIColor(red: CGFloat(borderColor[0]), green: CGFloat(borderColor[1]), blue: CGFloat(borderColor[2]), alpha: CGFloat(borderColor[0])).cgColor
            self.layer.borderColor = titleColor.cgColor
            self.layer.borderWidth = 2
        }
    }

    @IBOutlet weak var schemeName: UILabel!
    @IBOutlet weak var schemeCreationDate: UILabel!
//    @IBOutlet weak var itemsCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
