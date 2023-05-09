//
//  SwiftUIView.swift
//  
//
//  Created by rene.mtz on 19/03/23.
//

import SwiftUI

struct MexicanL: View {
    @Environment(\.colorScheme) private var colorSchemeB
    @State var independencepressed = UserDefaults.standard.bool(forKey: "independencepressed")
    @State var isShowingOlOverlay = false
    var body: some View {
        Button(action: {
            print("pressed")
            isShowingOlOverlay = true
        }) {
            VStack {
                Image("independence")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .padding(.bottom, 10)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/, style: FillStyle())
                Text("Mexican Independence")
                    .font(.headline)
                    .foregroundColor(.primary)
                HStack {
                    Spacer()
                }
            }
            .padding()
            .background(buttonColor)
            .cornerRadius(10)
            .overlay(independencepressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(10)
            .shadow(radius: 5)
            
        }
        .onAppear {
            independencepressed = UserDefaults.standard.bool(forKey: "independencepressed")
        }
        .padding(10)
        .disabled(independencepressed == false)
        .sheet(isPresented: $isShowingOlOverlay) {
                VStack {
                    ScrollView {
                        Text("The War of Independence in Mexico was a decade-long struggle for freedom from Spanish colonial rule, fought from 1810 to 1821. The war was sparked by a call to arms by a Catholic priest named Miguel Hidalgo, who rallied indigenous peoples, peasants, and mestizos to fight for independence from Spain. The war was fought by a number of different groups and leaders, including José María Morelos and Vicente Guerrero. The revolutionaries fought against the Spanish army. Throughout the war the revolutionaries used different tactics and the terrain of Mexico to their advantage. The war was marked by a number of significant battles and events, including the siege of Mexico City and the Mexican Declaration of Independence by Agustín de Iturbide. The war ultimately succeeded in achieving Mexico's independence from Spain, but left the country poor and very damaged.")
                            .padding(10)
                        Link("Learn more", destination: URL(string: "https://en.wikipedia.org/wiki/Mexican_War_of_Independence")!)
                            .padding()
                    }
                    Spacer()
                    Button("Close") {
                        isShowingOlOverlay = false
                    }
                    .padding()
                }
            }
        //olmeca button end
    }
    private var buttonColor: Color {
        switch colorSchemeB {
        case .light:
            return Color(white: 0.7)
        case .dark:
            return Color(white: 0.3)
        @unknown default:
            return Color(white: 1)
        }
    }
}
