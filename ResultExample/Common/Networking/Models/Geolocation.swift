//
//  Geolocation.swift
//  ResultDemo
//
//  Created by Vedran Burojevic on 26/09/2016.
//  Copyright © 2016 Infinum. All rights reserved.
//

import Unbox

struct Geolocation {
    let latitude: Double
    let longitude: Double
}

extension Geolocation: Unboxable {
    init(unboxer: Unboxer) {
        latitude = unboxer.unbox("lat")
        longitude = unboxer.unbox("lng")
    }
}
