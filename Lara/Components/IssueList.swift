//
//  IssueList.swift
//  Lara
//
//  Created by Reditum on 11/14/23.
//

import SwiftUI

class Issue: ObservableObject, Identifiable {
    @Published var imageName: String
    @Published var issue: String
    
    init(imageName: String, issue: String) {
        self.imageName = imageName
        self.issue = issue
    }
}

struct IssueView: View {
    @StateObject var issue: Issue
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Button(action: {
                
            }) {
                Image(issue.imageName)
                    .frame(width: 82, height: 82)
                    .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            Text(issue.issue)
                .poppinsRegular(size: 15)
                .foregroundColor(Color(red: 0.53, green: 0.59, blue: 0.73))
        }
    }
}

struct IssueList: View {
    @State var issues: [Issue]
    var body: some View {
        HStack(alignment: .top, spacing: 13) {
            ForEach(issues) {issue in
                IssueView(issue: issue)
            }
        }
    }
}


#Preview {
    return IssueView(issue: Issue(imageName: "covid", issue: "Covid 19"))
}

#Preview {
    let issue: [Issue] = [
       Issue(imageName: "covid", issue: "Covid 19"),
       Issue(imageName: "doctor", issue: "Doctor"),
       Issue(imageName: "medicine", issue: "Medicine"),
       Issue(imageName: "hospital", issue: "Hospital"),
    ]
    
    return IssueList(issues: issue)
}
