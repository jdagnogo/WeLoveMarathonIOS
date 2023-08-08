//
//  TipsModelUiView.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 08/08/2023.
//

import SwiftUI
import WebKit

struct TipsModelUiView: View {
    let title: String
    var description: String
    var body: some View {
        VStack{
            Text(title)
                .foregroundColor(Color.white)
                .font(.system(size: 24))
            
            HTMLTextView(htmlString:description)
        }.padding(.vertical , 40).padding(.horizontal , 16).background(Color("Primary"))
    }
    
    struct HTMLTextView: UIViewRepresentable {
        var htmlString: String
        
        func makeUIView(context: Context) -> UITextView {
            let textView = UITextView()
            textView.backgroundColor = UIColor(Color("Primary"))
            textView.isEditable = false
            return textView
        }
        
        func updateUIView(_ uiView: UITextView, context: Context) {
            if let attributedString = try? NSAttributedString(
                data: Data(htmlString.utf8),
                options: [.documentType: NSAttributedString.DocumentType.html],
                documentAttributes: nil
            ) {
                let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
                
                let font = UIFont.systemFont(ofSize: 16) // Set your desired font size
                      let fontSizeAttributes: [NSAttributedString.Key: Any] = [
                          .font: font
                      ]
                
                mutableAttributedString.addAttributes(fontSizeAttributes, range: NSRange(location: 0, length: mutableAttributedString.length))
                
                let boldAttributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.white // Set your desired red color
                ]
                
                attributedString.enumerateAttributes(in: NSRange(location: 0, length: attributedString.length), options: []) { attributes, range, _ in
                    if let font = attributes[.font] as? UIFont, font.isBold {
                        mutableAttributedString.addAttributes(boldAttributes, range: range)
                    }
                }
                
                uiView.attributedText = mutableAttributedString
            }
        }
    }
    
    struct TipsModelUiView_Previews: PreviewProvider {
        static var previews: some View {
            let desc = """
                <ul>
                    <li><span style="font-weight: bold;">100</span> - <a href="https://example.com">police</a></li>
                    <li><span style="font-weight: normal;">166</span> - <a href="https://example.com">medicine aid</a></li>
                    <li><span style="font-weight: bold;">199</span> - <a href="https://example.com">fire department</a></li>
                </ul>
            """
            TipsModelUiView(title : "title", description: desc)
        }
    }
}

extension UIFont {
    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }
}
