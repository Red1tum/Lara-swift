//
//  Sizes.swift
//  Lara
//
//  Created by Reditum on 11/15/23.
//

import SwiftUI

struct Sizes {
    let avatarWidth = 58.0
    let avatarHeight = 73.0
}

extension View {
    func avatarFrame(alignment: Alignment) -> some View {
        return self.frame(width: 58.0, height: 73, alignment: alignment)
    }
}
