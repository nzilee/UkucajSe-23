//
//  MessageSender.swift
//  UkucajSe-23
//
//  Created by Nikola Zivkovic on 10/30/23.
//

import SwiftUI
import MessageUI

struct MessageSender: UIViewControllerRepresentable {
    @Binding var isShowingMessageView: Bool
    var recipient: String
    var body: String
    
    func makeUIViewController(context: Context) -> MFMessageComposeViewController {
        let messageVC = MFMessageComposeViewController()
        messageVC.recipients = [recipient] // Add recipient's phone number here
        messageVC.body = body
        messageVC.messageComposeDelegate = context.coordinator
        return messageVC
    }
    
    func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: Context) {
        // Nothing to do here
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowingMessageView: $isShowingMessageView)
    }
    
    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
        @Binding var isShowingMessageView: Bool
        
        init(isShowingMessageView: Binding<Bool>) {
            _isShowingMessageView = isShowingMessageView
        }
        
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            switch result {
            case .cancelled:
                print("Message was cancelled")
            case .failed:
                print("Message failed")
            case .sent:
                print("Message was sent")
            @unknown default:
                break
            }
            isShowingMessageView = false
        }
    }
}
