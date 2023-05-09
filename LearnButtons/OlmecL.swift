//
//  SwiftUIView.swift
//  
//
//  Created by rene.mtz on 19/03/23.
//

import SwiftUI

struct OlmecL: View {
    @Environment(\.colorScheme) private var colorSchemeB
    @State var olmecapressed = UserDefaults.standard.bool(forKey: "olmecapressed")
    @State var isShowingOlOverlay = false
    var body: some View {
        Button(action: {
            print("pressed")
            isShowingOlOverlay = true
        }) {
            VStack {
                Image("olmeca")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .padding(.bottom, 10)
                Text("Olmec Civilization")
                    .font(.headline)
                    .foregroundColor(.primary)
                HStack {
                    Spacer()
                }
            }
            .padding()
            .background(buttonColor)
            .cornerRadius(10)
            .overlay(olmecapressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(10)
            .shadow(radius: 5)
            
        }
        .onAppear {
            olmecapressed = UserDefaults.standard.bool(forKey: "olmecapressed")
        }
        .padding(10)
        .disabled(olmecapressed == false)
        .sheet(isPresented: $isShowingOlOverlay) {
                VStack {
                    ScrollView {
                        Text("The Olmec Civilization was one of the earliest complex societies to emerge in Mesoamerica, dating back to around 1400 BCE. They were known for their impressive achievements in art, architecture, and engineering, as well as their extensive trade networks and religious practices. The Olmec are particularly notable for their monumental stone sculptures, including the famous giant stone heads, which are considered some of the greatest masterpieces of Mesoamerican art. Despite their cultural and technological achievements, the Olmec civilization declined and ultimately disappeared around 400 BCE, leaving behind a legacy that greatly influenced subsequent Mesoamerican societies such as the Maya and the Aztecs.")
                            .padding(10)
                        Link("Learn more", destination: URL(string: "https://en.wikipedia.org/wiki/Olmecs")!)
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
