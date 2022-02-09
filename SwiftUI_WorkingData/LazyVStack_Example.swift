//
//  LazyVStack_Example.swift
//  SwiftUI_WorkingData
//
//  Created by 김우성 on 2022/02/09.
//

import SwiftUI

struct Food: Identifiable {
    let id = UUID()
    var name: String
    var price: String
}


struct LazyVStack_Example: View {
    // State 프로퍼티를 선언한다.
    @State private var food = [
        Food(name: "대방어", price: "33000"),
        Food(name: "갈비찜", price: "50000"),
        Food(name: "신선로", price: "70000"),
        Food(name: "베이징덕", price: "100000")
    ]
    
    @State private var selectedMenuID: UUID?
    
    var body: some View {
            // PopupView를 나타내기 위한 ZStack
            // 추후에 조건문에 따라서 Z축 방향으로 View를 쌓아야한다.
            ZStack {
                ScrollView {
                    LazyVStack {
                        
                        // Title and Subtitle Text
                        headerView
                            .padding(.top, 25)
                        
                        // description Text
                        descView
                            .padding(.top, 10)
                        
                        ForEach(food) { menu in
                            HStack {
                                Text("\(menu.name) \(menu.price)원")
                                Spacer()
                                Image(systemName: "pencil.circle")
                                    .foregroundColor(.blue)
                            }
                            .padding()
                            .onTapGesture {
                                // State 프로퍼티에 값을 할당하여 re-rendering한다.
                                selectedMenuID = menu.id
                            }
                        }
                    }
                }
                
                // re-rendering 시, 옵셔널해제를 하면서, Zstack에 해당 View를 추가한다.
                if let id = selectedMenuID {
                    EditMenuPopupView(
                        food: $food[$food.firstIndex(where: { person in
                        person.id == id
                    })!], id: $selectedMenuID)
                }
            }
    }
}

struct LazyVStack_Example_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStack_Example()
    }
}



extension LazyVStack_Example {
    var headerView: some View {
        HStack {
            HeaderView(
                title: "우노의 심야식당",
                subTitle: "Binding with LazyVStack")
            Spacer()
        }
    }
    
    var descView: some View {
        HStack {
            Spacer()
            Text("@State - @Bidning을 통한\n 양방향 바인딩을 연습해봅시다.")
                .font(.system(size: 22, weight: .medium, design: .rounded))
                .bold()
            Spacer()
        }
        .padding(.vertical, 20)
        .background(Color.yellow)
    }
}

struct HeaderView: View {
    
    var title: String
    var subTitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(.title, design: .rounded))
                .bold()
            Text(subTitle)
                .font(.system(.title2, design: .rounded))
                .fontWeight(.medium)
                .foregroundColor(.gray)
        }
        .padding(.leading, 10)
    }
}


