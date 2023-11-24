//
//  IssueList.swift
//  Lara
//
//  Created by Reditum on 11/14/23.
//

import SwiftUI

struct IssueView: View {
    @StateObject var issue: Issue
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Button(action: {}) {
                Image(issue.imageName)
                    .issueFrame()
                    .background(Colors.whitishGray)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            Text(issue.issue)
                .poppinsRegular(size: 15)
                .foregroundColor(Colors.blackishGray)
        }
        .accessibilityLabel("Issue - \(issue.issue), button")
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
        .padding(0)
        .accessibilityLabel("List of issues")
    }
}


#Preview {
    return IssueView(issue: Issue(imageName: "covid", issue: "Covid 19"))
}

#Preview {
    let issue: [Issue] = [
        Issue(imageName: Icons.covid, issue: "Covid 19"),
        Issue(imageName: Icons.doctor, issue: "Doctor"),
        Issue(imageName: Icons.medicine, issue: "Medicine"),
        Issue(imageName: Icons.hospital, issue: "Hospital"),
    ]
    
    return IssueList(issues: issue)
}
