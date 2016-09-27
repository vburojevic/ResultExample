//
//  User.swift
//  ResultDemo
//
//  Created by Vedran Burojevic on 26/09/2016.
//  Copyright © 2016 Infinum. All rights reserved.
//

import Unbox

struct User {
    let ID: Int
    let name: String
    let username: String
    let phone: String
    let website: String
    let address: Address
    let company: Company
}

extension User: Unboxable {
    init(unboxer: Unboxer) {
        ID = unboxer.unbox("id")
        name = unboxer.unbox("name")
        username = unboxer.unbox("username")
        phone = unboxer.unbox("phone")
        website = unboxer.unbox("website")
        address = unboxer.unbox("address")
        company = unboxer.unbox("company")
    }
}
