//
//  SwiftUIView.swift
//  
//
//  Created by olmexQuiz.mtz on 28/03/23.
//

import SwiftUI

struct OlmQ: View {
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
    @State var press1300 = UserDefaults.standard.bool(forKey: "press1300")
    @State var press1400 = UserDefaults.standard.bool(forKey: "press1400")
    @State var press1400B = UserDefaults.standard.bool(forKey: "press1400B")
    @State var press1500 = UserDefaults.standard.bool(forKey: "press1500")
//  Second question olmec civilization
    @State var AAE = UserDefaults.standard.bool(forKey: "AAE")
    @State var AMS = UserDefaults.standard.bool(forKey: "AMS")
    @State var AAA = UserDefaults.standard.bool(forKey: "AAA")
    @State var LLE = UserDefaults.standard.bool(forKey: "LLE")
//  third question olmec civilization
    @State var Pyramid = UserDefaults.standard.bool(forKey: "Pyramid")
    @State var Temples = UserDefaults.standard.bool(forKey: "Temples")
    @State var StoneH = UserDefaults.standard.bool(forKey: "StoneH")
    @State var Obsidian = UserDefaults.standard.bool(forKey: "Obsidian")
//  fourth question olmec civilization
    @State var press1000 = UserDefaults.standard.bool(forKey: "press1000")
    @State var press400 = UserDefaults.standard.bool(forKey: "press400")
    @State var press600 = UserDefaults.standard.bool(forKey: "press600")
    @State var press400B = UserDefaults.standard.bool(forKey: "press400B")
    
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
                Text("To when do the Olmecs date back?")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        press1300 = true
                        score -= 10
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(press1300, forKey: "press1300")
                    }) {
                        VStack {
                            Text("1300 BCE")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(press1300 ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(press1300 || press1400B)
                    
                    Button(action: {
                        press1400 = true
                        score -= 10
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(press1400, forKey: "press1400")
                    }) {
                        VStack {
                            Text("1400")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(press1400 ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(press1400 || press1400B)
                    
                }
                HStack {
                    Button(action: {
                        press1400B = true
                        score += 15
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(press1400B, forKey: "press1400B")
                    }) {
                        VStack {
                            Text("1400 BCE")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(press1400B ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(press1400B)
                    
                    Button(action: {
                        press1500 = true
                        score -= 10
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(press1500, forKey: "press1500")
                    }) {
                        VStack {
                            Text("1500 BCE")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(press1500 ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(press1500 || press1400B)
                }
                
                //Second question
                Text("What where they known for?")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        AAE = true
                        score += 15
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(AAE, forKey: "AAE")
                    }) {
                        VStack {
                            Text("Art, architecture, engineering")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(AAE ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(AAE)
                    
                    Button(action: {
                        AMS = true
                        score -= 10
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(AMS, forKey: "AMS")
                    }) {
                        VStack {
                            Text("Astrology, mathematics, science")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(AMS ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(AMS || AAE)
                    
                }
                HStack {
                    Button(action: {
                        AAA = true
                        score -= 10
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(AAA, forKey: "AAA")
                    }) {
                        VStack {
                            Text("Astrology, art, architecture")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(AAA ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(AAA || AAE)
                    
                    Button(action: {
                        LLE = true
                        score -= 10
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(LLE, forKey: "LLE")
                    }) {
                        VStack {
                            Text("Language, legacy, engineering")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(LLE ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(LLE || AAE)
                }
                
                //Third question
                Text("What where their most famous constructions?")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        Pyramid = true
                        score -= 10
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Pyramid, forKey: "Pyramid")
                    }) {
                        VStack {
                            Text("Pyramids")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Pyramid ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Pyramid || StoneH)
                    
                    Button(action: {
                        Temples = true
                        score -= 10
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Temples, forKey: "Temples")
                    }) {
                        VStack {
                            Text("Temples")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Temples ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Temples || StoneH)
                    
                }
                HStack {
                    Button(action: {
                        StoneH = true
                        score += 15
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(StoneH, forKey: "StoneH")
                    }) {
                        VStack {
                            Text("Giant stone heads")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(StoneH ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(StoneH)
                    
                    Button(action: {
                        Obsidian = true
                        score -= 10
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Obsidian, forKey: "Obsidian")
                    }) {
                        VStack {
                            Text("Obsidian tools")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Obsidian ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Obsidian || StoneH)
                }
                VStack {
                    //Question 4
                    Text("When did they disappear?")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    HStack {
                        Button(action: {
                            press1000 = true
                            score -= 10
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(press1000, forKey: "press1000")
                        }) {
                            VStack {
                                Text("1000 BCE")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(press1000 ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(press1000 || press400B)
                        
                        Button(action: {
                            press400 = true
                            score -= 10
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(press400, forKey: "press400")
                        }) {
                            VStack {
                                Text("400")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(press400 ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(press400 || press400B)
                        
                    }
                    HStack {
                        Button(action: {
                            press600 = true
                            score -= 10
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(press600, forKey: "press600")
                        }) {
                            VStack {
                                Text("600 BCE")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(press600 ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(press600 || press400B)
                        
                        Button(action: {
                            press400B = true
                            score += 15
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(press400B, forKey: "press400B")
                        }) {
                            VStack {
                                Text("400 BCE")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(press400B ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(press400B)
                    }
                }
                
            }
            Button(action: {
                print(score-prevScore)
                if prevScore != score {
                    isShowingOlROverlay = true
                } else {
                    vm.onQuiz = false
                    AcQuiz.OlmQuiz = false
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
                .overlay(!press1400B || !AAE || !StoneH || !press400B ? Color.gray.opacity(0.5): Color.clear).cornerRadius(20)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(10)
                .frame(height: 100)
            }
            .disabled(!press1400B || !AAE || !StoneH || !press400B)
            .sheet(isPresented: $isShowingOlROverlay, onDismiss: {
                prevScore = 0
                vm.onQuiz = false
                AcQuiz.MayQuiz = false
                isShowingOlROverlay = false
            }) {
                VStack {
                    Spacer()
                    Text("Your earnings are: \(score-prevScore)")
                    Spacer()
                    Button("Close") {
                        prevScore = 0
                        vm.onQuiz = false
                        AcQuiz.OlmQuiz = false
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
