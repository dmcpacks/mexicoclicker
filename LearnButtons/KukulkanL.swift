//
//  SwiftUIView.swift
//  
//
//  Created by rene.mtz on 19/03/23.
//

import SwiftUI

struct KukulkanL: View {
    @Environment(\.colorScheme) private var colorSchemeB
    @State var kukulkanpressed = UserDefaults.standard.bool(forKey: "kukulkanpressed")
    @State var isShowingOlOverlay = false
    var body: some View {
        Button(action: {
            print("pressed")
            isShowingOlOverlay = true
        }) {
            VStack {
                Image("kukulkan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .padding(.bottom, 10)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/, style: FillStyle())
                Text("Kukulkan")
                    .font(.headline)
                    .foregroundColor(.primary)
                HStack {
                    Spacer()
                }
            }
            .padding()
            .background(buttonColor)
            .cornerRadius(10)
            .overlay(kukulkanpressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(10)
            .shadow(radius: 5)
            
        }
        .onAppear {
            kukulkanpressed = UserDefaults.standard.bool(forKey: "kukulkanpressed")
        }
        .padding(10)
        .disabled(kukulkanpressed == false)
        .sheet(isPresented: $isShowingOlOverlay) {
                VStack {
                    ScrollView {
                        Text("The Pyramid of Kukulkan, one of the seven wonders of the modern world, is a famous ancient monument located in the archaeological site of Chichen Itza, in the Yucatan Peninsula, Mexico. It was built by the Maya people between the 9th and 12th centuries AD and it stands about 98 feet (30 meters) tall. The pyramid has four staircases with 91 steps each, plus one step at the top, making a total of 365 steps, which represents the number of days in the Maya solar calendar. The pyramid is also adorned with sculptures and carvings of serpents and other animals. The temple on the top of the pyramid is dedicated to Kukulkan, the feathered serpent god of the Maya. The pyramid was a center of religious and cultural activity for the Maya, who would come here to perform rituals and ceremonies, including human sacrifices. Today, the Pyramid of Kukulkan is a popular tourist destination and a symbol of ancient Mesoamerican civilization.")
                            .padding(10)
                        Link("Learn more", destination: URL(string: "https://en.wikipedia.org/wiki/El_Castillo,_Chichen_Itza")!)
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
