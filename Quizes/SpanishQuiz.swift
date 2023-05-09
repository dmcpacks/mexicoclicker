//
//  SwiftUIView.swift
//  
//
//  Created by rene.mtz on 14/04/23.
//

import SwiftUI

struct SpanQ: View {
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
    @State var HernánCortés = UserDefaults.standard.bool(forKey: "HernánCortés")
    @State var ChristopherColumbus = UserDefaults.standard.bool(forKey: "ChristopherColumbus")
    @State var FerdinandMagellan = UserDefaults.standard.bool(forKey: "FerdinandMagellan")
    @State var MarcoPolo = UserDefaults.standard.bool(forKey: "MarcoPolo")
    //  Second question olmec civilization
    @State var f4thCentury = UserDefaults.standard.bool(forKey: "4thCentury")
    @State var f14thCentury = UserDefaults.standard.bool(forKey: "14thCentury")
    @State var f16thCentury = UserDefaults.standard.bool(forKey: "16thCentury")
    @State var f18thCentury = UserDefaults.standard.bool(forKey: "18thCentury")
    //  third question olmec civilization
    @State var Mexico = UserDefaults.standard.bool(forKey: "Mexico")
    @State var Tenochtitlán = UserDefaults.standard.bool(forKey: "Tenochtitlán")
    @State var Ixtapan = UserDefaults.standard.bool(forKey: "Ixtapan")
    @State var Tochtlan = UserDefaults.standard.bool(forKey: "Tochtlan")
    //  fourth question olmec civilization
    @State var Firearmsandhorses = UserDefaults.standard.bool(forKey: "Firearmsandhorses")
    @State var Disease = UserDefaults.standard.bool(forKey: "Disease")
    @State var Useofcatapults = UserDefaults.standard.bool(forKey: "Useofcatapults")
    @State var Allianceswithotherindigenouspeople = UserDefaults.standard.bool(forKey: "Allianceswithotherindigenouspeople")
    
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
                Text("Who first contacted the Aztec Empire?")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        HernánCortés = true
                        score += 1500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(HernánCortés, forKey: "HernánCortés")
                    }) {
                        VStack {
                            Text("Hernán Cortés")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(HernánCortés ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(HernánCortés)
                    
                    Button(action: {
                        ChristopherColumbus = true
                        score -= 1000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(ChristopherColumbus, forKey: "ChristopherColumbus")
                    }) {
                        VStack {
                            Text("Christopher Columbus")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(ChristopherColumbus ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(ChristopherColumbus || HernánCortés)
                    
                }
                HStack {
                    Button(action: {
                        FerdinandMagellan = true
                        score -= 1000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(FerdinandMagellan, forKey: "FerdinandMagellan")
                    }) {
                        VStack {
                            Text("Ferdinand Magellan")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(FerdinandMagellan ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(FerdinandMagellan || HernánCortés)
                    
                    Button(action: {
                        MarcoPolo = true
                        score -= 1000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(MarcoPolo, forKey: "MarcoPolo")
                    }) {
                        VStack {
                            Text("Marco Polo")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(MarcoPolo ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(MarcoPolo || HernánCortés)
                }
                
                //Second question
                Text("When did Europeans first make contact with the Aztec Empire?")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        f4thCentury = true
                        score -= 1000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(f4thCentury, forKey: "4thCentury")
                    }) {
                        VStack {
                            Text("4th Century")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(f4thCentury ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(f4thCentury || f16thCentury)
                    
                    Button(action: {
                        f14thCentury = true
                        score -= 1000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(f14thCentury, forKey: "14thCentury")
                    }) {
                        VStack {
                            Text("14th Century")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(f14thCentury ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(f14thCentury || f16thCentury)
                    
                }
                HStack {
                    Button(action: {
                        f16thCentury = true
                        score += 1500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(f16thCentury, forKey: "16thCentury")
                    }) {
                        VStack {
                            Text("16th Century")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(f16thCentury ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(f16thCentury)
                    
                    Button(action: {
                        f18thCentury = true
                        score -= 1000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(f18thCentury, forKey: "18thCentury")
                    }) {
                        VStack {
                            Text("18th Century")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(f18thCentury ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(f18thCentury || f16thCentury)
                }
                
                //Third question
                Text("Which was the capital city of the Aztecs?")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        Mexico = true
                        score -= 1000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Mexico, forKey: "Mexico")
                    }) {
                        VStack {
                            Text("Mexico")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Mexico ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        
                    }
                    .disabled(Mexico || Tenochtitlán)
                    
                    Button(action: {
                        Tenochtitlán = true
                        score += 1500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Tenochtitlán, forKey: "Tenochtitlán")
                    }) {
                        VStack {
                            Text("Tenochtitlán")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Tenochtitlán ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Tenochtitlán)
                    
                }
                HStack {
                    Button(action: {
                        Ixtapan = true
                        score -= 1000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Ixtapan, forKey: "Ixtapan")
                    }) {
                        VStack {
                            Text("Ixtapan")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Ixtapan ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Ixtapan || Tenochtitlán)
                    
                    Button(action: {
                        Tochtlan = true
                        score -= 1000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Tochtlan, forKey: "Tochtlan")
                    }) {
                        VStack {
                            Text("Tochtlan")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Tochtlan ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Tochtlan || Tenochtitlán)
                }
                VStack {
                    //Question 4
                    Text("What is not credited as relevant to the conquest of the Aztec Empire?")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    HStack {
                        Button(action: {
                            Firearmsandhorses = true
                            score -= 1000
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(Firearmsandhorses, forKey: "Firearmsandhorses")
                        }) {
                            VStack {
                                Text("Firearms and horses")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(Firearmsandhorses ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(Firearmsandhorses || Useofcatapults)
                        
                        Button(action: {
                            Disease = true
                            score -= 1000
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(Disease, forKey: "Disease")
                        }) {
                            VStack {
                                Text("Disease")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(Disease ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(Disease || Useofcatapults)
                        
                    }
                    HStack {
                        Button(action: {
                            Useofcatapults = true
                            score += 1500
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(Useofcatapults, forKey: "Useofcatapults")
                        }) {
                            VStack {
                                Text("Use of catapults")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(Useofcatapults ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(Useofcatapults)
                        
                        Button(action: {
                            Allianceswithotherindigenouspeople = true
                            score -= 1000
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(Allianceswithotherindigenouspeople, forKey: "Allianceswithotherindigenouspeople")
                        }) {
                            VStack {
                                Text("Alliances with other indigenous people")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(Allianceswithotherindigenouspeople ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(Allianceswithotherindigenouspeople || Useofcatapults)
                    }
                }
                
            }
            Button(action: {
                print(score-prevScore)
                if prevScore != score {
                    isShowingOlROverlay = true
                } else {
                    vm.onQuiz = false
                    AcQuiz.SpanQuiz = false
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
                .overlay(!HernánCortés || !f16thCentury || !Tenochtitlán || !Useofcatapults ? Color.gray.opacity(0.5): Color.clear).cornerRadius(20)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(10)
                .frame(height: 100)
            }
            .disabled(!HernánCortés || !f16thCentury || !Tenochtitlán || !Useofcatapults)
            .sheet(isPresented: $isShowingOlROverlay, onDismiss: {
                prevScore = 0
                vm.onQuiz = false
                AcQuiz.SpanQuiz = false
                isShowingOlROverlay = false
            }) {
                VStack {
                    Spacer()
                    Text("Your earnings are: \(score-prevScore)")
                    Spacer()
                    Button("Close") {
                        prevScore = 0
                        vm.onQuiz = false
                        AcQuiz.SpanQuiz = false
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
