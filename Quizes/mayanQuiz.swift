//
//  SwiftUIView.swift
//  
//
//  Created by olmexQuiz.mtz on 28/03/23.
//

import SwiftUI

struct MayQ: View {
    @ObservedObject var vm: OnQuiz
    @ObservedObject var AcQuiz: ActiveQuiz
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.colorScheme) private var colorSchemeB
    @State var score = UserDefaults.standard.integer(forKey: "score")
    @State var prevScore = 0
//  mayan
    @State var isShowingOlROverlay = false
    @State var OlQuizComplete = UserDefaults.standard.bool(forKey: "OlQuizComplete")
//  First question mayan civilization
    @State var press1000 = UserDefaults.standard.bool(forKey: "Mpress1000")
    @State var press2000 = UserDefaults.standard.bool(forKey: "press200")
    @State var press2000B = UserDefaults.standard.bool(forKey: "press2000B") //Correct
    @State var press2500 = UserDefaults.standard.bool(forKey: "press2500")
//  Second question mayan civilization
    @State var AA = UserDefaults.standard.bool(forKey: "AA")
    @State var MWSA = UserDefaults.standard.bool(forKey: "MWSA") //Correct
    @State var AMA = UserDefaults.standard.bool(forKey: "AMA")
    @State var LE = UserDefaults.standard.bool(forKey: "LE")
//  third question mayan civilization
    @State var PandP = UserDefaults.standard.bool(forKey: "PandP")  //Correct
    @State var TandP = UserDefaults.standard.bool(forKey: "TandP")
    @State var PandH = UserDefaults.standard.bool(forKey: "PandH")
    @State var OandT = UserDefaults.standard.bool(forKey: "OandT")
//  fourth question mayan civilization
    @State var FandO = UserDefaults.standard.bool(forKey: "FandO")
    @State var SandO = UserDefaults.standard.bool(forKey: "SandO")
    @State var PandS = UserDefaults.standard.bool(forKey: "PandS")
    @State var PAandP = UserDefaults.standard.bool(forKey: "PAandP")
