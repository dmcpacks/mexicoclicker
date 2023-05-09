//
//  SwiftUIView.swift
//  
//
//  Created by rene.mtz on 11/04/23.
//

import SwiftUI

struct Toast: Equatable {
  var style: ToastStyle
  var message: String
  var duration: Double = 3
  var width: Double = .infinity
}

enum ToastStyle {
  case error
  case warning
  case success
  case info
}

extension ToastStyle {
  var themeColor: Color {
    switch self {
    case .error: return Color.red
    case .warning: return Color.orange
    case .info: return Color.blue
    case .success: return Color.green
    }
  }
  
  var iconFileName: String {
    switch self {
    case .info: return "info.circle.fill"
    case .warning: return "exclamationmark.triangle.fill"
    case .success: return "checkmark.circle.fill"
    case .error: return "xmark.circle.fill"
    }
  }
}

struct ToastView: View {
    @Environment(\.colorScheme) private var colorScheme
    var style: ToastStyle
    var message: String
    var width = CGFloat.infinity
    var onCancelTapped: (() -> Void)
  
    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 12) {
                Image(systemName: style.iconFileName)
                    .foregroundColor(style.themeColor)
                Text(message)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                    .font(Font.caption)
                
                Spacer(minLength: 10)
            }
            .padding()
            .frame(minWidth: 0, maxWidth: width)
            .cornerRadius(8)
            .background(
                RoundedRectangle(cornerRadius: 800)
                    .foregroundColor(.green)
            )
            .padding(.horizontal, 16)
        }
    }
    private var titleColor: Color {
        switch colorScheme {
        case .light:
            return Color.black
        case .dark:
            return Color.white
        @unknown default:
            return Color.black
        }
    }
}

struct ToastModifier: ViewModifier {
  
  @Binding var toast: Toast?
  @State private var workItem: DispatchWorkItem?
  
  func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .overlay(
        ZStack {
          mainToastView()
            .offset(y: 32)
        }.animation(.spring(), value: toast)
      )
      .onChange(of: toast) { value in
        showToast()
      }
  }
  
  @ViewBuilder func mainToastView() -> some View {
    if let toast = toast {
      VStack {
        ToastView(
          style: toast.style,
          message: toast.message,
          width: toast.width
        ) {
          dismissToast()
        }
        Spacer()
      }
    }
  }
  
  private func showToast() {
    guard let toast = toast else { return }
    
    UIImpactFeedbackGenerator(style: .light)
      .impactOccurred()
    
    if toast.duration > 0 {
      workItem?.cancel()
      
      let task = DispatchWorkItem {
        dismissToast()
      }
      
      workItem = task
      DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
    }
  }
  
  private func dismissToast() {
    withAnimation {
      toast = nil
    }
    
    workItem?.cancel()
    workItem = nil
  }
}

extension View {

  func toastView(toast: Binding<Toast?>) -> some View {
    self.modifier(ToastModifier(toast: toast))
  }
}


