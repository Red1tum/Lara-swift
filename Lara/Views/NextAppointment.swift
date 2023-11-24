//
//  NextAppointment.swift
//  Lara
//
//  Created by Reditum on 11/12/23.
//

import SwiftUI

struct NextAppointment: View {
    @State var info: NextAppointmentInfo
    
    var body: some View {
        // It would be more correct to create few buttons like
        // doctor info and next appointment info
        Button(action: {}) {
            VStack(alignment: .center, spacing: 16) {
                HStack(alignment: .center, spacing: 12) {
                    Image(info.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .avatarFrame(alignment: .top)
                        .background(
                            Circle()
                                .foregroundColor(Colors.primary)
                        )
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 4) {
                        Text(info.doctorName)
                            .poppinsBold(size: 16)
                            .bold()
                            .foregroundColor(Colors.primary)
                        Text(info.doctorPosition)
                            .poppinsRegular(size: 14)
                            .foregroundStyle(Colors.grayishWhite)
                    }
                    .padding(0)
                    Spacer()
                    // this doesn't seem like a good design because
                    // the button is small and therefore it's hard
                    // for use to aim for button
                    Button(action: {}) {
                        Image(Icons.arrowRight)
                            .resizable()
                            .iconFrame()
                    }
                }
                Divider()
                    .padding([.leading, .trailing], 16)
                    .background(Colors.primary)

                HStack(alignment: .top) {
                    Label {
                        Text(info.date)
                            .poppinsRegular(size: 12)
                            .foregroundColor(Colors.primary)
                    } icon: {
                        Image(Icons.calendar)
                            .resizable()
                            .smallIconFrame()
                    }
                    Spacer()
                    Label {
                        Text(info.time)
                            .poppinsRegular(size: 12)
                            .foregroundColor(Colors.primary)
                    } icon: {
                        Image(Icons.clock)
                            .resizable()
                            .smallIconFrame()
                    }
                    .padding(.trailing, 12)
                }
                .padding(0)
               // .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .padding(20)
            .frame(alignment: .top)
            .background(Colors.blue)
            .cornerRadius(Sizes.cornerRadius)
        }
        .accessibilityLabel("Your next appointment, button")
        .accessibilityValue("Your next appointment with doctor \(info.doctorPosition), \(info.doctorPosition) scheduled for \(info.date), \(info.time). Tap to get more information.")
    }
}

#Preview {
    let info = NextAppointmentInfo(imageName: "doctor_pic", doctorName: "Dr. Imran Syahir", doctorPosition: "General Doctor", date: "Sunday, 12 June", time: "11:00 - 12:00 AM")
    return NextAppointment(info: info)
}


