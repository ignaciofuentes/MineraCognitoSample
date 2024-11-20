//
//  MineraCognitoSampleApp.swift
//  MineraCognitoSample
//
//  Created by Fuentes, Ignacio on 11/15/24.
//
import Amplify
import Authenticator
import AWSCognitoAuthPlugin
import SwiftUI

@main
struct MineraCognitoSampleApp: App {
    
    init() {
            do {
                try Amplify.add(plugin: AWSCognitoAuthPlugin())
                try Amplify.configure(with: .amplifyOutputs)
            } catch {
                print("Unable to configure Amplify \(error)")
            }
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView2()
        }
    }
}
