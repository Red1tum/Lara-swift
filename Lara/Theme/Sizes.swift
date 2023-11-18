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
    static let cornerRadius: CGFloat = 12
    static let tabItemMinWidth: CGFloat = 70
}

extension View {
    func avatarFrame(alignment: Alignment) -> some View {
        return self.frame(width: 48.0, height: 48.0, alignment: alignment)
    }
    
    
    // I think there's an issue with design because there shouldn't be
    // 3 different sizes for icons
    func iconFrame(alignment: Alignment = .center) -> some View {
        return self.frame(width: 24, height: 24, alignment: alignment)
    }
    
    func mediumIconFrame(alignment: Alignment = .center) -> some View {
        return self.frame(width: 20, height: 20, alignment: alignment)
    }

    func smallIconFrame(alignment: Alignment = .center) -> some View {
        return self.frame(width: 16, height: 16, alignment: alignment)
    }
    
    func issueFrame() -> some View {
        return self.frame(width: 72, height: 72)
    }
}
