//
//  quiz.swift
//
//
//  Created by rene.mtz on 17/03/23.
//

import SwiftUI

class ActiveQuiz: ObservableObject {
    @Published var OlmQuiz = false
    @Published var MayQuiz = false
    @Published var SpanQuiz = false
    @Published var IndQuiz = false
    @Published var RevQuiz = false
    @Published var kukQuiz = false
}

struct Quiz: View {
    @ObservedObject var vm: OnQuiz
    @ObservedObject var score: scores
    @StateObject var ActiveQ = ActiveQuiz()
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.colorScheme) private var colorSchemeB
    @State var aztecapressed = UserDefaults.standard.bool(forKey: "aztecapressed")
    @State var olmecapressed = UserDefaults.standard.bool(forKey: "olmecapressed")
    @State var spanishpressed = UserDefaults.standard.bool(forKey: "spanishpressed")
    @State var independencepressed = UserDefaults.standard.bool(forKey: "independencepressed")
    @State var revolutionpressed = UserDefaults.standard.bool(forKey: "revolutionpressed")
    @State var kukulkanpressed = UserDefaults.standard.bool(forKey: "kukulkanpressed")
    @State var isShowingQuOverlay = false
    @State var background = UserDefaults.standard.bool(forKey: "background")
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .onAppear {
                    score.score = UserDefaults.standard.integer(forKey: "score")
                    aztecapressed = UserDefaults.standard.bool(forKey: "aztecapressed")
                    olmecapressed = UserDefaults.standard.bool(forKey: "olmecapressed")
                    spanishpressed = UserDefaults.standard.bool(forKey: "spanishpressed")
                    independencepressed = UserDefaults.standard.bool(forKey: "independencepressed")
                    revolutionpressed = UserDefaults.standard.bool(forKey: "revolutionpressed")
                    kukulkanpressed = UserDefaults.standard.bool(forKey: "kukulkanpressed")
                    background = UserDefaults.standard.bool(forKey: "background")
                }
            
            if !background {
                GeometryReader{ geo in
                    PlayerView()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height+200)
                        .edgesIgnoringSafeArea(.all)
                        .ignoresSafeArea()
                        .overlay(Color.black.opacity(0.2))
                        .blur(radius: 1)
                        .edgesIgnoringSafeArea(.all)
                }
            }
            VStack {
                Text("Learn about")
                    .padding(10)
                ScrollView {
                    HStack {
                        VStack {
                            OlmecL()
                            SpanishL()
                            MexicanrL()
                        }
                        VStack {
                            MayanL()
                            MexicanL()
                            KukulkanL()
                        }
                    }
                }
                Button(action: {
                    print("Button pressed")
                    isShowingQuOverlay = true
                }) {
                    ZStack {
                        Color.green
                        VStack {
                            Text("Start Quiz")
                                .font(.title)
                                .padding(5)
                                .foregroundColor(.primary)
                        }
                    }
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(10)
                    .frame(height: 100)
                }
                .sheet(isPresented: $isShowingQuOverlay) {
                    VStack {
                        Text("Select the civilization you want to be tested on")
                            .padding(10)
                        Text("Coins: \(score.score)")
                            .onAppear {
                                score.score = UserDefaults.standard.integer(forKey: "score")
                                print("Coins text appeared: \(score.score)")
                            }

                        ScrollView {
                            //olmec
                            Button(action: {
                                isShowingQuOverlay = false
                                ActiveQ.OlmQuiz = true
                                vm.onQuiz = true
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
                                        Circle()
                                            .foregroundColor(.red)
                                            .frame(width: 100, height: 60)
                                            .overlay(
                                                Text("10")
                                                    .foregroundColor(.white)
                                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            )
                                        
                                        Spacer()
                                        Circle()
                                            .foregroundColor(.green)
                                            .frame(width: 100, height: 60)
                                            .overlay(
                                                Text("15")
                                                    .foregroundColor(.white)
                                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            )
                                    }
                                }
                                .padding()
                                .background(buttonColor)
                                .cornerRadius(10)
                                .overlay(score.score < 10 || !olmecapressed ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                                .shadow(radius: 5)
                                
                            }
                            .onAppear {
                                olmecapressed = UserDefaults.standard.bool(forKey: "olmecapressed")
                                score.score = UserDefaults.standard.integer(forKey: "score")
                            }
                            .padding(10)
                            .disabled(score.score < 10)
                            .disabled(!olmecapressed)
                            //olmec
                            //mayan
                            Button(action: {
                                isShowingQuOverlay = false
                                ActiveQ.MayQuiz = true
                                vm.onQuiz = true
                            }) {
                                VStack {
                                    Image("mayan")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 100)
                                        .padding(.bottom, 10)
                                    Text("Maya Civilization")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    HStack {
                                        Circle()
                                            .foregroundColor(.red)
                                            .frame(width: 100, height: 60)
                                            .overlay(
                                                Text("100")
                                                    .foregroundColor(.white)
                                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            )
                                        
                                        Spacer()
                                        Circle()
                                            .foregroundColor(.green)
                                            .frame(width: 100, height: 60)
                                            .overlay(
                                                Text("150")
                                                    .foregroundColor(.white)
                                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            )
                                    }
                                }
                                .padding()
                                .background(buttonColor)
                                .cornerRadius(10)
                                .overlay(score.score < 100 || aztecapressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                                .shadow(radius: 5)
                                
                            }
                            .onAppear {
                                score.score = UserDefaults.standard.integer(forKey: "score")
                                print(score.score)
                            }
                            .padding(10)
                            .disabled(score.score < 100)
                            .disabled(aztecapressed == false)
                            //mayan
                            //spanish
                            Button(action: {
                                isShowingQuOverlay = false
                                ActiveQ.SpanQuiz = true
                                vm.onQuiz = true
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
                                        Circle()
                                            .foregroundColor(.red)
                                            .frame(width: 100, height: 60)
                                            .overlay(
                                                Text("1000")
                                                    .foregroundColor(.white)
                                                    .fontWeight(.bold)
                                            )
                                        
                                        Spacer()
                                        Circle()
                                            .foregroundColor(.green)
                                            .frame(width: 100, height: 60)
                                            .overlay(
                                                Text("1500")
                                                    .foregroundColor(.white)
                                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            )
                                    }
                                }
                                .padding()
                                .background(buttonColor)
                                .cornerRadius(10)
                                .overlay(score.score < 1000 || spanishpressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                                .shadow(radius: 5)
                                
                            }
                            .onAppear {
                                score.score = UserDefaults.standard.integer(forKey: "score")
                                print(score.score)
                            }
                            .padding(10)
                            .disabled(score.score < 1000)
                            .disabled(spanishpressed == false)
                            //spanish
                            //independence
                            Button(action: {
                                isShowingQuOverlay = false
                                ActiveQ.IndQuiz = true
                                vm.onQuiz = true
                            }) {
                                VStack {
                                    Image("independence")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 100)
                                        .padding(.bottom, 10)
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/, style: FillStyle())
                                    Text("Mexican Independence")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    HStack {
                                        Circle()
                                            .foregroundColor(.red)
                                            .frame(width: 100, height: 60)
                                            .overlay(
                                                Text("2000")
                                                    .foregroundColor(.white)
                                                    .fontWeight(.bold)
                                            )
                                        
                                        Spacer()
                                        Circle()
                                            .foregroundColor(.green)
                                            .frame(width: 100, height: 60)
                                            .overlay(
                                                Text("4500")
                                                    .foregroundColor(.white)
                                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            )
                                    }
                                }
                                .padding()
                                .background(buttonColor)
                                .cornerRadius(10)
                                .overlay(score.score < 2000 || independencepressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                                .shadow(radius: 5)
                                
                            }
                            .onAppear {
                                score.score = UserDefaults.standard.integer(forKey: "score")
                                print(score.score)
                            }
                            .padding(10)
                            .disabled(score.score < 2000)
                            .disabled(independencepressed == false)
                            //independence
                            //revolution
                            Button(action: {
                                isShowingQuOverlay = false
                                ActiveQ.RevQuiz = true
                                vm.onQuiz = true
                            }) {
                                VStack {
                                    Image("revolution")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 100)
                                        .padding(.bottom, 10)
                                    Text("Mexican Revolution")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    HStack {
                                        Circle()
                                            .foregroundColor(.red)
                                            .frame(width: 100, height: 60)
                                            .overlay(
                                                Text("4000")
                                                    .foregroundColor(.white)
                                                    .fontWeight(.bold)
                                            )
                                        
                                        Spacer()
                                        Circle()
                                            .foregroundColor(.green)
                                            .frame(width: 100, height: 60)
                                            .overlay(
                                                Text("5500")
                                                    .foregroundColor(.white)
                                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            )
                                    }
                                }
                                .padding()
                                .background(buttonColor)
                                .cornerRadius(10)
                                .overlay(score.score < 4000 || revolutionpressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                                .shadow(radius: 5)
                                
                            }
                            .onAppear {
                                score.score = UserDefaults.standard.integer(forKey: "score")
                                print(score.score)
                            }
                            .padding(10)
                            .disabled(score.score < 4000)
                            .disabled(!revolutionpressed)
                            //revolution
                            //kukulkan
                            Button(action: {
                                isShowingQuOverlay = false
                                ActiveQ.kukQuiz = true
                                vm.onQuiz = true
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
                                        Circle()
                                            .foregroundColor(.red)
                                            .frame(width: 100, height: 60)
                                            .overlay(
                                                Text("6500")
                                                    .foregroundColor(.white)
                                                    .fontWeight(.bold)
                                            )
                                        
                                        Spacer()
                                        Circle()
                                            .foregroundColor(.green)
                                            .frame(width: 100, height: 60)
                                            .overlay(
                                                Text("8000")
                                                    .foregroundColor(.white)
                                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            )
                                    }
                                }
                                .padding()
                                .background(buttonColor)
                                .cornerRadius(10)
                                .overlay(score.score < 6500 || kukulkanpressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                                .shadow(radius: 5)
                                
                            }
                            .onAppear {
                                score.score = UserDefaults.standard.integer(forKey: "score")
                                print(score.score)
                            }
                            .padding(10)
                            .disabled(score.score < 6500)
                            .disabled(!revolutionpressed)
                            //kukulkan

                        }
                        Spacer()
                        Button("Close") {
                            isShowingQuOverlay = false
                        }
                        .padding()
                    }
                }
            }
            if ActiveQ.OlmQuiz {
                OlmQ(vm: vm, AcQuiz: ActiveQ)
                }
            if ActiveQ.MayQuiz {
                MayQ(vm: vm, AcQuiz: ActiveQ)
                }
            if ActiveQ.SpanQuiz {
                SpanQ(vm: vm, AcQuiz: ActiveQ)
                }
            if ActiveQ.IndQuiz {
                IndQ(vm: vm, AcQuiz: ActiveQ)
                }
            if ActiveQ.RevQuiz {
                RevQ(vm: vm, AcQuiz: ActiveQ)
                }
            if ActiveQ.kukQuiz {
                KukQ(vm: vm, AcQuiz: ActiveQ)
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
