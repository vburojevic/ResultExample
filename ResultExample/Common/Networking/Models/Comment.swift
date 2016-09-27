//
//  Comment.swift
//  ResultExample
//
//  Created by Vedran Burojevic on 27/09/2016.
//  Copyright © 2016 Infinum. All rights reserved.
//

import Unbox

struct Comment {
    let postID: Int
    let ID: Int
    let name: String
    let email: String
    let body: String
}

extension Comment: Unboxable {
    init(unboxer: Unboxer) {
        postID = unboxer.unbox("postId")
        ID = unboxer.unbox("id")
        name = unboxer.unbox("name")
        email = unboxer.unbox("email")
        body = unboxer.unbox("body")
    }
}
