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
                                .foregroundColor(.white)
                        )
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 8) {
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
                    Image("location")
                    Text("\(String(format: "%.1f", nearDoctor.distanceToPatient)) KM")
                        .poppinsRegular(size: 14)
                        .foregroundColor(Colors.blackishGray)
                }
                .frame(width: Sizes.nearDoctorWidth, alignment: .center)
                .padding(0)
                Divider()
                HStack(alignment: .top, spacing: 24) {
                    Label {
                        Text("\(String(format: "%.1f", nearDoctor.rating)) (\(nearDoctor.qtyOfReviews) reviews)")
                            .poppinsRegular(size: 12)
                    } icon: {
                        Image("clock")
                            .renderingMode(.template)
                    }
                    .foregroundColor(Colors.yellow)
                    Label {
                        Text("Open at \(nearDoctor.openAt)")
                            .poppinsRegular(size: 12)
                    } icon: {
                        Image("calendar")
                            .renderingMode(.template)
                    }
                    .foregroundColor(Colors.blue)
                }
                .padding(0)
                .frame(width: Sizes.nearDoctorWidth, alignment: .topLeading)
            }
            .frame(width: Sizes.elementWidth, alignment: .top)
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
            .background(.white)
            .cornerRadius(Sizes.cornerRadius)
            .shadow(color: Colors.shadow, radius: 10, x: 2, y: 12)
        }
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
                .padding(.horizontal, 16)
            ForEach(nearDoctors) {nearDoctor in
                NearDoctorCard(nearDoctor: nearDoctor)
            }
        }
        .padding(0)
        .frame(maxWidth: .infinity, alignment: .center)
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
