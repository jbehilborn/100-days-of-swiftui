//
//  FriendsListView.swift
//  UsersList
//
//  Created by John Hilborn on 2021-07-23.
//

import SwiftUI

struct FriendsListView: View {
    var users: Users
    var user: User
    
    var body: some View {
        List(user.friends) {
            friend in
            NavigationLink(destination: DetailUserView(user: self.users.findUser(string: friend.id), users: self.users)) {
                VStack(alignment: .leading, spacing: nil) {
                    Text(friend.name)
                }
            }
        }
        .navigationBarTitle("\(self.user.name)'s friends", displayMode: .inline)
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView(users: Users(), user: User(id: "ID", name: "Name", age: 30, company: "COM", isActive: true, friends: [Friend]()))
    }
}
