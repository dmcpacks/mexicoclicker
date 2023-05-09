import SwiftUI

@main
struct AboutMeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    @Environment(\.scenePhase) private var scenePhase
    private var timestamp: Date?
    @StateObject var ob = OfflineBonus()
    
    var body: some Scene {
        WindowGroup {
            ContentView(ob: ob)
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .background:
                // App is transitioning to background, store the timestamp
                UserDefaults.standard.set(Int(Date().timeIntervalSince1970), forKey: "lastTimestamp")
                print("Application Backgrounded")
                
            case .inactive:
                break
            case .active:
                // App is foreground, retrieve the stored timestamp
                let timestamp = UserDefaults.standard.integer(forKey: "lastTimestamp")
                let elapsed = Int(Date().timeIntervalSince1970) - timestamp
                print("Application activated at \(elapsed)")
                print("Deactivate time: \(timestamp)\nCurrent time: \(Int(Date().timeIntervalSince1970))")
                if elapsed < 60 {
                    break
                } else if ob.offline {
                    var score = UserDefaults.standard.integer(forKey: "score")
                    let prevscore = score
                    score += Int(Int(elapsed/60) * ob.offlineAmmount)
                    UserDefaults.standard.set(score, forKey: "score")
                    let newscore = score - prevscore
                    ob.generated = newscore
                    UserDefaults.standard.set(newscore, forKey: "generated")
                    ob.showPopup = true
                    print("showing popup")
                }
                
            @unknown default:
                break
            }
        }
    }
}
