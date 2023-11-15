//
//  Sizes.swift
//  Lara
//
//  Created by Reditum on 11/15/23.
//

import SwiftUI

struct Sizes {
    static let elementWidth: CGFloat = 327
    static let nearDoctorWidth: CGFloat = 295
}

extension View {
    func avatarFrame(alignment: Alignment) -> some View {
        return self.frame(width: 58.0, height: 73, alignment: alignment)
    }
    
    func iconFrame(alignment: Alignment = .center) -> some View {
        return self.frame(width: 24, height: 24, alignment: alignment)
    }
    
    func issueFrame() -> some View {
        return self.frame(width: 72, height: 72)
    }
}
