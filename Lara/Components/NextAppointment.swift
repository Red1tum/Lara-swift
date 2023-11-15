//
//  NextAppointment.swift
//  Lara
//
//  Created by Reditum on 11/12/23.
//

import SwiftUI

class NextAppointmentInfo: ObservableObject {
    @Published var imageName: String
    @Published var doctorName: String
    @Published var doctorPosition: String
    @Published var date: String
    @Published var time: String
    
    init(imageName: String, doctorName: String, doctorPosition: String, date: String, time: String) {
        self.imageName = imageName
        self.doctorName = doctorName
        self.doctorPosition = doctorPosition
        self.date = date
        self.time = time
    }
}

struct NextAppointment: View {
    @State var info: NextAppointmentInfo
    
    var body: some View {
        // It would be more correct to create few buttons like
        // doctor info and next appointment info
        Button(action: {}) {
            VStack(alignment: .center, spacing: 16) {
                HStack(alignment: .center) {
                    Image(info.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .avatarFrame(alignment: .top)
//                        .frame(width: Sizes.avatarWidth, height: Sizes.avatarHeight, alignment: .top)
                        .offset(CGSize(width: 0.0, height: 5.0))
                        .background(
                            Circle()
                                .foregroundColor(.white)
                        )
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 8) {
                        Text(info.doctorName)
                            .poppinsBold(size: 16)
                            .bold()
                            .foregroundColor(.white)
                        Text(info.doctorPosition)
                            .poppinsRegular(size: 14)
                            .foregroundStyle(Color(red: 0.8, green: 0.88, blue: 1))
                    }
                    .padding(0)
                    Spacer()
                    // this doesn't seem like a good design because
                    // the button is small and therefore it's hard
                    // for use to aim for button
                    Button(action: {}) {
                        Image("arrow_right")
                    }
                }
                Divider()
                    .background(Color.white)
                HStack(alignment: .top, spacing: 30) {
                    Label {
                        Text(info.date)
                            .poppinsRegular(size: 12)
                            .foregroundColor(.white)
                    } icon: {
                        Image("calendar")
                    }
                    Label {
                        Text(info.time)
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
}

#Preview {
    let info = NextAppointmentInfo(imageName: "doctor_pic", doctorName: "Dr. Imran Syahir", doctorPosition: "General Doctor", date: "Sunday, 12 June", time: "11:00 - 12:00 AM")
    return NextAppointment(info: info)
}


