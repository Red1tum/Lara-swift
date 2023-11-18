//
//  Types.swift
//  Lara
//
//  Created by Reditum on 11/15/23.
//

import SwiftUI

// It'd more correct to place these type in different files
// but in current scope it makes navigation easier

class User: ObservableObject {
    @Published var name: String
    @Published var imageName: String
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

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

class Issue: ObservableObject, Identifiable {
    @Published var imageName: String
    @Published var issue: String
    
    init(imageName: String, issue: String) {
        self.imageName = imageName
        self.issue = issue
    }
}

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

