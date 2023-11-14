//
//  Fonts.swift
//  UkucajSe-23
//
//  Created by Nikola Zivkovic on 10/23/23.
//

import Foundation
import SwiftUI

extension Font {
    static var lexendRegLarge: Font {
        return .custom("LexendExa-Regular", size: 48, relativeTo: .largeTitle)
    }
    
    static var lexendRegTitle: Font {
        return .custom("LexendExa-Regular", size: 36, relativeTo: .title)
    }
    
    static var lexendRegTitle2: Font {
        return .custom("LexendExa-Regular", size: 16, relativeTo: .title2)
    }
    
    static var lexendRegCaption: Font {
        return .custom("LexendExa-Regular", size: 14, relativeTo: .caption)
    }
    
    static var lexendRegFootnote: Font {
        return .custom("LexendExa-Regular", size: 14, relativeTo: .footnote)
    }
    
    static var lexendMedTitle: Font {
        return .custom("LexendExa-Medium", size: 18, relativeTo: .title)
    }
    
    static var lexendMedTitle2: Font {
        return .custom("LexendExa-Medium", size: 16, relativeTo: .title2)
    }
    
}
