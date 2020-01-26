//
//  DetailView.swift
//  FriendFace
//
//  Created by Oliver Lippold on 25/01/2020.
//  Copyright © 2020 Oliver Lippold. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @State var user: User
    var users: [User]
    
    var body: some View {
        Form {
            ItemView(sideHeading: "Address", text: user.address)
            ItemView(sideHeading: "Age:", text: String(user.age))
            ItemView(sideHeading: "Company", text: user.company)
            ItemView(sideHeading: "Email", text: user.email)
            ItemView(sideHeading: "About", text: user.about)
        
            Section(header: Text("Friends")) {
                
                List(user.friends) { friend in
                    NavigationLink(destination: DetailView(user: self.getUserFromId(friend.id), users: self.users)) {
                        Text(friend.name)
                    }
                }
                
            }
            Section(header: Text("Tags:")) {
                List(user.tags, id: \.self) { tag in
                    Text(tag)
                }
            }
            // todo: display array of tags
            // todo: display friends
            
        }
        .navigationBarTitle("\(user.name)")
    }
    
    func getUserFromId(_ id: UUID) -> User {
        return users.first(where: { $0.id == id}) ?? User()
    }
}

struct ItemView: View {
    let sideHeading: String
    let text: String
    
    var body: some View {
        HStack {
            Text(sideHeading)
                .font(.subheadline)
                .fontWeight(.bold)
            Text(text)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User(), users: [User]())
    }
}
