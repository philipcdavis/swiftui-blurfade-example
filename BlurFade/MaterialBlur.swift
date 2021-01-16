//
//  MaterialBlur.swift
//  MaterialBlur
//
//  Created by Philip Davis on 1/14/21.
//

import SwiftUI

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemUltraThinMaterialDark
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}


struct MaterialBlur: View {
    private var materials: [UIBlurEffect.Style] = [ .systemUltraThinMaterial, .systemThinMaterial, .systemMaterial, .systemThickMaterial, .systemChromeMaterial]
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            
            VStack {
                Spacer()
                
                Color(.clear)
                    
                    .background(Blur())
                    .frame(width: UIScreen.main.bounds.width, height: 500)
                    .mask(LinearGradient(
                        gradient:
                            Gradient(
                                stops: [.init(color: .black, location: 0),
                                        .init(color: .black, location: 0.4),
                                        .init(color: .clear, location: 1)
                                ]),
                        startPoint: .bottom, endPoint: .top
                        
                    ))
                
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }
}

struct MaterialBlur_Previews: PreviewProvider {
    static var previews: some View {
        MaterialBlur()
    }
}
