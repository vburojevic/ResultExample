//
//  Company.swift
//  ResultDemo
//
//  Created by Vedran Burojevic on 26/09/2016.
//  Copyright © 2016 Infinum. All rights reserved.
//

import Unbox

struct Company {
    let name: String
    let catchPhrase: String
    let businessSlogan: String
}

extension Company: Unboxable {
    init(unboxer: Unboxer) {
        name = unboxer.unbox("name")
        catchPhrase = unboxer.unbox("catchPhrase")
        businessSlogan = unboxer.unbox("bs")
    }
}
