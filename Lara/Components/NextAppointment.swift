//
//  NextAppointment.swift
//  Lara
//
//  Created by Reditum on 11/12/23.
//

import SwiftUI

struct NextAppointment: View {
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            HStack(alignment: .center) {
                Image("doctor_pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 48, alignment: .top)
                    .background(
                        Circle()
                            .foregroundColor(.white)
                    )
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 8) {
                    Text("Dr. Imran Syahir")
                        .poppinsBold(size: 16)
                        .bold()
                        .foregroundColor(.white)
                    Text("General Doctor")
                        .poppinsRegular(size: 14)
                        .foregroundStyle(Color(red: 0.8, green: 0.88, blue: 1))
                }
                .padding(0)
                Spacer()
                Image("arrow_right")
            }
            Divider()
                .background(Color.white)
            HStack(alignment: .top, spacing: 30) {
                Label {
                    Text("Sunday, 12 June")
                        .poppinsRegular(size: 12)
                        .foregroundColor(.white)
                } icon: {
                    Image("calendar")
                }
                Label {
                    Text("11:00 - 12:00 AM")
                        .poppinsRegular(size: 12)
                        .foregroundColor(.white)
                } icon: {
                    Image("clock")
                }
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
        }
        .padding(20)
        .frame(width: 327, alignment: .top)
        .background(Color(red: 0.28, green: 0.58, blue: 1))
        .cornerRadius(12)
    }
}

#Preview {
    NextAppointment()
}
