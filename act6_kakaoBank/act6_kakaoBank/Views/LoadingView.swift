//
//  LoadingView.swift
//  act6_kakaoBank
//
//  Created by Jay on 2023/08/28.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
//        GrowingArcIndicatorView(color: .kakaoBlue300, lineWidth: 1)
        GradientIndicatorView(colors: [.white, .kakaoBlue300], lineCap: .round, lineWidth: 4)
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

struct DefaultIndicatorView: View {

    let count: Int

    public var body: some View {
        GeometryReader { geometry in
            ForEach(0..<count, id: \.self) { index in
                DefaultIndicatorItemView(index: index, count: count, size: geometry.size)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct DefaultIndicatorItemView: View {

    let index: Int
    let count: Int
    let size: CGSize

    @State private var opacity: Double = 0

    var body: some View {
        let height = size.height / 3.2
        let width = height / 2
        let angle = 2 * .pi / CGFloat(count) * CGFloat(index)
        let x = (size.width / 2 - height / 2) * cos(angle)
        let y = (size.height / 2 - height / 2) * sin(angle)

        let animation = Animation.default
            .repeatForever(autoreverses: true)
            .delay(Double(index) / Double(count) / 2)

        return RoundedRectangle(cornerRadius: width / 2 + 1)
            .frame(width: width, height: height)
            .rotationEffect(Angle(radians: Double(angle + CGFloat.pi / 2)))
            .offset(x: x, y: y)
            .opacity(opacity)
            .onAppear {
                opacity = 1
                withAnimation(animation) {
                    opacity = 0.3
                }
            }
    }
}

struct ArcsIndicatorView: View {

    let count: Int
    let lineWidth: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<count, id: \.self) { index in
                ArcsIndicatorItemView(lineWidth: lineWidth, index: index, count: count, size: geometry.size)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct ArcsIndicatorItemView: View {

    let lineWidth: CGFloat
    let index: Int
    let count: Int
    let size: CGSize

    @State private var rotation: Double = 0

    var body: some View {
        let animation = Animation.default
            .speed(Double.random(in: 0.2...0.5))
            .repeatForever(autoreverses: false)

        return Group { () -> Path in
            var p = Path()
            p.addArc(center: CGPoint(x: size.width / 2, y: size.height / 2),
                     radius: size.width / 2 - CGFloat(index) * CGFloat(count),
                     startAngle: .degrees(0),
                     endAngle: .degrees(Double(Int.random(in: 120...300))),
                     clockwise: true)
            return p.strokedPath(.init(lineWidth: lineWidth))
        }
        .frame(width: size.width, height: size.height)
        .rotationEffect(.degrees(rotation))
        .onAppear {
            rotation = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                withAnimation(animation) {
                    rotation = 360
                }
            }
        }
    }
}

struct GrowingArcIndicatorView: View {

    let color: Color
    let lineWidth: CGFloat
    
    @State private var animatableParameter: Double = 0

    public var body: some View {
        let animation = Animation
            .easeIn(duration: 2)
            .repeatForever(autoreverses: false)
        
        return GrowingArc(p: animatableParameter)
            .stroke(color, lineWidth: lineWidth)
            .onAppear {
                animatableParameter = 0
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    withAnimation(animation) {
                        animatableParameter = 1
                    }
                }
            }
    }
}

struct GrowingArc: Shape {

    var maxLength = 2 * Double.pi - 0.7
    var lag = 0.35
    var p: Double

    var animatableData: Double {
        get { return p }
        set { p = newValue }
    }

    func path(in rect: CGRect) -> Path {

        let h = p * 2
        var length = h * maxLength
        if h > 1 && h < lag + 1 {
            length = maxLength
        }
        if h > lag + 1 {
            let coeff = 1 / (1 - lag)
            let n = h - 1 - lag
            length = (1 - n * coeff) * maxLength
        }

        let first = Double.pi / 2
        let second = 4 * Double.pi - first

        var end = h * first
        if h > 1 {
            end = first + (h - 1) * second
        }

        let start = end + length

        var p = Path()
        p.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.width/2),
                 radius: rect.size.width/2,
                 startAngle: Angle(radians: start),
                 endAngle: Angle(radians: end),
                 clockwise: true)
        return p
    }
}


struct GradientIndicatorView: View {

    let colors: [Color]
    let lineCap: CGLineCap
    let lineWidth: CGFloat

    @State private var rotation: Double = 0

    var body: some View {
        let gradientColors = Gradient(colors: colors)
        let conic = AngularGradient(gradient: gradientColors, center: .center, startAngle: .zero, endAngle: .degrees(360))

        let animation = Animation
            .linear(duration: 1.5)
            .repeatForever(autoreverses: false)

        return ZStack {
            Circle()
                .stroke(colors.first ?? .white, lineWidth: lineWidth)

            Circle()
                .trim(from: lineWidth / 500, to: 1 - lineWidth / 100)
                .stroke(conic, style: StrokeStyle(lineWidth: lineWidth, lineCap: lineCap))
                .rotationEffect(.degrees(rotation))
                .onAppear {
                    rotation = 0
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                        withAnimation(animation) {
                            rotation = 360
                        }
                    }
                }
        }
    }
}
