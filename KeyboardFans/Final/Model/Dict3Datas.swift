//
//  Dict3Datas.swift
//  Final
//
//  Created by 張明璿 on 2022/3/15.
//
 
import Foundation
import SwiftUI

//struct DictionaryData{
//   var keycaps: Keycap
//   var switches: Switch
//   var sizes: Size
//   var brands: Brand
//}


 
let capHeaderUrl = ["https://i.imgur.com/JwMnX0i.jpg","https://i.imgur.com/NrZ59Uf.jpg","https://i.imgur.com/tBpiMQT.jpg","https://i.imgur.com/Vq8EJFQ.jpg"]
let capHeaderUrl3 = ["https://i.imgur.com/TtZ5gZM.jpg","https://i.imgur.com/NrZ59Uf.jpg","https://i.imgur.com/tBpiMQT.jpg","https://i.imgur.com/Vq8EJFQ.jpg"]


let capProfileUrl = ["https://i.imgur.com/kZVymQx.jpg","https://i.imgur.com/fSZoqs4.jpg","https://i.imgur.com/mdFA3Dd.jpg"]
let capProfileName = ["Cherry原廠高度","DSA高度","SA高度"]
let capProfileDescription = ["Cherry公司是早期最有名的軸體廠商，依照Cherry鍵帽外形、高度、角度等設計製造的鍵帽就稱為Cherry原廠高度。目前有Leopold 、Varmilo等大廠採用。","球帽外型更加圓潤復古，表面有點內凹更符合手指打字時的人體工學設計，DSA又稱為矮球帽，特色是高度一樣因此鍵帽可替代的相容性最佳。","球帽外型更加圓潤復古，表面有點內凹更符合手指打字時的人體工學設計，SA又稱為高球帽，適合搭配手托一同使用。"]
 
//OEM高度主要指的是台灣代工或自有品牌， 依照台灣代工製造的鍵帽外形、高度、角度等設計製造的鍵帽， Filco、Ducky、Leopold等各大知名廠商大多數均採用此高度。
let capMaterialUrl = ["https://image.made-in-china.com/2f0j00pSjtsMJKLIqa/Neat-Resin-Polybutylene-Terephthalate-PBT.jpg","https://3.imimg.com/data3/JR/VY/MY-11757662/abs-plastic-raw-material-250x250.jpeg","https://images.twgreatdaily.com/images/image/3ca/3ca008a92669a15180798932cd0a47d5.jpg"]
let capMaterialName = ["PBT","ABS","POM"]
let capMaterialDescription = ["PBT耐磨","ABS顏色鮮豔","POM很貴"]
 
let capProcessUrl = ["https://i.pinimg.com/originals/12/8f/4b/128f4b014097a82005f5d91f6c4d2b63.jpg","https://upload.wikimedia.org/wikipedia/commons/5/59/Two-shot_injection_molded_keycaps.jpg","https://i.ebayimg.com/images/g/2IMAAOSwEZpc1kHN/s-l400.jpg"]
let capProcessName = ["熱昇華","二色成形","雷射雕刻"]
let capProcessDescription = ["適合精細字體或圖案","由模具注塑製造","雷射雕刻在鍵帽表面，容易磨損"]
 
let capFontUrl = ["","",""]
let capFontName = ["","",""]
let capFontDescription = ["","",""]
 
let switchCherryUrl = ["","",""]
let switchCherryName = ["","",""]
let switchCherryDescription = ["","",""]
let switchGateronUrl = ["","",""]
let switchGateronName = ["","",""]
let switchGateronDescription = ["","",""]
let switchTTCUrl = ["","",""]
let switchTTCName = ["","",""]
let switchTTCDescription = ["","",""]
let switchKailhUrl = ["","",""]
let switchKailhName = ["","",""]
let switchKailhDescription = ["","",""]
 
let size60Url = ["","",""]
let size60Name = ["","",""]
let size60Description = ["","",""]
let size80Url = ["","",""]
let size80Name = ["","",""]
let size80Description = ["","",""]
let size98Url = ["","",""]
let size98Name = ["","",""]
let size98Description = ["","",""]
let size100Url = ["","",""]
let size100Name = ["","",""]
let size100Description = ["","",""]
 
let brandDuckyUrl = ["https://i.imgur.com/1JzAk0s.jpg","https://i.imgur.com/EyUb8Fi.jpg","https://i.imgur.com/AzExxPX.jpg"]
let brandDuckyName = ["Ducky 60%","Ducky 80%","Ducky 100%"]
let brandDuckyDescription = ["體積最小，功能鍵需要用組合鍵觸發，方便攜帶。","少了數字區的配列，也叫做TKL，適合辦公使用。","全版配置適合遊戲或寬敞環境使用。"]
let brandLeopoldUrl = ["","",""]
let brandLeopoldName = ["","",""]
let brandLeopoldDescription = ["","",""]
let brandFilcoUrl = ["","",""]
let brandFilcoName = ["","",""]
let brandFilcoDescription = ["","",""]
let brandVarmiloUrl = ["","",""]
let brandVarmiloName = ["","",""]
let brandVarmiloDescription = ["","",""]
 
