import SwiftUI
import AVKit
import AVFoundation

struct Map: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.colorScheme) private var colorSchemeB
    @State private var toast: Toast? = nil
    @State var production = 1.0
    @ObservedObject var score: scores
    @State var aztecapressed = UserDefaults.standard.bool(forKey: "aztecapressed")
    @State var olmecapressed = UserDefaults.standard.bool(forKey: "olmecapressed")
    @State var spanishpressed = UserDefaults.standard.bool(forKey: "spanishpressed")
    @State var independencepressed = UserDefaults.standard.bool(forKey: "independencepressed")
    @State var revolutionpressed = UserDefaults.standard.bool(forKey: "revolutionpressed")
    @State var kukulkanpressed = UserDefaults.standard.bool(forKey: "kukulkanpressed")
    @State var muted = UserDefaults.standard.bool(forKey: "muted")
    @State var multiplier = UserDefaults.standard.double(forKey: "multiplier")
    @State var introduction = UserDefaults.standard.bool(forKey: "introduction")
    @State var pressentedIntro = UserDefaults.standard.bool(forKey: "pressentedIntro")
    @State var background = UserDefaults.standard.bool(forKey: "background")
    
    func updateprod() {
        production = 0.0
        production += 1
        if olmecapressed {
            production += 1
        }
        if aztecapressed {
            production += 3
        }
        if spanishpressed {
            production += 3
        }
        if independencepressed {
            production += 4
        }
        if revolutionpressed {
            production += 4
        }
        if kukulkanpressed {
            production += 5
        }
        production = round(production * multiplier)
    }
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .onAppear{
                    background = UserDefaults.standard.bool(forKey: "background")
                    score.score = UserDefaults.standard.integer(forKey: "score")
                    aztecapressed = UserDefaults.standard.bool(forKey: "aztecapressed")
                    olmecapressed = UserDefaults.standard.bool(forKey: "olmecapressed")
                    spanishpressed = UserDefaults.standard.bool(forKey: "spanishpressed")
                    independencepressed = UserDefaults.standard.bool(forKey: "independencepressed")
                    revolutionpressed = UserDefaults.standard.bool(forKey: "revolutionpressed")
                    kukulkanpressed = UserDefaults.standard.bool(forKey: "kukulkanpressed")
                    muted = UserDefaults.standard.bool(forKey: "muted")
                    multiplier = UserDefaults.standard.double(forKey: "multiplier")
                    updateprod()
                    
                    if multiplier == 0 {
                        multiplier = 1.0
                        UserDefaults.standard.set(multiplier, forKey: "multiplier")
                    }
                    if production == 0.0 {
                        production = 1
                    }
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
                
                VStack {
                    
                    Button(action: {
                        let randomNumber = Int(arc4random_uniform(3)) + 1
                        if muted == false {
                            playSound(name: "work\(randomNumber)", extensionType: "mp3")
                        }
                        score.score += Int(production)
                        UserDefaults.standard.set(score.score, forKey: "score")
                        
                    }) {
                        VStack {
                            Image("coin")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 100)
                                .padding(.bottom, 10)
                            Text("Work")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            HStack {
                                Spacer()
                                Circle()
                                    .foregroundColor(.green)
                                    .frame(width: 100, height: 60)
                                    .overlay(
                                        Text("\(Int(production))")
                                            .foregroundColor(.white)
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    )
                            }
                            HStack{
                                Spacer()
                                let str = "Multiplier: \(round(10 * multiplier) / 10.0)".replacingOccurrences(of: "0", with: "")
                                Text(str)
                                    .fontWeight(.light)
                            }
                        }
                        .padding(10)
                        .background(buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        
                    }.padding(10)
                    
                    Text("Coins: \(score.score)")
                        .onAppear {
                            if pressentedIntro == false {
                                introduction = true
                            } else {
                                introduction = false
                            }
                        }
                        .sheet(isPresented: $introduction, onDismiss: {
                            pressentedIntro = true
                            introduction = false
                            UserDefaults.standard.set(pressentedIntro, forKey: "pressentedIntro")
                            UserDefaults.standard.set(introduction, forKey: "introduction")
                        }) {
                            VStack {
                                ScrollView {
                                    Text("Hello!\nMy name is René Martínez, I'm a ninth grade student in Mexico. This game is a combination of two things I really like, clicker games and history. Here, you can have all the clicker fun you ever wanted and the added benefit of learning about Mexican history in fun ways.\n\nTo get started, just click the button that says \"work\". You can head over to the shop to buy pieces of history and earn more coins per click. Once you purchase an item, go into the quiz section to earn some extra coins and learn about the event you puchased!\n\nRed bubbles represent loosing money and green bubbles represent earning money.")
                                        .multilineTextAlignment(.center)
                                        .padding()
                                }
                                Spacer()
                                Button("Close") {
                                    pressentedIntro = true
                                    introduction = false
                                    UserDefaults.standard.set(pressentedIntro, forKey: "pressentedIntro")
                                    UserDefaults.standard.set(introduction, forKey: "introduction")
                                }
                                .padding()
                            }
                        }
                }
                VStack(spacing: 30) {
                    ZStack {
                        Image("map")
                            .resizable()
                            .scaledToFit()
                            .onTapGesture {
                                toast = Toast(style: .info, message: "This map automatically updates as you purchase events to show where they started")
                            }
                        if olmecapressed {
                            Image("olmec map")
                                .resizable()
                                .scaledToFit()
                                .onTapGesture {
                                    toast = Toast(style: .info, message: "This map automatically updates as you purchase events to show where they started")
                                }
                        }
                        if aztecapressed {
                            Image("mayan map")
                                .resizable()
                                .scaledToFit()
                                .onTapGesture {
                                    toast = Toast(style: .info, message: "This map automatically updates as you purchase events to show where they started")
                                }
                        }
                        if spanishpressed {
                            Image("spanish map")
                                .resizable()
                                .scaledToFit()
                                .onTapGesture {
                                    toast = Toast(style: .info, message: "This map automatically updates as you purchase events to show where they started")
                                }
                        }
                        if independencepressed {
                            Image("independence map")
                                .resizable()
                                .scaledToFit()
                                .onTapGesture {
                                    toast = Toast(style: .info, message: "This map automatically updates as you purchase events to show where they started")
                                }
                        }
                        if revolutionpressed {
                            Image("revolution map")
                                .resizable()
                                .scaledToFit()
                                .onTapGesture {
                                    toast = Toast(style: .info, message: "This map automatically updates as you purchase events to show where they started")
                                }
                        }
                        if kukulkanpressed {
                            Image("kukulkan map")
                                .resizable()
                                .scaledToFit()
                                .onTapGesture {
                                    toast = Toast(style: .info, message: "This map automatically updates as you purchase events to show where they started")
                                }
                        }
                    }
                }
                .toastView(toast: $toast)
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

