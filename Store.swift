import SwiftUI

struct Store: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.colorScheme) private var colorSchemeB
    @ObservedObject var score: scores
    @ObservedObject var ob: OfflineBonus
    @State var aztecapressed = UserDefaults.standard.bool(forKey: "aztecapressed")
    @State var olmecapressed = UserDefaults.standard.bool(forKey: "olmecapressed")
    @State var spanishpressed = UserDefaults.standard.bool(forKey: "spanishpressed")
    @State var independencepressed = UserDefaults.standard.bool(forKey: "independencepressed")
    @State var revolutionpressed = UserDefaults.standard.bool(forKey: "revolutionpressed")
    @State var kukulkanpressed = UserDefaults.standard.bool(forKey: "kukulkanpressed")
    @State var multicost = UserDefaults.standard.double(forKey: "multicost")
    @State var multiplier = UserDefaults.standard.double(forKey: "multiplier")
    @State var background = UserDefaults.standard.bool(forKey: "background")
    @State var state = ""
    
    
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .onAppear{
                    if ob.offlineCost < 1000 {
                        ob.offlineCost = 1000
                        UserDefaults.standard.set(ob.offlineCost, forKey: "offlineCost")
                    }
                    print(ob.offlineCost)
                    callFunc()
                    score.score = UserDefaults.standard.integer(forKey: "score")
                    background = UserDefaults.standard.bool(forKey: "background")
                    aztecapressed = UserDefaults.standard.bool(forKey: "aztecapressed")
                    olmecapressed = UserDefaults.standard.bool(forKey: "olmecapressed")
                    spanishpressed = UserDefaults.standard.bool(forKey: "spanishpressed")
                    independencepressed = UserDefaults.standard.bool(forKey: "independencepressed")
                    revolutionpressed = UserDefaults.standard.bool(forKey: "revolutionpressed")
                    kukulkanpressed = UserDefaults.standard.bool(forKey: "kukulkanpressed")
                    multicost = UserDefaults.standard.double(forKey: "multicost")
                    multiplier = UserDefaults.standard.double(forKey: "multiplier")
                    if multicost == 0 {
                        multicost = 700.0
                        UserDefaults.standard.set(multicost, forKey: "multicost")
                    }
                    if multiplier == 0 {
                        multiplier = 1.0
                        UserDefaults.standard.set(multiplier, forKey: "multiplier")
                    }
                }

            //Color.primary
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
                Spacer()
            }
            
            ScrollView{
                HStack{
                    VStack{
                        
                        // button olmeca
                        Button(action: {
                            if score.score < 9 {
                                print("no")
                            } else {
                                score.score -= 10
                                playSound(name: "coin", extensionType: "mp3")
                                olmecapressed = true
                                UserDefaults.standard.set(olmecapressed, forKey: "olmecapressed")
                                UserDefaults.standard.set(score.score, forKey: "score")
                            }
                            
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
                                    Circle()
                                        .foregroundColor(.red)
                                        .frame(width: 100, height: 60)
                                        .overlay(
                                            Text("10")
                                                .foregroundColor(.white)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        )
                                }
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .overlay(score.score < 10 && olmecapressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(10)
                            .overlay(olmecapressed ? Color.green.opacity(0.5) : Color.clear).cornerRadius(10)
                            .shadow(radius: 5)
                            
                        }
                        .padding(10)
                        .disabled(score.score < 10)
                        .disabled(olmecapressed)
                        
                        //olmeca button end
                        
                        // azteca button
                        Button(action: {
                            score.score -= 200
                            aztecapressed = true
                            playSound(name: "coin", extensionType: "mp3")
                            UserDefaults.standard.set(aztecapressed, forKey: "aztecapressed")
                            UserDefaults.standard.set(score.score, forKey: "score")
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
                                    Spacer()
                                    Circle()
                                        .foregroundColor(.red)
                                        .frame(width: 100, height: 60)
                                        .overlay(
                                            Text("200")
                                                .foregroundColor(.white)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        )
                                }
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .overlay(score.score < 100 && aztecapressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(10)
                            .overlay(aztecapressed ? Color.green.opacity(0.5) : Color.clear).cornerRadius(10)
                            .shadow(radius: 5)
                            
                        }
                        .padding(10)
                        .disabled(score.score < 200)
                        .disabled(aztecapressed)
                        //azteca button end
                        
                        //spanish button
                        Button(action: {
                            if score.score < 1499 {
                                print("no")
                            } else {
                                score.score -= 1500
                                playSound(name: "coin", extensionType: "mp3")
                                spanishpressed = true
                                UserDefaults.standard.set(spanishpressed, forKey: "spanishpressed")
                                UserDefaults.standard.set(score.score, forKey: "score")
                            }
                            
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
                                    Circle()
                                        .foregroundColor(.red)
                                        .frame(width: 100, height: 60)
                                        .overlay(
                                            Text("1,500")
                                                .foregroundColor(.white)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        )
                                }
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .overlay(spanishpressed ? Color.green.opacity(0.5) : Color.clear).cornerRadius(10)
                            .overlay(score.score < 1500 && spanishpressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(10)
                            .shadow(radius: 5)
                            
                        }
                        .padding(10)
                        .disabled(score.score < 1500)
                        .disabled(spanishpressed)
                        //spanish button end
                        
                        // independence button
                        Button(action: {
                            score.score -= 4000
                            independencepressed = true
                            playSound(name: "coin", extensionType: "mp3")
                            UserDefaults.standard.set(independencepressed, forKey: "independencepressed")
                            UserDefaults.standard.set(score.score, forKey: "score")
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
                                    Spacer()
                                    Circle()
                                        .foregroundColor(.red)
                                        .frame(width: 100, height: 60)
                                        .overlay(
                                            Text("4,000")
                                                .foregroundColor(.white)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        )
                                }
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .overlay(independencepressed ? Color.green.opacity(0.5) : Color.clear).cornerRadius(10)
                            .overlay(score.score < 4000 && independencepressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(10)
                            .shadow(radius: 5)
                            
                        }
                        .padding(10)
                        .disabled(score.score < 4000)
                        .disabled(independencepressed)
                        //independence button end
                        
                        // revolution button
                        Button(action: {
                            if score.score < 6999 {
                                print("no")
                            } else {
                                score.score -= 7000
                                playSound(name: "coin", extensionType: "mp3")
                                revolutionpressed = true
                                UserDefaults.standard.set(revolutionpressed, forKey: "revolutionpressed")
                                UserDefaults.standard.set(score.score, forKey: "score")
                            }
                            
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
                                    Spacer()
                                    Circle()
                                        .foregroundColor(.red)
                                        .frame(width: 100, height: 60)
                                        .overlay(
                                            Text("7,000")
                                                .foregroundColor(.white)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        )
                                }
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .overlay(score.score < 7000 && revolutionpressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                            .overlay(revolutionpressed ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                            .shadow(radius: 5)
                            
                        }
                        .padding(10)
                        .disabled(score.score < 7000)
                        .disabled(revolutionpressed)
                        
                        //revolution button end
                        
                        // Kukulcán button
                        Button(action: {
                            if score.score < 19999 {
                                print("no")
                            } else {
                                score.score -= 20000
                                playSound(name: "coin", extensionType: "mp3")
                                kukulkanpressed = true
                                UserDefaults.standard.set(kukulkanpressed, forKey: "kukulkanpressed")
                                UserDefaults.standard.set(score.score, forKey: "score")
                            }
                            
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
                                    Spacer()
                                    Circle()
                                        .foregroundColor(.red)
                                        .frame(width: 100, height: 60)
                                        .overlay(
                                            Text("20,000")
                                                .foregroundColor(.white)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        )
                                }
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .overlay(score.score < 20000 && kukulkanpressed == false ? Color.red.opacity(0.5) : Color.clear).cornerRadius(20)
                            .overlay(kukulkanpressed ? Color.green.opacity(0.5) : Color.clear).cornerRadius(20)
                            .shadow(radius: 5)
                            
                        }
                        .padding(10)
                        .disabled(score.score < 20000)
                        .disabled(kukulkanpressed)
                        
                        //Kukulcán button end
                        
                        
                    }
                    VStack{
                        // multiplier button
                        Button(action: {
                            print(multicost)
                            print(multiplier * 1.1)
                            score.score = score.score - Int(multicost)
                            multiplier = multiplier * 1.1
                            multicost = multicost * 1.5
                            playSound(name: "coin", extensionType: "mp3")
                            UserDefaults.standard.set(score.score, forKey: "score")
                            UserDefaults.standard.set(multiplier, forKey: "multiplier")
                            UserDefaults.standard.set(multicost, forKey: "multicost")
                        }) {
                            VStack {
                                Image("multiplier")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 100)
                                    .padding(.bottom, 10)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/, style: FillStyle())
                                Text("Multiplier")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                HStack {
                                    Spacer()
                                    Circle()
                                        .foregroundColor(.red)
                                        .frame(width: 100, height: 60)
                                        .overlay(
                                            Text("\(Int(multicost))")
                                                .foregroundColor(.white)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        )
                                }
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .overlay(score.score < Int(multicost) ? Color.red.opacity(0.5) : Color.clear).cornerRadius(10)
                            .shadow(radius: 5)
                            
                        }
                        .padding(10)
                        .disabled(score.score < Int(multicost))
                        //multiplier button end
                        // offline bonis button
                        Button(action: {
                            print("\(ob.offlineCost) \(ob.offlineAmmount)")
                            score.score = score.score - Int(ob.offlineCost)
                            ob.offline = true
                            ob.offlineCost = floor(ob.offlineCost * 1.8)
                            if ob.offlineAmmount == 0 {
                                ob.offlineAmmount = 1
                            } else {
                                ob.offlineAmmount = ob.offlineAmmount*2
                            }
                            playSound(name: "coin", extensionType: "mp3")
                            UserDefaults.standard.set(score.score, forKey: "score")
                            UserDefaults.standard.set(ob.offlineCost, forKey: "offlineCost")
                            UserDefaults.standard.set(ob.offline, forKey: "offline")
                            UserDefaults.standard.set(ob.offlineAmmount, forKey: "amount")
                        }) {
                            
                            VStack {
                                Image("sleep")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 100)
                                    .padding(.bottom, 10)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/, style: FillStyle())
                                Text("Offline generator")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text(state)
                                HStack {
                                    Spacer()
                                    Circle()
                                        .foregroundColor(.red)
                                        .frame(width: 100, height: 60)
                                        .overlay(
                                            Text("\(Int(ob.offlineCost))")
                                                .foregroundColor(.white)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        )
                                }
                            }
                            .padding()
                            .background(buttonColor)
                            .cornerRadius(10)
                            .overlay(score.score < Int(ob.offlineCost) ? Color.red.opacity(0.5) : Color.clear).cornerRadius(10)
                            .shadow(radius: 5)
                            
                        }
                        .padding(10)
                        .disabled(score.score < Int(ob.offlineCost))
                        //multiplier button end
                        Spacer()
                        
                    }
                    
                }
            }
            VStack{
                Text("Coins: \(score.score)")
                    .foregroundColor(.primary)
                    .padding()
                Spacer()
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
    func callFunc() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if !ob.offline {
                state = "Activate generator"
            } else {
                state = "Increase from \(ob.offlineAmmount) to \(ob.offlineAmmount*2)/minute"
            }
            callFunc()
        }
    }
}
