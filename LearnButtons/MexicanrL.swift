//
//  SwiftUIView.swift
//  
//
//  Created by rene.mtz on 19/03/23.
//

import SwiftUI

struct MexicanrL: View {
    @Environment(\.colorScheme) private var colorSchemeB
    @State var revolutionpressed = UserDefaults.standard.bool(forKey: "revolutionpressed")
    @State var isShowingOlOverlay = false
    var body: some View {
        Button(action: {
            print("pressed")
            isShowingOlOverlay = true
        }) {
            VStack {
                Image("revolution")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .padding(.bottom, 10)
                Text("Mexican Revolution")
                    .font(.headline)
                    .foregroundColor(.primary)
                HStack {
                    Spacer()
                }
            }
            .padding()
            .background(buttonColor)
            .cornerRadius(10)
            .overlay(revolutionpressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(10)
            .shadow(radius: 5)
            
        }
        .onAppear {
            revolutionpressed = UserDefaults.standard.bool(forKey: "revolutionpressed")
        }
        .padding(10)
        .disabled(revolutionpressed == false)
        .sheet(isPresented: $isShowingOlOverlay) {
                VStack {
                    ScrollView {
                        Text("The Mexican Revolution was a major armed struggle that took place from 1910 to 1920. The revolution began as a result of political and social unrest in Mexico, caused by the long-standing rule of dictator Porfirio Diaz and the growing disparities between rich and poor Mexicans. The revolution was fought by a number of different groups, including peasants, indigenous peoples, workers, and intellectuals. The revolutionaries sought to overthrow Diaz and bring about a more democratic and just society in Mexico. The revolution was marked by a number of significant battles and events, including the sieges of cities like Ciudad Juarez and Mexico City, and the assassination of revolutionary leaders like Francisco Madero, Emiliano Zapata, and Pancho Villa. The revolution ultimately succeeded in overthrowing Diaz and establishing a new government in Mexico, but it also resulted in social upheaval and economic instability.")
                            .padding(10)
                        Link("Learn more", destination: URL(string: "https://en.wikipedia.org/wiki/Mexican_Revolution")!)
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
