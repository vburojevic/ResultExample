//
//  CommentCellItem.swift
//  ResultExample
//
//  Created by Vedran Burojevic on 27/09/2016.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

struct CommentCellItem {
    let name: NSAttributedString
    let body: String
}

extension CommentCellItem {
    init(comment: Comment) {
        name = {
            let attributes = [NSFontAttributeName: UIFont.boldSystemFontOfSize(15)]
            return NSAttributedString(string: comment.email, attributes: attributes, formattedSubstrings: [comment.email])
        }()
        body = comment.body
    }
}
