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
            Button(action: {
                
            }) {
                Image(issue.imageName)
                    .issueFrame()
                    .background(Colors.whitishGray)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            Text(issue.issue)
                .poppinsRegular(size: 15)
                .foregroundColor(Colors.blackishGray)
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
        .padding(0)
        .frame(width: 327)
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
