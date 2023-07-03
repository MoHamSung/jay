//
//  MainView.swift
//  act4
//
//  Created by Jay on 2023/06/23.
//

import SwiftUI

struct MainView: View {
    @State var scrollViewHeight = 0.0
    @State var deviceHeight = 0.0
    @State var purchaseViewHeight = 0.0
    @State var shareViewHeight = 0.0
    @State var currentScrollPosition = 0.0
    @State var targetPosition = 0.0
    @State var isNavigationBtnActive = true
    
    var body: some View {
        ZStack {
            (isNavigationBtnActive ? Color("ColorBgBlack") : Color("ColorBgGray"))
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20){
                    VStack(spacing: 20){
                        ProductPreview()
                        
                        ContentAreaView()
                            .padding(.horizontal, 20)
                    }
                    .background(Color("ColorBgBlack"))
                    
                    VStack(spacing: 20) {
                        MoreInformationView()
                        PurchaseView()
                            .background(
                                GeometryReader { proxy in
                                    Color("ColorBgGray")
                                        .onAppear {
                                        purchaseViewHeight = proxy.size.height
                                        print("구매 뷰: \(purchaseViewHeight)")
                                        targetPosition = scrollViewHeight - shareViewHeight - purchaseViewHeight
                                        print("tarket = \(targetPosition)")
                                    }
                                }
                            )
                        ShareView()
                            .background(
                                GeometryReader { proxy in
                                    Color("ColorBgGray")
                                        .ignoresSafeArea()
                                        .onAppear {
                                            shareViewHeight = proxy.size.height
                                            print("바텀 뷰: \(shareViewHeight)")
                                        }
                                }
                            )
                    }.background(Color("ColorBgGray"))
                    
                }
                .overlay(
                    GeometryReader { geo in
                        Color.clear
                            .ignoresSafeArea()
                            .preference(
                                key: OffsetPreferenceKey.self,
                                value: geo.frame(in: .named("scrollView")).origin.y
                            )
                            .onAppear() {
                                scrollViewHeight = geo.size.height
                                print("스크롤뷰 :\(scrollViewHeight)")
                            }
                    }
                )
                
            }
            .coordinateSpace(name: "scrollView")
            .onPreferenceChange(OffsetPreferenceKey.self) { value in
                currentScrollPosition = value - deviceHeight
                print("Scroll Position: \(currentScrollPosition)")
                if currentScrollPosition > -(targetPosition){
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5)){
                        isNavigationBtnActive = true
                    }
                }
                else {
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5)){
                        isNavigationBtnActive = false
                    }
                }
            }
            .ignoresSafeArea()
            
            VStack{
                Spacer()
                NavigationButton()
                    .padding(.horizontal, 16)
                    .padding(.bottom, 70)
                    .offset(y: isNavigationBtnActive ? 0 : 200)
            }
            .ignoresSafeArea()
        }
        .background(
            GeometryReader { proxy in
                Color.clear
                    .onAppear {
                        deviceHeight = proxy.size.height + proxy.safeAreaInsets.top + proxy.safeAreaInsets.bottom + 20
                        print("디바이스 높이: \(deviceHeight)")
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5)){
                            isNavigationBtnActive = true
                        }
                        print("UIScreen.main.focusedView?.safeAreaInsets.top: \(UIApplication.shared.windows.first(where: {$0.isKeyWindow})?.safeAreaInsets)")
                    }
                    .ignoresSafeArea()
            }
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
