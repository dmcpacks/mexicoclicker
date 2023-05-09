//
//  SwiftUIView.swift
//  
//
//  Created by rene.mtz on 14/04/23.
//

import SwiftUI

struct IndQ: View {
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
    @State var Portugal = UserDefaults.standard.bool(forKey: "Portugal")
    @State var Netherlands = UserDefaults.standard.bool(forKey: "Netherlands")
    @State var Spain = UserDefaults.standard.bool(forKey: "Spain")
    @State var England = UserDefaults.standard.bool(forKey: "England")
    //  Second question olmec civilization
    @State var f1year = UserDefaults.standard.bool(forKey: "1year")
    @State var f7years = UserDefaults.standard.bool(forKey: "7years")
    @State var f11years = UserDefaults.standard.bool(forKey: "11years")
    @State var f13years = UserDefaults.standard.bool(forKey: "13years")
    //  third question olmec civilization
    @State var Diseases = UserDefaults.standard.bool(forKey: "Diseases")
    @State var Firearmsandhorses = UserDefaults.standard.bool(forKey: "Firearmsandhorses")
    @State var KnowledgeoftheMexicanterrain = UserDefaults.standard.bool(forKey: "KnowledgeoftheMexicanterrain")
    @State var Strategicalliances = UserDefaults.standard.bool(forKey: "Strategicalliances")
    //  fourth question olmec civilization
    @State var JoséMaríaMorelos = UserDefaults.standard.bool(forKey: "JoséMaríaMorelos")
    @State var MiguelHidalgo = UserDefaults.standard.bool(forKey: "MiguelHidalgo")
    @State var AgustíndeIturbide = UserDefaults.standard.bool(forKey: "AgustíndeIturbide")
    @State var VicenteGuerrero = UserDefaults.standard.bool(forKey: "VicenteGuerrero")
    
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
                Text("Mexico gained its independence from:")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        Portugal = true
                        score -= 2000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Portugal, forKey: "Portugal")
                    }) {
                        VStack {
                            Text("Portugal")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Portugal ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Portugal || Spain)
                    
                    Button(action: {
                        Netherlands = true
                        score -= 2000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Netherlands, forKey: "Netherlands")
                    }) {
                        VStack {
                            Text("Netherlands")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Netherlands ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Netherlands || Spain)
                    
                }
                HStack {
                    Button(action: {
                        Spain = true
                        score += 4500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Spain, forKey: "Spain")
                    }) {
                        VStack {
                            Text("Spain")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Spain ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Spain)
                    
                    Button(action: {
                        England = true
                        score -= 2000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(England, forKey: "England")
                    }) {
                        VStack {
                            Text("England")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(England ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(England || Spain)
                }
                
                //Second question
                Text("The Mexican War of Independence lasted:")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        f1year = true
                        score -= 2000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(f1year, forKey: "1year")
                    }) {
                        VStack {
                            Text("1 year")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(f1year ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(f1year || f11years)
                    
                    Button(action: {
                        f7years = true
                        score -= 2000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(f7years, forKey: "7years")
                    }) {
                        VStack {
                            Text("7 years")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(f7years ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(f7years || f11years)
                    
                }
                HStack {
                    Button(action: {
                        f11years = true
                        score += 4500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(f11years, forKey: "11years")
                    }) {
                        VStack {
                            Text("11 years")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(f11years ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(f11years)
                    
                    Button(action: {
                        f13years = true
                        score -= 2000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(f13years, forKey: "13years")
                    }) {
                        VStack {
                            Text("13 years")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(f13years ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(f13years || f11years)
                }
                
                //Third question
                Text("The revolutionaries used to their advantage:")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        Diseases = true
                        score -= 2000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Diseases, forKey: "Diseases")
                    }) {
                        VStack {
                            Text("Diseases")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Diseases ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        
                    }
                    .disabled(Diseases || KnowledgeoftheMexicanterrain)
                    
                    Button(action: {
                        Firearmsandhorses = true
                        score -= 2000
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
                    .disabled(Firearmsandhorses || KnowledgeoftheMexicanterrain)
                    
                }
                HStack {
                    Button(action: {
                        KnowledgeoftheMexicanterrain = true
                        score += 4500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(KnowledgeoftheMexicanterrain, forKey: "KnowledgeoftheMexicanterrain")
                    }) {
                        VStack {
                            Text("Knowledge of the Mexican terrain")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(KnowledgeoftheMexicanterrain ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(KnowledgeoftheMexicanterrain)
                    
                    Button(action: {
                        Strategicalliances = true
                        score -= 2000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Strategicalliances, forKey: "Strategicalliances")
                    }) {
                        VStack {
                            Text("Strategic alliances")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Strategicalliances ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Strategicalliances || KnowledgeoftheMexicanterrain)
                }
                VStack {
                    //Question 4
                    Text("Character credited with beginning the Mexican fight for independence:")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    HStack {
                        Button(action: {
                            JoséMaríaMorelos = true
                            score -= 2000
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(JoséMaríaMorelos, forKey: "JoséMaríaMorelos")
                        }) {
                            VStack {
                                Text("José María Morelos")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(JoséMaríaMorelos ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(JoséMaríaMorelos || MiguelHidalgo)
                        
                        Button(action: {
                            MiguelHidalgo = true
                            score += 4500
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(MiguelHidalgo, forKey: "MiguelHidalgo")
                        }) {
                            VStack {
                                Text("Miguel Hidalgo")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(MiguelHidalgo ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(MiguelHidalgo)
                        
                    }
                    HStack {
                        Button(action: {
                            AgustíndeIturbide = true
                            score -= 2000
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(AgustíndeIturbide, forKey: "AgustíndeIturbide")
                        }) {
                            VStack {
                                Text("Agustín de Iturbide")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(AgustíndeIturbide ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(AgustíndeIturbide || MiguelHidalgo)
                        
                        Button(action: {
                            VicenteGuerrero = true
                            score -= 2000
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(VicenteGuerrero, forKey: "VicenteGuerrero")
                        }) {
                            VStack {
                                Text("Vicente Guerrero ")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(VicenteGuerrero ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(VicenteGuerrero || MiguelHidalgo)
                    }
                }
                
            }
            Button(action: {
                print(score-prevScore)
                if prevScore != score {
                    isShowingOlROverlay = true
                } else {
                    vm.onQuiz = false
                    AcQuiz.IndQuiz = false
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
                .overlay(!Spain || !f11years || !KnowledgeoftheMexicanterrain || !MiguelHidalgo ? Color.gray.opacity(0.5): Color.clear).cornerRadius(20)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(10)
                .frame(height: 100)
            }
            .disabled(!Spain || !f11years || !KnowledgeoftheMexicanterrain || !MiguelHidalgo)
            .sheet(isPresented: $isShowingOlROverlay, onDismiss: {
                prevScore = 0
                vm.onQuiz = false
                AcQuiz.IndQuiz = false
                isShowingOlROverlay = false
            }) {
                VStack {
                    Spacer()
                    Text("Your earnings are: \(score-prevScore)")
                    Spacer()
                    Button("Close") {
                        prevScore = 0
                        vm.onQuiz = false
                        AcQuiz.IndQuiz = false
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
