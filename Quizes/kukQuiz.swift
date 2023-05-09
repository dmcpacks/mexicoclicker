//
//  SwiftUIView.swift
//  
//
//  Created by rene.mtz on 14/04/23.
//

import SwiftUI

struct KukQ: View {
    @ObservedObject var vm: OnQuiz
    @ObservedObject var AcQuiz: ActiveQuiz
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.colorScheme) private var colorSchemeB
    @State var score = UserDefaults.standard.integer(forKey: "score")
    @State var prevScore = 0
//  Olmec
    @State var isShowingOlROverlay = false
    @State var OlQuizComplete = UserDefaults.standard.bool(forKey: "OlQuizComplete")
//  First question olmec civilization
    @State var TheYucatanPeninsula = UserDefaults.standard.bool(forKey: "TheYucatanPeninsula")
    @State var TheMayanPeninsula = UserDefaults.standard.bool(forKey: "TheMayanPeninsula")
    @State var Guatemala = UserDefaults.standard.bool(forKey: "Guatemala")
    @State var Cancun = UserDefaults.standard.bool(forKey: "Cancun")
//  Second question olmec civilization
    @State var Maya = UserDefaults.standard.bool(forKey: "Maya")
    @State var Olmecs = UserDefaults.standard.bool(forKey: "Olmecs")
    @State var Aztecs = UserDefaults.standard.bool(forKey: "Aztecs")
    @State var Aliens = UserDefaults.standard.bool(forKey: "Aliens")
//  third question olmec civilization
    @State var f12 = UserDefaults.standard.bool(forKey: "12")
    @State var f30 = UserDefaults.standard.bool(forKey: "30")
    @State var f365 = UserDefaults.standard.bool(forKey: "365")
    @State var f91 = UserDefaults.standard.bool(forKey: "91")
