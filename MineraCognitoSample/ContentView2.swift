//
//  ContentView.swift
//  MineraCognitoSample
//
//  Created by Fuentes, Ignacio on 11/15/24.
//

import SwiftUI
import Amplify
import Authenticator

struct MenuItem {
    let icon: String
    let title: String
    let description: String
}

struct ContentView2: View {
    @State private var showAlert = false
    private let theme = AuthenticatorTheme()
    var body: some View {
        HStack{
            Authenticator(
                headerContent: {
                    VStack {
                        AsyncImage(url: URL(string: "https://cdnimg.bnamericas.com/yUBPgTDLcrrFJYMbJfcWzTwMTlvHGYFGjlyswbfWbqyIrmVZRGktsGAIFBKwHxew.png")).padding(80)
                    }
                    
                })
            { state in
                homeComponent(state:state);
            }.authenticatorTheme(theme)
        }.background(Color(red:34/255,green:46/255, blue:60/255))
    }
    
    
    
    init(){
        //theme.colors.background.primary = .pink;
        theme.colors.background.interactive = Color(red:28/255, green:155/255, blue:177/255);
        //theme.colors.foreground.interactive = .red;
        //theme.colors.border.interactive = .pink;
        theme.colors.foreground.primary = .white;
        theme.colors.foreground.secondary = .white;
        theme.colors.foreground.tertiary = .white;
        theme.colors.foreground.info = .white;
        theme.colors.foreground.inverse = .white;
        //theme.colors.foreground.warning = .pink;
        //theme.colors.foreground.success = .pink;
        theme.colors.foreground.error = .red;
        //theme.colors.foreground.disabled = .pink;
        theme.colors.foreground.interactive = .white;
        theme.components.field.backgroundColor = .white;
    }
    
    func homeComponent(state: SignedInState)-> some View{
        VStack {
            VStack{
                header(state:state)
                heroComponent()
            }.background(Color.white)
            menuItemsComponent()
        }
        .background(Color(red:241/255,green:243/255, blue:248/255))
    }
    /////COMPONENTS
    func header(state: SignedInState) -> some View {
        return HStack {
            Image(systemName: "line.3.horizontal")
                .font(.title)
            
            Spacer()
            
            Button(action:{
                showAlert = true
            }){
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .font(.title)
                    .foregroundColor(Color(red:28/255, green:155/255, blue:177/255))
                
                
            }.alert("Sign Out?",isPresented: $showAlert){
                Button("OK", role: .cancel) {
                    Task {
                        await state.signOut()
                    }
                }
                Button("Cancel", role: .destructive) {
                    print("Delete action triggered")
                }
            }
        }.padding(.horizontal)
    }
    func heroComponent() -> some View {
        return RoundedRectangle(cornerRadius: 20)
            .fill(Color(red:28/255, green:155/255, blue:177/255))
            .overlay(
                VStack {
                    AsyncImage(url: URL(string: "https://cdnimg.bnamericas.com/yUBPgTDLcrrFJYMbJfcWzTwMTlvHGYFGjlyswbfWbqyIrmVZRGktsGAIFBKwHxew.png"))
                    //                    Text("Perú")
                    //                        .font(.title2)
                    //                        .foregroundColor(.white)
                    //                    Text("Minería")
                    //                        .font(.subheadline)
                    //                        .foregroundColor(.white.opacity(0.8))
                }
                
            ).padding()
    }
    func menuItemsComponent() -> some View {
        let items: [MenuItem] = [
            MenuItem(icon: "sunset.circle", title: "Sostenibilidad", description: ""),
            MenuItem(icon: "square.grid.2x2", title: "Colección Antamina", description: ""),
            MenuItem(icon: "person.bust", title: "Obras por impuestos", description: ""),
            MenuItem(icon: "earpods", title: "Historias Antamina", description: "Podcast" ),
            MenuItem(icon: "shareplay", title: "Misión", description: "Visión y Valores"),
            MenuItem(icon: "fan", title: "ISO 14001", description: ""),
            MenuItem(icon: "car", title: "Proyectos para el desarrollo", description: ""),
            MenuItem(icon: "circle.grid.cross", title: "ISO 45001", description: ""),
            MenuItem(icon: "plus.viewfinder", title: "Nuevo Marco Estratégico", description: ""),
            
            
        ]
        return VStack(spacing:60){
            ForEach(0..<3) { row in
                HStack(spacing:20){
                    ForEach(0..<3) { column in
                        let index = row * 3 + column
                        let item = items[index];
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(width: 100, height: 100)
                            .overlay(
                                VStack {
                                    Image(systemName: item.icon)
                                        .foregroundColor(Color(red:28/255, green:155/255, blue:177/255))
                                        .padding(.vertical, 10)
                                    
                                    Text(item.title)
                                        .font(.caption)
                                        .foregroundColor(Color.black)
                                        .multilineTextAlignment(.center)
                                    //.lineLimit(nil)
                                    Text(item.description)
                                        .font(.caption)
                                }
                            )
                    }
                }
            }
            
            
            
            
            
        }.padding()
        
    }
}
#Preview {
    ContentView2()
}
