//
//  Users.swift
//  UsersList
//
//  Created by John Hilborn on 2021-07-23.
//

import Foundation
import SwiftUI

class Users: ObservableObject {
    @Published var arrayOfUsers = [User]()
    
    init() {
        let stringURL = "https://www.hackingwithswift.com/samples/friendface.json"
        guard let url = URL(string: stringURL) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response \(error?.localizedDescription ?? "No data response")")
                return
            }
            if let decoderUser = try? JSONDecoder().decode([User].self, from: data) {
                self.arrayOfUsers = decoderUser
            }
        }.resume()
    }
    
    func findUser(string: String) -> User {
        guard let firstUser = self.arrayOfUsers.first(where: { (oneUser) -> Bool in
            oneUser.id == string
        }) else {
            return self.arrayOfUsers.first!
        }
        return firstUser
    }
}
