//
//  Home.swift
//  AppPet
//
//  Created by Alvaro Cuiza on 13/2/24.
//

import SwiftUI


struct Home: View {
    @Binding var presentSideMenu: Bool
    @State var listPets: [String]
     var body: some View {
         ZStack{
             Color.colorBackground.edgesIgnoringSafeArea(.all)
             
             VStack(alignment: .leading){
                 HStack{
                     ProfileView(urlImage: "person.crop.circle", name: "Karen S", direction: "Kuta Bail, Indonesia").frame(maxWidth: .infinity,alignment:.leading).padding(.leading,20)
                     VStack{
                         Image(systemName: "bell.fill").resizable().aspectRatio(contentMode: .fill).frame(width: 20, height: 20, alignment: .leading).padding(20)
                     }.frame(width: 50,height: 50).background().cornerRadius(25).padding(20)
                 }
                 
                 
                 VStack{
                     SearchView(foreground: "Search here", urlIconSearch: "magnifyingglass", urlIconImage: "location.circle.fill").padding(.top,40)
                     Text("Category").font(.title2).fontWeight(.heavy).frame(width: 350,alignment: .leading).padding()
                     ScrollView(.horizontal){
                         HStack {
                             ForEach(listPets, id: \.self) { pet in
                                 CategoryView(name: pet)
                             }
                             
                         }
                     }
                     
                     Spacer()
                 }.frame(maxWidth: .infinity,maxHeight:.infinity).background().clipShape(RoundedCorner(radius: 60, corners: [.topLeft, .topRight]))
             }.frame(maxWidth: .infinity,maxHeight: .infinity)
            
             
         }
     }
 }
extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexValue = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexValue.hasPrefix("#") {
            hexValue.remove(at: hexValue.startIndex)
        }

        var rgbValue: UInt64 = 0
        Scanner(string: hexValue).scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
extension Color {
    static let colorBackground = Color(red: 250/255, green: 224/255, blue: 249/255)
}
struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

#Preview {
    @State var isPresenting = false
    var listPets = ["All", "Dogs","Cat","Bird","Fish","Race"]
    return Home(presentSideMenu: $isPresenting,listPets: listPets)
}