//  fourth question olmec civilization
    @State var Quetzalcoatl = UserDefaults.standard.bool(forKey: "Quetzalcoatl")
    @State var ThefeatheredserpentgodoftheMaya = UserDefaults.standard.bool(forKey: "ThefeatheredserpentgodoftheMaya")
    @State var Thegoddessoffertility = UserDefaults.standard.bool(forKey: "Thegoddessoffertility")
    @State var ChichenItzá = UserDefaults.standard.bool(forKey: "ChichenItzá")
    
    var body: some View {
        titleColor
            .ignoresSafeArea()
            .onAppear {
                score = UserDefaults.standard.integer(forKey: "score")
                prevScore = score
            }
        VStack {
            Text("You must complete the quiz in order to exit")
            Spacer()
            ScrollView {
                Text("Kukulcan is located in:")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        TheYucatanPeninsula = true
                        score += 8000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(TheYucatanPeninsula, forKey: "TheYucatanPeninsula")
                    }) {
                        VStack {
                            Text("The Yucatan Peninsula")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(TheYucatanPeninsula ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(TheYucatanPeninsula)
                    
                    Button(action: {
                        TheMayanPeninsula = true
                        score -= 6500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(TheMayanPeninsula, forKey: "TheMayanPeninsula")
                    }) {
                        VStack {
                            Text("The Mayan Peninsula")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(TheMayanPeninsula ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(TheMayanPeninsula || TheYucatanPeninsula)
                    
                }
                HStack {
                    Button(action: {
                        Guatemala = true
                        score -= 6500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Guatemala, forKey: "Guatemala")
                    }) {
                        VStack {
                            Text("Guatemala")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Guatemala ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Guatemala || TheYucatanPeninsula)
                    
                    Button(action: {
                        Cancun = true
                        score -= 6500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Cancun, forKey: "Cancun")
                    }) {
                        VStack {
                            Text("Cancun")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Cancun ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Cancun || TheYucatanPeninsula)
                }
                
                //Second question
                Text("Kukulcan was built by the:")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        Maya = true
                        score += 8000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Maya, forKey: "Maya")
                    }) {
                        VStack {
                            Text("Maya")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Maya ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Maya)
                    
                    Button(action: {
                        Olmecs = true
                        score -= 6500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Olmecs, forKey: "Olmecs")
                    }) {
                        VStack {
                            Text("Olmecs")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Olmecs ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Olmecs || Maya)
                    
                }
                HStack {
                    Button(action: {
                        Aztecs = true
                        score -= 6500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Aztecs, forKey: "Aztecs")
                    }) {
                        VStack {
                            Text("Aztecs")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Aztecs ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Aztecs || Maya)
                    
                    Button(action: {
                        Aliens = true
                        score -= 6500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Aliens, forKey: "Aliens")
                    }) {
                        VStack {
                            Text("Aliens")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Aliens ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Aliens || Maya)
                }
                
                //Third question
                Text("How many steps does Kukulcan have in total?")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        f12 = true
                        score -= 6500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(f12, forKey: "12")
                    }) {
                        VStack {
                            Text("12")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(f12 ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        
                    }
                    .disabled(f12 || f365)
                    
                    Button(action: {
                        f30 = true
                        score -= 6500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(f30, forKey: "30")
                    }) {
                        VStack {
                            Text("30")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(f30 ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(f30 || f365)
                    
                }
                HStack {
                    Button(action: {
                        f365 = true
                        score += 8000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(f365, forKey: "365")
                    }) {
                        VStack {
                            Text("365")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(f365 ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(f365)
                    
                    Button(action: {
                        f91 = true
                        score -= 6500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(f91, forKey: "91")
                    }) {
                        VStack {
                            Text("91")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(f91 ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(f91 || f365)
                }
                VStack {
                    //Question 4
                    Text("The temple is dedicated to:")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    HStack {
                        Button(action: {
                            Quetzalcoatl = true
                            score -= 6500
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(Quetzalcoatl, forKey: "Quetzalcoatl")
                        }) {
                            VStack {
                                Text("Quetzalcoatl")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(Quetzalcoatl ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(Quetzalcoatl || ThefeatheredserpentgodoftheMaya)
                        
                        Button(action: {
                            ThefeatheredserpentgodoftheMaya = true
                            score += 8000
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(ThefeatheredserpentgodoftheMaya, forKey: "ThefeatheredserpentgodoftheMaya")
                        }) {
                            VStack {
                                Text("The feathered serpent god of the Maya")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(ThefeatheredserpentgodoftheMaya ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(ThefeatheredserpentgodoftheMaya)
                        
                    }
                    HStack {
                        Button(action: {
                            Thegoddessoffertility = true
                            score -= 6500
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(Thegoddessoffertility, forKey: "Thegoddessoffertility")
                        }) {
                            VStack {
                                Text("The goddess of fertility")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(Thegoddessoffertility ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(Thegoddessoffertility || ThefeatheredserpentgodoftheMaya)
                        
                        Button(action: {
                            ChichenItzá = true
                            score -= 6500
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(ChichenItzá, forKey: "ChichenItzá")
                        }) {
                            VStack {
                                Text("Chichen Itzá")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(ChichenItzá ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(ChichenItzá || ThefeatheredserpentgodoftheMaya)
                    }
                }
                
            }
            Button(action: {
                print(score-prevScore)
                if prevScore != score {
                    isShowingOlROverlay = true
                } else {
                    vm.onQuiz = false
                    AcQuiz.kukQuiz = false
                    isShowingOlROverlay = false
                }
            }) {
                ZStack {
                    Color.green
                    VStack {
                        Text("End Quiz")
                            .font(.title)
                            .padding(5)
                            .foregroundColor(.primary)
                    }
                }
                .overlay(!TheYucatanPeninsula || !Maya || !f365 || !ThefeatheredserpentgodoftheMaya ? Color.gray.opacity(0.5): Color.clear).cornerRadius(20)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(10)
                .frame(height: 100)
            }
            .disabled(!TheYucatanPeninsula || !Maya || !f365 || !ThefeatheredserpentgodoftheMaya)
            .sheet(isPresented: $isShowingOlROverlay, onDismiss: {
                prevScore = 0
                vm.onQuiz = false
                AcQuiz.kukQuiz = false
                isShowingOlROverlay = false
            }) {
                VStack {
                    Spacer()
                    Text("Your earnings are: \(score-prevScore)")
                    Spacer()
                    Button("Close") {
                        prevScore = 0
                        vm.onQuiz = false
                        AcQuiz.kukQuiz = false
                        isShowingOlROverlay = false
                    }
                    .padding()
                }
            }
        }
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
