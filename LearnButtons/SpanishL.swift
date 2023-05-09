//
//  SwiftUIView.swift
//  
//
//  Created by rene.mtz on 19/03/23.
//

import SwiftUI

struct SpanishL: View {
    @Environment(\.colorScheme) private var colorSchemeB
    @State var spanishpressed = UserDefaults.standard.bool(forKey: "spanishpressed")
    @State var isShowingOlOverlay = false
    var body: some View {
        Button(action: {
            print("pressed")
            isShowingOlOverlay = true
        }) {
            VStack {
                Image("spanish")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .padding(.bottom, 10)
                    .clipShape(Ellipse(), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                Text("Spanish Conquest")
                    .font(.headline)
                    .foregroundColor(.primary)
                HStack {
                    Spacer()
                }
            }
            .padding()
            .background(buttonColor)
            .cornerRadius(10)
            .overlay(spanishpressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(10)
            .shadow(radius: 5)
            
        }
        .onAppear {
            spanishpressed = UserDefaults.standard.bool(forKey: "spanishpressed")
        }
        .padding(10)
        .disabled(spanishpressed == false)
        .sheet(isPresented: $isShowingOlOverlay) {
                VStack {
                    ScrollView {
                        Text("In 1519, Hernán Cortés led a small group of conquistadors to the coast of Mexico, where they made contact with the Aztec Empire. The Aztecs, who had never seen horses or firearms before, initially mistook the Spanish for gods and welcomed them into their capital city of Tenochtitlán. However, the Spanish quickly turned on the Aztecs and, with the help of indigenous allies, conquered the empire in just two years. The Spanish used superior weapons and tactics, as well as disease, to defeat the Aztecs. The Spanish then imposed their culture and religion on the surviving Aztecs, who were forced to convert to Catholicism and give up their traditional ways of life.")
                            .padding(10)
                        Link("Learn more", destination: URL(string: "https://en.wikipedia.org/wiki/Spanish_conquest_of_the_Aztec_Empire")!)
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
