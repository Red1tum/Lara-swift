//
//  HomeScreen.swift
//  Lara
//
//  Created by Reditum on 11/15/23.
//

import SwiftUI

struct HomeScreen: View {
    let nextAppointmentInfo: NextAppointmentInfo = NextAppointmentInfo(imageName: "doctor_pic", doctorName: "Dr. Imran Syahir", doctorPosition: "General Doctor", date: "Sunday, 12 June", time: "11:00 - 12:00 AM")
    let issueList: [Issue] = [
       Issue(imageName: "covid", issue: "Covid 19"),
       Issue(imageName: "doctor", issue: "Doctor"),
       Issue(imageName: "medicine", issue: "Medicine"),
       Issue(imageName: "hospital", issue: "Hospital"),
    ]
    
    let doctors: [NearDoctorInfo] = [
        NearDoctorInfo(name: "Dr. Joseph Brostilo", position: "Dental Specialist", distanceToPatient: 1.2, rating: 4.8, qtyOfReviews: 120, openAt: "17:00", imageName: "doctor_pic_2"),
        NearDoctorInfo(name: "Dr. Imran Syahir", position: "General Doctor", distanceToPatient: 1.2, rating: 4.8, qtyOfReviews: 120, openAt: "17:00", imageName: "doctor_pic"),
    ]
    
    let userName = "James"
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 32) {
                TopBar(userName: userName)
                NextAppointment(info: nextAppointmentInfo)
                Search()
                IssueList(issues: issueList)
                NearDoctorList(nearDoctors: doctors)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    HomeScreen()
}
