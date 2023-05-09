import SwiftUI
import AVKit

class OnQuiz: ObservableObject {
    @Published var onQuiz = false
}

class playing: ObservableObject {
    @Published var music = UserDefaults.standard.bool(forKey: "music")
    @Published var audioPlayer: AVAudioPlayer?
}

class scores: ObservableObject {
    @Published var score = UserDefaults.standard.integer(forKey: "score")
}

class backgroundEn: ObservableObject {
    @Published var background = UserDefaults.standard.bool(forKey: "background")
}

class OfflineBonus: ObservableObject {
    @Published var offline = UserDefaults.standard.bool(forKey: "offline")
    @Published var offlineAmmount = UserDefaults.standard.integer(forKey: "amount")
    @Published var showPopup = false
    @Published var generated = UserDefaults.standard.integer(forKey: "generated")
    @Published var offlineCost = UserDefaults.standard.double(forKey: "offlineCost")
    
}

struct ExecuteCode : View {
    init( _ codeToExec: () -> () ) {
        codeToExec()
    }
    
    var body: some View {
        return EmptyView()
    }
}

struct ContentView: View {
    @StateObject var onQuizV = OnQuiz()
    @StateObject var music = playing()
    @StateObject var score = scores()
    @StateObject var bg = backgroundEn()
    @ObservedObject var ob: OfflineBonus
    @State private var toast: Toast? = nil
    
    var body: some View {
        ZStack {
            TabView {
                // Home tab
                if onQuizV.onQuiz == false {
                    ExecuteCode {
                        if music.music == false {
                            music.audioPlayer?.play()
                        }
                    }
                    Map(score: score)
                        .tabItem {
                            Label("Home", systemImage: "house.circle.fill")
                        }
                    
                    Store(score: score, ob: ob)
                        .tabItem {
                            Label("Store", systemImage: "bag.circle")
                        }
                } else {
                    ExecuteCode {
                        music.audioPlayer?.stop()
                    }
                }
                
                // Quiz tab
                Quiz(vm: onQuizV, score: score)
                    .tabItem {
                        Label("Quiz", systemImage: "questionmark.circle.fill")
                    }
                
                // Config tab
                if onQuizV.onQuiz == false {
                    Config(vm: music, quiz: onQuizV)
                        .tabItem {
                            Label("Config", systemImage: "gear")
                        }
                }
            }
            .onAppear {
                if !music.music {
                    let url = Bundle.main.url(forResource: "mexico clicker theme", withExtension: "mp3")!
                    do {
                        music.audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                        music.audioPlayer?.numberOfLoops = -1
                        music.audioPlayer?.volume = 0.3
                        music.audioPlayer?.prepareToPlay()
                        music.audioPlayer?.play()
                    } catch let error {
                        print("Error playing audio: \(error.localizedDescription)")
                    }
                } else {
                    let url = Bundle.main.url(forResource: "mexico clicker theme", withExtension: "mp3")!
                    do {
                        music.audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                        music.audioPlayer?.numberOfLoops = -1
                        music.audioPlayer?.volume = 0.3
                    } catch let error {
                        print("Error playing audio: \(error.localizedDescription)")
                    }
                }
                callFunc()
            }
        }
        .toastView(toast: $toast)
    }
    private func callFunc() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if ob.showPopup {
                    toast = Toast(style: .info, message: "You earned \(ob.generated) coins while offline")
                    ob.showPopup = false
                    print("offline toast?")
                }
                callFunc()
            }
        }
}

