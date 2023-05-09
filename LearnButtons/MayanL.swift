//
//  SwiftUIView.swift
//  
//
//  Created by rene.mtz on 19/03/23.
//

import SwiftUI

struct MayanL: View {
    @Environment(\.colorScheme) private var colorSchemeB
    @State var aztecapressed = UserDefaults.standard.bool(forKey: "aztecapressed")
    @State var isShowingMaOverlay = false
    var body: some View {
        Button(action: {
            print("pressed")
            isShowingMaOverlay = true
        }) {
            VStack {
                Image("mayan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .padding(.bottom, 10)
                Text("Maya Civilization")
                    .font(.headline)
                    .foregroundColor(.primary)
                HStack {
                    Spacer()
                }
            }
            .padding()
            .background(buttonColor)
            .cornerRadius(10)
            .overlay(aztecapressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(10)
            .shadow(radius: 5)
            
        }
        .onAppear {
            aztecapressed = UserDefaults.standard.bool(forKey: "aztecapressed")
        }
        .padding(10)
        .disabled(aztecapressed == false)
        .sheet(isPresented: $isShowingMaOverlay) {
                VStack {
                    ScrollView {
                        Text("The Maya Civilization is one of the most well-known and influential ancient societies in Mesoamerica, spanning from around 2000 BCE to the Spanish conquest in 1521. They were renowned for their advancements in astronomy, mathematics, and writing systems, and their cities were characterized by impressive architectural feats such as towering pyramids and elaborate palace complexes. The Maya are also known for their elaborate religious practices, which involved human sacrifice and offerings to the gods. The Maya civilization is notable for the collapse of many of its major centers around the 9th century, leading to the abandonment of large cities such as Tikal and Palenque. Despite this decline, the Maya people continued to thrive in smaller communities throughout the region, and their cultural legacy continues to be celebrated today through their language, art, and traditions.")
                            .padding(10)
                        Link("Learn more", destination: URL(string: "https://en.wikipedia.org/wiki/Maya_civilization")!)
                            .padding()
                    }
                    Spacer()
                    Button("Close") {
                        isShowingMaOverlay = false
                    }
                    .padding()
                }
            }
        //mayan button end
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
