//
//  ContentView.swift
//  SwiftUITrial
//
//  Created by Evan Emelga on 08/06/19.
//  Copyright © 2019 Evan Emelga. All rights reserved.
//

import SwiftUI

struct UserViewModel: Identifiable{
    var id: Int
    let username, message, picture: String
}

struct ContentView : View {
    
    let users: [UserViewModel] = [
        .init(id: 1, username: "iForgot Sorry", message: "Hello World!", picture: "person1"),
        .init(id: 2, username: "Jony Ive", message: "Hello", picture: "person2"),
        .init(id: 3, username: "Craig Federighi", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc hendrerit iaculis diam, vitae semper augue ullamcorper a. Maecenas eu elit ut sapien ullamcorper aliquet. Vestibulum ut nisi ut leo aliquet rutrum. Donec justo est, suscipit ut eleifend ac, euismod sit amet neque. Donec non lectus eu neque dignissim consectetur ac nec dolor. Duis vehicula convallis dolor in rhoncus. Suspendisse nec erat diam. Donec consectetur mauris ante, in condimentum sem pretium nec. Nullam sagittis neque quis lacus dictum feugiat. Donec interdum elit vel diam bibendum, sed pharetra tellus malesuada.", picture: "person3")
    ]
    
    var body: some View {
        NavigationView{
            List{
                Text("Users").font(.largeTitle)
                ForEach(users.identified(by: \.id)){ user in
                    UserRow(user: user)
                }
            }.navigationBarTitle(Text("Dynamic List"))
        }
    }
}

struct UserRow: View {
    let user: UserViewModel
    var body: some View{
        
        HStack{
            Image(user.picture)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .frame(width: 70, height: 70)
            
            VStack(alignment: .leading){
                Text(user.username).font(.headline)
                Text(user.message).font(.subheadline).lineLimit(nil)
            }.padding(.leading, 8)
        }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
