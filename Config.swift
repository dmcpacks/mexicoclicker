//
//  Config.swift
//  
//
//  Created by rene.mtz on 06/03/23.
//

import SwiftUI

struct Config: View {
    @Environment(\.colorScheme) private var colorScheme
    @State var muted = UserDefaults.standard.bool(forKey: "muted")
    @State var background = UserDefaults.standard.bool(forKey: "background")
    @ObservedObject var vm: playing
    @ObservedObject var quiz: OnQuiz
    @State var confirm = false
    @State private var toast: Toast? = nil
    
    func setMuted() {
        UserDefaults.standard.set(muted, forKey: "muted")
    }
    func setBackground() {
        UserDefaults.standard.set(background, forKey: "background")
    }
    func setMutedMusic() {
        UserDefaults.standard.set(vm.music, forKey: "music")
        if vm.music {
            vm.audioPlayer?.stop()
        } else {
            vm.audioPlayer?.numberOfLoops = -1
            vm.audioPlayer?.volume = 0.3
            vm.audioPlayer?.play()
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Form {
                        Section(header: Text("Sounds")) {
                            Toggle("Mute work button", isOn: $muted).onChange(of: muted) { _ in
                                setMuted()
                            }
                            Toggle("Mute music", isOn: $vm.music).onChange(of: vm.music) { _ in
                                setMutedMusic()
                            }
                        }
                        Section(header: Text("Background")) {
                            Toggle("Disable animated background", isOn: $background).onChange(of: background) { _ in
                                setBackground()
                            }
                        }
                        Section(header: Text("Data")) {
                            HStack {
                                Spacer()
                                Button(action: {
                                    confirm = true
                                }) {
                                    HStack {
                                        Spacer()
                                        VStack {
                                            Spacer()
                                            Text("Reset data")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .foregroundColor(.blue)
                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                }
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .alert("Are you sure?\nall your app data will be lost", isPresented: $confirm) {
                                    Button("Yes", role: .destructive) {
                                        let defaults = UserDefaults.standard
                                        for (key, value) in defaults.dictionaryRepresentation() {
                                            if value is Bool {
                                                defaults.removeObject(forKey: key)
                                            } else if value is Int {
                                                defaults.removeObject(forKey: key)
                                            } else if value is Double {
                                                defaults.removeObject(forKey: key)
                                            }
                                        }
                                        toast = Toast(style: .warning, message: "An app restart may be required for full deletion")
                                    }
                                    Button("No", role: .cancel) {}
                                }
                                Spacer()
                            }
                        }
                    }
                    .padding(.vertical, 60)
                }
            }
        }
        .toastView(toast: $toast)
    }
    private var titleColor: Color {
        switch colorScheme {
        case .light:
            return Color(white: 0.9)
        case .dark:
            return Color(white: 0.2)
        @unknown default:
            return Color(white: 1)
        }
    }
}
