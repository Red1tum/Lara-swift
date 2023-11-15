//
//  ContentView.swift
//  Lara
//
//  Created by Reditum on 11/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var SelectedTab: String = "Home"
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
    
    var body: some View {
        ZStack {
            TabView(selection: $SelectedTab) {
                ScrollView {
                    VStack(alignment: .center, spacing: 32) {
                        TopBar()
                        NextAppointment(info: nextAppointmentInfo)
                        Search()
                        IssueList(issues: issueList)
                        NearDoctorList(nearDoctors: doctors)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                }
                .tag("Home")
                Text("Not implemented")
                    .tag("Schedule")
                Text("Not implemented")
                    .tag("Chat")
                Text("Not implemented")
                    .tag("Profile")
            }
            Spacer()
            VStack {
                Spacer()
                BottomBar(selectedTab: $SelectedTab)
                    .frame(maxWidth: .infinity)
                    .background(.white)
            }
//            .frame(width: 327, height: 80)
//            .background(.white)
        }
    }
}

#Preview {
    ContentView()
}
