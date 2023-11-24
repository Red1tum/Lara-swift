//
//  NearDoctorList.swift
//  Lara
//
//  Created by Reditum on 11/14/23.
//

import SwiftUI

struct NearDoctorCard: View {
    @StateObject var nearDoctor: NearDoctorInfo
    
    var body: some View {
        Button(action: {}) {
            VStack(alignment: .center, spacing: 20) {
                HStack(alignment: .center) {
                    Image(nearDoctor.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .avatarFrame(alignment: .top)
                        .background(
                            Circle()
                                .foregroundColor(Colors.primary)
                        )
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 4) {
                        Text(nearDoctor.name)
                            .poppinsBold(size: 16)
                            .bold()
                            .foregroundColor(Colors.midnight)
                        Text(nearDoctor.position)
                            .poppinsRegular(size: 14)
                            .foregroundColor(Colors.blackishGray)
                    }
                    .padding(0)
                    Spacer()
                    Image(Icons.location)
                    Text("\(String(format: "%.1f", nearDoctor.distanceToPatient)) KM")
                        .poppinsRegular(size: 14)
                        .foregroundColor(Colors.blackishGray)
                }
                .frame(alignment: .leading)
                .padding(0)
                Divider()
                    .padding([.leading, .trailing], 16)
                HStack(alignment: .top, spacing: 24) {
                    Label {
                        Text("\(String(format: "%.1f", nearDoctor.rating)) (\(nearDoctor.qtyOfReviews) reviews)")
                            .poppinsRegular(size: 12)
                    } icon: {
                        Image(Icons.clock)
                            .resizable()
                            .renderingMode(.template)
                            .mediumIconFrame()
                    }
                    .foregroundColor(Colors.yellow)
                    Spacer()
                    Label {
                        Text("Open at \(nearDoctor.openAt)")
                            .poppinsRegular(size: 12)
                    } icon: {
                        Image(Icons.clock)
                            .resizable()
                            .renderingMode(.template)
                            .mediumIconFrame()
                    }
                    .padding(.trailing, 24)
                    .foregroundColor(Colors.blue)
                }
                .padding(0)
                .frame(alignment: .topLeading)
            }
            .padding(.vertical, 20)
            .background(Colors.primary)
            .cornerRadius(Sizes.cornerRadius)
            .shadow(color: Colors.shadow, radius: 10, x: 2, y: 12)
        }
        .accessibilityLabel("Near doctor \(nearDoctor.name), \(nearDoctor.position), button")
        .accessibilityValue("Doctor \(nearDoctor.name), \(nearDoctor.position) is at distance \(nearDoctor.distanceToPatient) KM from you. Doctor's rating is \(nearDoctor.rating) with \(nearDoctor.qtyOfReviews). Doctor will be open at \(nearDoctor.openAt). Tap to get more information about him.")
    }
}

struct NearDoctorList: View {
    @State var nearDoctors: [NearDoctorInfo]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Near Doctor")
                .poppinsRegular(size: 16)
                .fontWeight(.semibold)
                .foregroundColor(Colors.midnight)
            ForEach(nearDoctors) {nearDoctor in
                NearDoctorCard(nearDoctor: nearDoctor)
            }
        }
        .padding(0)
        .frame(maxWidth: .infinity, alignment: .center)
        .accessibilityLabel("Near doctors list")
    }
}

#Preview {
    let nearDoctor = NearDoctorInfo(name: "Dr. Joseph Brostilo", position: "Dental Specialist", distanceToPatient: 1.2, rating: 4.8, qtyOfReviews: 120, openAt: "17:00", imageName: "doctor_pic_2")
    return NearDoctorCard(nearDoctor: nearDoctor)
}

#Preview {
    let nearDoctors = [
        NearDoctorInfo(name: "Dr. Joseph Brostilo", position: "Dental Specialist", distanceToPatient: 1.2, rating: 4.8, qtyOfReviews: 120, openAt: "17:00", imageName: "doctor_pic_2"),
        NearDoctorInfo(name: "Dr. Imran Syahir", position: "General Doctor", distanceToPatient: 1.2, rating: 4.8, qtyOfReviews: 120, openAt: "17:00", imageName: "doctor_pic"),
    ]
    
    return NearDoctorList(nearDoctors: nearDoctors)
}