//  Fifth question mayan
    @State var eightCentury = UserDefaults.standard.bool(forKey: "eightCentury")
    @State var nineCentury = UserDefaults.standard.bool(forKey: "nineCentury") //correct
    @State var tenthCentury = UserDefaults.standard.bool(forKey: "tenthCentury")
    @State var thirtCentury = UserDefaults.standard.bool(forKey: "thirtCentury")
    
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
                Text("To when do the Mayas date back?")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        press1000 = true
                        score -= 100
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(press1000, forKey: "Mpress1000")
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
                    .disabled(press1000 || press2000B)
                    
                    Button(action: {
                        press2000 = true
                        score -= 100
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(press2000, forKey: "press2000")
                    }) {
                        VStack {
                            Text("2000")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(press2000 ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(press2000 || press2000B)
                    
                }
                HStack {
                    Button(action: {
                        press2000B = true
                        score += 150
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(press2000B, forKey: "press2000B")
                    }) {
                        VStack {
                            Text("2000 BCE")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(press2000B ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(press2000B)
                    
                    Button(action: {
                        press2500 = true
                        score -= 100
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(press2500, forKey: "press2500")
                    }) {
                        VStack {
                            Text("2500 BCE")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(press2500 ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(press2500 || press2000B)
                }
                
                //Second question
                Text("What where they known for?")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        AA = true
                        score -= 100
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(AA, forKey: "AA")
                    }) {
                        VStack {
                            Text("Astronomy, art")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(AA ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(AA || MWSA)
                    
                    Button(action: {
                        MWSA = true
                        score += 150
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(MWSA, forKey: "MWSA")
                    }) {
                        VStack {
                            Text("Mathematics, writing systems, astronomy")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(MWSA ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(MWSA)
                    
                }
                HStack {
                    Button(action: {
                        AMA = true
                        score -= 100
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(AMA, forKey: "AMA")
                    }) {
                        VStack {
                            Text("Astrology, mathematics, architecture")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(AMA ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(AMA || MWSA)
                    
                    Button(action: {
                        LE = true
                        score -= 100
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(LE, forKey: "LE")
                    }) {
                        VStack {
                            Text("Language, engineering")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(LE ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(LE || MWSA)
                }
                
                //Third question
                Text("What where their cities characterized by?")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                HStack {
                    Button(action: {
                        PandP = true
                        score += 150
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(PandP, forKey: "PandP")
                    }) {
                        VStack {
                            Text("Pyramids & palaces")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(PandP ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(PandP)
                    
                    Button(action: {
                        TandP = true
                        score -= 100
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(TandP, forKey: "TandP")
                    }) {
                        VStack {
                            Text("Temples & palaces")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(TandP ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(TandP || PandP)
                    
                }
                HStack {
                    Button(action: {
                        PandH = true
                        score -= 100
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(PandH, forKey: "PandH")
                    }) {
                        VStack {
                            Text("Pyramids & houses")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(PandH ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(PandH || PandP)
                    
                    Button(action: {
                        OandT = true
                        score -= 100
                        UserDefaults.standard.set(score, forKey: "score")
                        UserDefaults.standard.set(OandT, forKey: "OandT")
                    }) {
                        VStack {
                            Text("Observatories & temples")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .overlay(OandT ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                    }
                    .disabled(OandT || PandP)
                }
                VStack {
                    VStack {
                        //Question 4
                        Text("What did their religious practices involve?")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                        HStack {
                            Button(action: {
                                FandO = true
                                score -= 100
                                UserDefaults.standard.set(score, forKey: "score")
                                UserDefaults.standard.set(FandO, forKey: "FandO")
                            }) {
                                VStack {
                                    Text("Food & offerings")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                }
                                .padding()
                                .background(buttonColor)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .overlay(FandO ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                            }
                            .disabled(FandO || SandO)
                            
                            Button(action: {
                                SandO = true
                                score += 150
                                UserDefaults.standard.set(score, forKey: "score")
                                UserDefaults.standard.set(SandO, forKey: "SandO")
                            }) {
                                VStack {
                                    Text("Sacrifices & offerings")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                }
                                .padding()
                                .background(buttonColor)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .overlay(SandO ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                            }
                            .disabled(SandO)
                            
                        }
                        HStack {
                            Button(action: {
                                PandS = true
                                score -= 100
                                UserDefaults.standard.set(score, forKey: "score")
                                UserDefaults.standard.set(PandS, forKey: "PandS")
                            }) {
                                VStack {
                                    Text("Parties & sacrifices")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                }
                                .padding()
                                .background(buttonColor)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .overlay(PandS ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                            }
                            .disabled(PandS || SandO)
                            
                            Button(action: {
                                PAandP = true
                                score -= 100
                                UserDefaults.standard.set(score, forKey: "score")
                                UserDefaults.standard.set(PAandP, forKey: "PAandP")
                            }) {
                                VStack {
                                    Text("Parties & practices")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                }
                                .padding()
                                .background(buttonColor)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .overlay(PAandP ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                            }
                            .disabled(PAandP || SandO)
                        }
                    }
                    VStack {
                        //Question 5
                        Text("When did the Mayas collapse?")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                        HStack {
                            Button(action: {
                                eightCentury = true
                                score -= 100
                                UserDefaults.standard.set(score, forKey: "score")
                                UserDefaults.standard.set(eightCentury, forKey: "eightCentury")
                            }) {
                                VStack {
                                    Text("8th century")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                }
                                .padding()
                                .background(buttonColor)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .overlay(eightCentury ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                            }
                            .disabled(eightCentury || nineCentury)
                            
                            Button(action: {
                                tenthCentury = true
                                score += 150
                                UserDefaults.standard.set(score, forKey: "score")
                                UserDefaults.standard.set(tenthCentury, forKey: "tenthCentury")
                            }) {
                                VStack {
                                    Text("10th century")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                }
                                .padding()
                                .background(buttonColor)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .overlay(tenthCentury ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                            }
                            .disabled(tenthCentury || nineCentury)
                            
                        }
                        HStack {
                            Button(action: {
                                nineCentury = true
                                score -= 100
                                UserDefaults.standard.set(score, forKey: "score")
                                UserDefaults.standard.set(nineCentury, forKey: "nineCentury")
                            }) {
                                VStack {
                                    Text("9th century")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                }
                                .padding()
                                .background(buttonColor)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .overlay(nineCentury ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                            }
                            .disabled(nineCentury)
                            
                            Button(action: {
                                thirtCentury = true
                                score -= 100
                                UserDefaults.standard.set(score, forKey: "score")
                                UserDefaults.standard.set(thirtCentury, forKey: "thirtCentury")
                            }) {
                                VStack {
                                    Text("13th century")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                }
                                .padding()
                                .background(buttonColor)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .overlay(thirtCentury ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                            }
                            .disabled(thirtCentury || nineCentury)
                        }
                    }
                }
            }
            Button(action: {
                if prevScore != score {
                    isShowingOlROverlay = true
                } else {
                    vm.onQuiz = false
                    AcQuiz.MayQuiz = false
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
                .overlay(!press2000B || !MWSA || !PandP || !SandO || !nineCentury ? Color.gray.opacity(0.5): Color.clear).cornerRadius(20)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(10)
                .frame(height: 100)
            }
            .disabled(!press2000B || !MWSA || !PandP || !SandO || !nineCentury)
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
                        AcQuiz.MayQuiz = false
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
