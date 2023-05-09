//
//  SwiftUIView.swift
//  
//
//  Created by rene.mtz on 14/04/23.
//

import SwiftUI

struct RevQ: View {
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
    @State var f1815to1820 = UserDefaults.standard.bool(forKey: "1815to1820")
    @State var f1843to1853 = UserDefaults.standard.bool(forKey: "1843to1853")
    @State var f1910to1920 = UserDefaults.standard.bool(forKey: "1910to1920")
    @State var f1939to1945 = UserDefaults.standard.bool(forKey: "1939to1945")
//  Second question olmec civilization
    @State var IndependencefromSpain = UserDefaults.standard.bool(forKey: "IndependencefromSpain")
    @State var Tooverthrowadictator = UserDefaults.standard.bool(forKey: "Tooverthrowadictator")
    @State var AchangeintheConstitution = UserDefaults.standard.bool(forKey: "AchangeintheConstitution")
    @State var AnnexationtotheUnitedStates = UserDefaults.standard.bool(forKey: "AnnexationtotheUnitedStates")
//  third question olmec civilization
    @State var PorfirioDiaz = UserDefaults.standard.bool(forKey: "PorfirioDiaz")
    @State var FranciscoMadero = UserDefaults.standard.bool(forKey: "FranciscoMadero")
    @State var PanchoVilla = UserDefaults.standard.bool(forKey: "PanchoVilla")
    @State var MiguelHidalgo = UserDefaults.standard.bool(forKey: "MiguelHidalgo")
//  fourth question olmec civilization
    @State var Overthrowingadictator = UserDefaults.standard.bool(forKey: "Overthrowingadictator")
    @State var AnewConstitution = UserDefaults.standard.bool(forKey: "AnewConstitution")
    @State var Politicalandeconomicstability = UserDefaults.standard.bool(forKey: "Politicalandeconomicstability")
    @State var Socialupheaval = UserDefaults.standard.bool(forKey: "Socialupheaval")
    
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
                Text("The Mexican Revolution lasted from:")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        f1815to1820 = true
                        score -= 4000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(f1815to1820, forKey: "1815to1820")
                    }) {
                        VStack {
                            Text("1810 to 1820")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(f1815to1820 ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(f1815to1820 || f1910to1920)
                    
                    Button(action: {
                        f1843to1853 = true
                        score -= 4000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(f1843to1853, forKey: "1843to1853")
                    }) {
                        VStack {
                            Text("1843 to 1853")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(f1843to1853 ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(f1843to1853 || f1910to1920)
                    
                }
                HStack {
                    Button(action: {
                        f1910to1920 = true
                        score += 5500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(f1910to1920, forKey: "1910to1920")
                    }) {
                        VStack {
                            Text("1910 to 1920")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(f1910to1920 ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(f1910to1920)
                    
                    Button(action: {
                        f1939to1945 = true
                        score -= 4000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(f1939to1945, forKey: "1939to1945")
                    }) {
                        VStack {
                            Text("1939 to 1945")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(f1939to1945 ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(f1939to1945 || f1910to1920)
                }
                
                //Second question
                Text("The revolutionaries sought:")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        IndependencefromSpain = true
                        score -= 4000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(IndependencefromSpain, forKey: "IndependencefromSpain")
                    }) {
                        VStack {
                            Text("Independence from Spain")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(IndependencefromSpain ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(IndependencefromSpain || Tooverthrowadictator)
                    
                    Button(action: {
                        Tooverthrowadictator = true
                        score += 5500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(Tooverthrowadictator, forKey: "Tooverthrowadictator")
                    }) {
                        VStack {
                            Text("To overthrow a dictator")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(Tooverthrowadictator ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(Tooverthrowadictator)
                    
                }
                HStack {
                    Button(action: {
                        AchangeintheConstitution = true
                        score -= 4000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(AchangeintheConstitution, forKey: "AchangeintheConstitution")
                    }) {
                        VStack {
                            Text("A change in the Constitution")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(AchangeintheConstitution ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(AchangeintheConstitution || Tooverthrowadictator)
                    
                    Button(action: {
                        AnnexationtotheUnitedStates = true
                        score -= 4000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(AnnexationtotheUnitedStates, forKey: "AnnexationtotheUnitedStates")
                    }) {
                        VStack {
                            Text("Annexation to the United States")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(AnnexationtotheUnitedStates ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(AnnexationtotheUnitedStates || Tooverthrowadictator)
                }
                
                //Third question
                Text("The President of Mexico when the Revolution started was:")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        PorfirioDiaz = true
                        score += 5500
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(PorfirioDiaz, forKey: "PorfirioDiaz")
                    }) {
                        VStack {
                            Text("Porfirio Diaz")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(PorfirioDiaz ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                        
                    }
                    .disabled(PorfirioDiaz)
                    
                    Button(action: {
                        FranciscoMadero = true
                        score -= 4000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(FranciscoMadero, forKey: "FranciscoMadero")
                    }) {
                        VStack {
                            Text("Francisco Madero")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(FranciscoMadero ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(FranciscoMadero || PorfirioDiaz)
                    
                }
                HStack {
                    Button(action: {
                        PanchoVilla = true
                        score -= 4000
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(PanchoVilla, forKey: "PanchoVilla")
                    }) {
                        VStack {
                            Text("Pancho Villa")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(PanchoVilla ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(PanchoVilla || PorfirioDiaz)
                    
                    Button(action: {
                        MiguelHidalgo = true
                        score -= 4000
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
                        .overlay(MiguelHidalgo ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(MiguelHidalgo || PorfirioDiaz)
                }
                VStack {
                    //Question 4
                    Text("What did the Mexican Revolution not accomplish?")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    HStack {
                        Button(action: {
                            Overthrowingadictator = true
                            score -= 4000
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(Overthrowingadictator, forKey: "Overthrowingadictator")
                        }) {
                            VStack {
                                Text("Overthrowing a dictator")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(Overthrowingadictator ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(Overthrowingadictator || Politicalandeconomicstability)
                        
                        Button(action: {
                            AnewConstitution = true
                            score -= 4000
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(AnewConstitution, forKey: "AnewConstitution")
                        }) {
                            VStack {
                                Text("A new Constitution")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(AnewConstitution ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(AnewConstitution || Politicalandeconomicstability)
                        
                    }
                    HStack {
                        Button(action: {
                            Politicalandeconomicstability = true
                            score += 5500
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(Politicalandeconomicstability, forKey: "Politicalandeconomicstability")
                        }) {
                            VStack {
                                Text("Political and economic stability")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(Politicalandeconomicstability ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(Politicalandeconomicstability)
                        
                        Button(action: {
                            Socialupheaval = true
                            score -= 4000
                            UserDefaults.standard.set(score, forKey: "score")
                            UserDefaults.standard.set(Socialupheaval, forKey: "Socialupheaval")
                        }) {
                            VStack {
                                Text("Social upheaval")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .overlay(Socialupheaval ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                        }
                        .disabled(Socialupheaval || Politicalandeconomicstability)
                    }
                }
                
            }
            Button(action: {
                print(score-prevScore)
                if prevScore != score {
                    isShowingOlROverlay = true
                } else {
                    vm.onQuiz = false
                    AcQuiz.RevQuiz = false
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
                .overlay(!f1910to1920 || !Tooverthrowadictator || !PorfirioDiaz || !Politicalandeconomicstability ? Color.gray.opacity(0.5): Color.clear).cornerRadius(20)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(10)
                .frame(height: 100)
            }
            .disabled(!f1910to1920 || !Tooverthrowadictator || !PorfirioDiaz || !Politicalandeconomicstability)
            .sheet(isPresented: $isShowingOlROverlay, onDismiss: {
                prevScore = 0
                vm.onQuiz = false
                AcQuiz.RevQuiz = false
                isShowingOlROverlay = false
            }) {
                VStack {
                    Spacer()
                    Text("Your earnings are: \(score-prevScore)")
                    Spacer()
                    Button("Close") {
                        prevScore = 0
                        vm.onQuiz = false
                        AcQuiz.RevQuiz = false
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
