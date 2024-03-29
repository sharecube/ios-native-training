//
//  PersonCell.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 6/16/19.
//  Copyright © 2019 chrisik. All rights reserved.
//

import UIKit

final class PersonCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func update(_ person: PersonModel) {
        
        textLabel?.text = "\(person.firstName) \(person.lastName)"
        detailTextLabel?.text = String(person.id)
    }

}
