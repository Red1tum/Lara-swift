//
//  FontsExtensions.swift
//  Lara
//
//  Created by Reditum on 11/13/23.
//

import SwiftUI

//extension Text {
//    func poppinsBold(size: CGFloat) -> Text {
//        return self.font(.custom("Poppins-Bold", size: size))
//    }
//    
//    func poppinsRegular(size: CGFloat) -> Text {
//        return self.font(.custom("Poppins-Regular", size: size))
//    }
//}

extension View {
    func poppinsBold(size: CGFloat) -> some View {
        return self.font(.custom("Poppins-Bold", size: size))
    }
    
    func poppinsRegular(size: CGFloat) -> some View {
        return self.font(.custom("Poppins-Regular", size: size))
    }
    
}
