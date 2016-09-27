//
//  Address.swift
//  ResultDemo
//
//  Created by Vedran Burojevic on 26/09/2016.
//  Copyright © 2016 Infinum. All rights reserved.
//

import Unbox

struct Address {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geolocation: Geolocation
}

extension Address: Unboxable {
    init(unboxer: Unboxer) {
        street = unboxer.unbox("street")
        suite = unboxer.unbox("suite")
        city = unboxer.unbox("city")
        zipcode = unboxer.unbox("zipcode")
        geolocation = unboxer.unbox("geo")
    }
}
