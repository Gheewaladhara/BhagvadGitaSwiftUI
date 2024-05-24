//
//  ContentView.swift
//  BhagvadGita SwiftUI
//
//  Created by GHEEWALA DHARA on 24/05/24.
//

import SwiftUI


struct Details : Decodable, Identifiable
{
    var id: Int
    var name: String
    var slug: String
    var name_transliterated: String
    var name_translated: String
    var verses_count: Int
    var chapter_number: Int
    var name_meaning: String
    var chapter_summary: String
    var chapter_summary_hindi: String
}

struct ChapterDetailView: View{
    
    var chapter: Details
    let darkBrown = Color(red: 101/255, green: 67/255, blue: 33/255)
    
    var body: some View{
        
        ScrollView{
            
            VStack(alignment: .leading, spacing: 10){
//                Text(chapter.name_translated)
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(darkBrown)
//                    .padding(.bottom, 5)
                Spacer()
                
                Text("Slug :")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(darkBrown)
                Text("\(chapter.slug)")
                    .font(.system(size: 20))
                
                Spacer()
                
                Text("Name meaning :")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(darkBrown)
                Text("\(chapter.name_meaning)")
                    .font(.system(size: 20))
                    
                Spacer()
                
                Text("Chapter \(chapter.chapter_number) :")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(darkBrown)
                Text(chapter.chapter_summary)
                    .font(.system(size: 20))
                   
                Spacer()
                
                Text("Hindi summary :")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(darkBrown)
                Text("\(chapter.chapter_summary_hindi)")
                    .font(.system(size: 20))
               
                Spacer()
            }
            .padding()
            .navigationTitle(chapter.name)
//            .background(
//                Image("gita3") // Set this to the background image you want
//                    .resizable()
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
//           )
            
        }
            
    }
        
    
}





struct ContentView: View {
    
    @State var arr : [Details]? = nil
    
    var body: some View {
        
        let darkBrown = Color(red: 101/255, green: 67/255, blue: 33/255)
        
        NavigationView{
            VStack{
                if arr == nil{
                    Text("Data Fatching")
                }else{
                    List(arr!){ chapter in
                        NavigationLink(destination: ChapterDetailView(chapter: chapter)) {
                            
                            VStack(alignment: .leading) {
                                Text(chapter.name)
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(darkBrown)
                                
                                Text(chapter.name_translated)
                                    .font(.system(size: 18))
//                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
                
            }.onAppear{
                gatedata()
            }
            .navigationTitle("श्रीमद्भगवदगीता")
            
        }
        
        
    }
    
    func gatedata(){
        let link = "https://bhagavad-gita3.p.rapidapi.com/v2/chapters/"
        var url = URLRequest(url: URL(string: link)!)
        url.httpMethod = "GET"
        url.allHTTPHeaderFields = ["X-RapidAPI-Key":"8b9a8ef064msh933a37e8f6a5489p19a0e4jsn93632383cb17"]
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            do{
                if error == nil{
                    
                    if let data = data{
                        let chapters = try JSONDecoder().decode([Details].self, from: data)
                        DispatchQueue.main.async {
                            arr = chapters
                        }
                    }
                }else{
                    print(error?.localizedDescription)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}

#Preview {
    ContentView()
}