let CapUrl = [capProfileUrl,capMaterialUrl,capProcessUrl,capFontUrl]
let SwitchUrl = [switchCherryUrl,switchGateronUrl,switchKailhUrl,switchTTCUrl]
let SizeUrl = [size60Url,size80Url,size98Url,size100Url]
let BrandUrl = [brandDuckyUrl,brandLeopoldUrl,brandFilcoUrl,brandVarmiloUrl]
let UrlFather = [CapUrl,SwitchUrl,SizeUrl,BrandUrl]
let CapName = [capProfileName,capMaterialName,capProcessName,capFontName]
let SwitchName = [switchCherryName,switchGateronName,switchKailhName,switchTTCName]
let SizeName = [size60Name,size80Name,size98Name,size100Name]
let BrandName = [brandDuckyName,brandLeopoldName,brandFilcoName,brandVarmiloName]
let NameFather = [CapName,SwitchName,SizeName,BrandName]
let CapDescription = [capProfileDescription,capMaterialDescription,capProcessDescription,capFontDescription]
let SwitchDescription = [switchCherryDescription,switchGateronDescription,switchKailhDescription,switchTTCDescription]
let SizeDescription = [size60Description,size80Description,size98Description,size100Description]
let BrandDescription = [brandDuckyDescription,brandLeopoldDescription,brandFilcoDescription,brandVarmiloDescription]
let DescriptionFather = [CapDescription,SwitchDescription,SizeDescription,BrandDescription]
 
//AllData{}
//AllData.Keycap.profile.url

//
//struct Keycap{
//    var profile: Profile
//    var material: Material
//    var process: Process
//    var font: Font
//}
//
//struct Switch{
//    var cherry: Cherry
//    var gateron: Gateron
//    var ttc: TTC
//    var kailh: Kailh
//}
//struct Size{
//    var size60: Size60
//    var size80: Size80
//    var size98: Size98
//    var size100: Size100
//}
//struct Brand{
//    var ducky: Ducky
//    var leopold: Leopold
//    var filco: Filco
//    var varmilo: Varmilo
//}
//
//
//struct Profile {
//    var url: [String]
//    var name: [String]
//    var description: [String]
//}
//var profile = Profile(url: capProfileUrl, name: capProfileName, description: capProfileDescription)
//struct Material{
//    var url: [String]
//    var name: [String]
//    var description: [String]
//}
//var material = Material(url: capMaterialUrl, name: capMaterialName, description: capMaterialDescription)
//struct Process{
//    var url: [String]
//    var name: [String]
//    var description: [String]
//}
//var process = Process(url: capProfileUrl, name: capProfileName, description: capProfileDescription)
//struct Font{
//    var url: [String]
//    var name: [String]
//    var description: [String]
//}
//var font = Font(url: capFontUrl, name: capFontName, description: capFontDescription)
//
//struct Cherry{
//    var url: [String]
//    var name: [String]
//    var description: [String]
//}
//var cherry = Cherry(url: switchCherryUrl, name: switchCherryUrl, description: switchCherryDescrtption)
//struct Gateron{
//    var url: [String]
//    var name: [String]
//    var description: [String]
//}
//var gateron = Gateron(url: switchGateronUrl, name: switchGateronName, description: switchGateronDescrtption)
//struct TTC{
//    var url: [String]
//    var name: [String]
//    var description: [String]
//}
//var ttc = TTC(url: switchTTCUrl, name: switchTTCName, description: switchTTCDescrtption)
//struct Kailh{
//    var url: [String]
//    var name: [String]
//    var description: [String]
//}
//var kailh = Kailh(url: switchKailhUrl, name: switchKailhName, description: switchKailhDescrtption)
//struct Size60{
//    var url: [String]
//    var name: [String]
//    var description: [String]
//}
//var size60 = Size60(url: size60Url, name: size60Name, description: size60Descrtption)
//struct Size80{
//    var url: [String]
//    var name: [String]
//    var description: [String]
//}
//var size80 = Size80(url: size80Url, name: size80Name, description: size80Descrtption)
//struct Size98{
//    var url: [String]
//    var name: [String]
//    var description: [String]
//}
//var size98 = Size98(url: size98Url, name: size98Name, description: size98Descrtption)
//struct Size100{
//    var url: [String]
//    var name: [String]
//    var description: [String]
//}
//var size100 = Size100(url: size100Url, name: size100Name, description: size100Descrtption)
//struct Ducky{
//    var url: [String]
//    var name: [String]
//    var description: [String]
//}
//var ducky = Ducky(url: brandDuckyUrl, name: brandDuckyName, description: brandDuckyDescrtption)
//struct Leopold{
//    var url: [String]
//    var name: [String]
//    var description: [String]
//}
//var leopold = Leopold(url:brandLeopoldUrl, name: brandLeopoldName, description: brandLeopoldDescrtption)
//struct Filco{
//    var url: [String]
//    var name: [String]
//    var description: [String]
//}
//var filco = Filco(url: brandFilcoUrl, name: brandFilcoName, description: brandFilcoDescrtption)
//struct Varmilo{
//    var url: [String]
//    var name: [String]
//    var description: [String]
//}
//var varmilo = Varmilo(url: brandVarmiloUrl, name: brandVarmiloName, description: brandVarmiloDescrtption)
//
//var keycapData = Keycap(profile: profile, material: material, process: process, font: font)
//var switchData = Switch(cherry: cherry, gateron: gateron, ttc: ttc, kailh: kailh)
//var sizeData = Size(size60: size60, size80: size80, size98: size98, size100: size100)
//var brandData = Brand(ducky: ducky, leopold: leopold, filco: filco, varmilo: varmilo)
//
//var dictionaryData = DictionaryData(keycaps: keycapData, switches: switchData, sizes: sizeData, brands: brandData)
