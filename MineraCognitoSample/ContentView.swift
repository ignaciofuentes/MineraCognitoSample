//
//  ContentView.swift
//  MineraCognitoSample
//
//  Created by Fuentes, Ignacio on 11/15/24.
//

import SwiftUI
import Amplify
import Authenticator

struct ContentView: View {
    @State private var showAlert = false
    var body: some View {
        Authenticator
        { state in
            Text("Logged In Content")
            Button("Sign Out", action:{
                Task {
                    await state.signOut()
                }
            })
        }
    }
    
}
#Preview {
    ContentView()
}
