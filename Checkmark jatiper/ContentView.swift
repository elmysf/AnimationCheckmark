//
//  ContentView.swift
//  Checkmark jatiper
//
//  Created by Sufiandy Elmy on 26/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showTumb = 100
    @State private var drawRing = 1/99
    @State private var showCircle = 0
    @State private var rotateCheckmark = 30
    @State private var showCheckMark = -60
    
    var body: some View {
        VStack(spacing: 100) {
            Text("Terima Kasih")
                .font(.title)
            
            ZStack {
                //Inactive
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .frame(width: 126, height: 126, alignment: .center)
                    .foregroundColor(Color(.systemGray))
                
                //Active
                Circle()
                    .trim(from: 0, to: CGFloat(drawRing))
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .frame(width: 126, height: 126, alignment: .center)
                    .rotationEffect(.degrees(-90))
                    .foregroundColor(Color(.systemTeal))
                    .animation(Animation.easeInOut(duration: 1).delay(1))
                
                Image(systemName: "touchid")
                    .font(.system(size: 80))
                    .foregroundColor(Color(.systemGray3))
                
                Image(systemName: "touchid")
                    .font(.system(size: 80))
                    .clipShape(Rectangle().offset(y: CGFloat(showTumb)))
                    .foregroundColor(Color(.systemPink))
                    .animation(Animation.easeInOut(duration: 1))
                
                //Green Circle
                Circle()
                    .frame(width: 110, height: 100, alignment: .center)
                    .foregroundColor(Color(.systemTeal))
                    .scaleEffect(CGFloat(showCircle))
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15).delay(2))
                
                //CheckMark
                Image(systemName: "checkmark")
                    .foregroundColor(Color.white)
                    .font(.system(size: 60))
                    .rotationEffect(.degrees(Double(rotateCheckmark)))
                    .clipShape(Rectangle().offset(x: CGFloat(showCheckMark)))
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15).delay(2.5))
            }
            .onLongPressGesture {
                //Final Animation Stae
                showTumb = 0
                drawRing = 1
                showCircle = 1
                rotateCheckmark = 0
                showCheckMark = 0
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
