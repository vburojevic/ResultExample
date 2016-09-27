//
//  NSAttributedStringExtensions.swift
//  mLoterija
//
//  Created by Vedran Burojevic on 21/09/2016.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    convenience init(string: String, attributes: [String : AnyObject], formattedSubstrings: [String]) {        
        let attributedString = NSMutableAttributedString(string: string)
        
        formattedSubstrings.forEach { substring in
            let range: NSRange = (string as NSString).rangeOfString(substring)
            attributedString.addAttributes(attributes, range: range)
        }
        
        self.init(attributedString: attributedString)
    }
    
}
