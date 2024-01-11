import SwiftUI

struct ContentView: View {
    let colors = ColorModel.colors
    
    @State private var selectedColor: ColorModel?
    @Namespace private var animation

    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    ScrollView {
                        HColors
                        Divider()
                        VColors
                    }.navigationTitle("@MAAlsaleh0")
                }
            }.accentColor(.primary)
            StoryView
        }
    }

    // Horizontal Colors
    var HColors: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(colors) { color in
                    ZStack {
                        RoundedRectangle(cornerRadius: 1000)
                            .fill(color.color)
                            .matchedGeometryEffect(id: color.id, in: animation)
                        Text(color.colorName)
                            .matchedGeometryEffect(id: color.colorName, in: animation)
                    }
                    .frame(width: 80, height: 80)
                    .onTapGesture {
                        withAnimation {
                            self.selectedColor = color
                        }
                    }
                }
            }.padding()
        }
    }

    // Vertical Colors
    var VColors: some View {
        VStack(spacing: 15) {
            ForEach(colors) { color in
                NavigationLink {
                    ZStack {
                        color.color.ignoresSafeArea()
                        Text(color.colorName)
                    }.navigationBarTitle(Text(color.colorName), displayMode: .inline)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(color.color)
                        Text(color.colorName)
                    }.frame(height: 200)
                }
            }
        }.padding()
    }
    
    // Story View
    var StoryView : some View {
        ZStack {
            if let selectedColor = selectedColor {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(selectedColor.color)
                        .matchedGeometryEffect(id: selectedColor.id, in: animation)
                    Text(selectedColor.colorName)
                        .matchedGeometryEffect(id: selectedColor.colorName, in: animation)
                }
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        self.selectedColor = nil
                    }
                }
                .transition(.opacity)
            }
        }
    }
}


#Preview {
    ContentView()
}
