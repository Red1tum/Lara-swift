//
//  NearDoctorList.swift
//  Lara
//
//  Created by Reditum on 11/14/23.
//

import SwiftUI

class NearDoctorInfo: ObservableObject, Identifiable {
    @Published var name: String
    @Published var position: String
    @Published var distanceToPatient: Float
    
    // It would be more correct to add these to different
    // class but then the initialization will be more tedious
    @Published var rating: Float
    @Published var qtyOfReviews: Int
    
    @Published var openAt: String
    
    @Published var imageName: String
    
    init(name: String, position: String, distanceToPatient: Float, rating: Float, qtyOfReviews: Int, openAt: String, imageName: String) {
        self.name = name
        self.position = position
        self.distanceToPatient = distanceToPatient
        self.rating = rating
        self.qtyOfReviews = qtyOfReviews
        self.openAt = openAt
        self.imageName = imageName
    }
}

class NearDoctors: ObservableObject, Identifiable {
    @Published var doctors = [NearDoctorInfo]()
    
    init(doctors: [NearDoctorInfo]) {
        self.doctors = doctors
    }
    
}

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
                    .foregroundColor(Color(red: 0.28, green: 0.58, blue: 1))
                }
                .padding(0)
                .frame(width: Sizes.nearDoctorWidth, alignment: .topLeading)
            }
            .frame(width: Sizes.elementWidth, alignment: .top)
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
            .background(.white)
            .cornerRadius(12)
            .shadow(color: Color(red: 0.35, green: 0.46, blue: 0.65).opacity(0.04), radius: 10, x: 2, y: 12)
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
