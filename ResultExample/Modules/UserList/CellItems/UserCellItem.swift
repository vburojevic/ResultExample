//
//  UserCellItem.swift
//  ResultDemo
//
//  Created by Vedran Burojevic on 26/09/2016.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

struct UserCellItem {
    let nameAndWorkplace: NSAttributedString
    let fullAddress: String
}

extension UserCellItem {
    init(user: User) {
        nameAndWorkplace = {
            let attributes = [NSFontAttributeName: UIFont.boldSystemFontOfSize(15)]
            let nameAndWorkplaceString = user.name + " from " + user.company.name
            return NSAttributedString(string: nameAndWorkplaceString, attributes: attributes, formattedSubstrings: [user.name, user.company.name])
        }()
        fullAddress = [user.address.street, user.address.suite, user.address.city, user.address.zipcode].joinWithSeparator(", ")
    }
}
