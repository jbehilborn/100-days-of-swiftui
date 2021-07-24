//
//  DetailUserView.swift
//  UsersList
//
//  Created by John Hilborn on 2021-07-23.
//

import SwiftUI

struct DetailUserView: View {
    var user: User
    var users: Users
    @State private var isShowingFriendList = false
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                Text(user.name)
            }
            
            Section(header: Text("Age")) {
                Text("\(user.age)")
            }
            
            Section(header: Text("Company")) {
                Text(user.company)
            }
            
            Section(header: Text("Is Active")) {
                Text(user.checkIsActive)
            }
            
            Section(header: Text("Show friends")) {
                Toggle(isOn: $isShowingFriendList) {
                    Text("Show \(user.name)'s friends list")
                }
            }
            
            if isShowingFriendList {
                Section(header: Text("\(user.name)'s friends")) {
                    NavigationLink(destination: FriendsListView(users: self.users, user: self.user)) {
                        Text("Show \(user.name)'s friends")
                    }
                }
            }
        }
        .navigationBarTitle(Text("User: \(user.name)"), displayMode: .inline)
    }
}

struct DetailUserView_Previews: PreviewProvider {
    static var previews: some View {
        DetailUserView(user: User(id: "ID", name: "Name", age: 30, company: "COM", isActive: true, friends: [Friend]()), users: Users())
    }
}
