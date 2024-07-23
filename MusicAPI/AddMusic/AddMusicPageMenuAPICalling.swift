//
//  AddMusicPageMenuAPICalling.swift
//  outgoer
//
//  Created by DREAMWORLD on 27/10/23.
//

import Foundation
//import SwiftyJSON
//import SVProgressHUD
//import DSWaveformImage

//extension AddMusicPageMenuVC {
//    func API_GetMusicCategory(page:Int,showLoader:Bool) {
//        self.isCategoryAPICalling = true
//        HttpRequestManager.shared.getRequest(requestURL: String.init(format: APIMusicCategory, page), param: [String : Any](), isShowLoader: showLoader) { error, responseDict in
//            self.isCategoryAPICalling = false
//            if error != nil, let error = error {
//                debugPrint(error.localizedDescription)
//            } else if let dicData = responseDict, dicData.keys.count > 0 {
//                if let success = dicData[kSuccess] as? Bool{
//                    if success {
//                        if page == 1 {
//                            self.arrAllCategory.removeAll()
//                        }
//                        if let arrMusicCategory = dicData[kData] as? NSArray ,arrMusicCategory.count > 0 {
//                            self.NextPageIndex = dicData["nextpage"] as? Int ?? 0
//                            for i in 0 ..< arrMusicCategory.count {
//                                self.arrAllCategory.append(ClassMusicCategory.init(json: JSON(arrMusicCategory[i])))
//                            }
//                            if page == 1 {
//                                self.selectedCategory = self.arrAllCategory.first?.id ?? 0
//                                self.API_GetMusicList(page: 1, showLoader: true)
//                            }
//                        } else {
//                            self.isLoading = true
//                        }
//                    }
//                    self.collView.reloadData()
//                }
//            }
//        }
//    }
//    
//    func API_GetMusicList(page:Int,showLoader:Bool) {
//        self.isMusicAPICalling = true
//        HttpRequestManager.shared.getRequest(requestURL: String.init(format: APIMusicList, page, searchText, selectedCategory), param: [String : Any](), isShowLoader: showLoader) { error, responseDict in
//            self.isMusicAPICalling = false
//            if error != nil, let error = error {
//                debugPrint(error.localizedDescription)
//            } else if let dicData = responseDict, dicData.keys.count > 0 {
//                if let success = dicData[kSuccess] as? Bool{
//                    if success {
//                        if page == 1 {
//                            self.arrAllMusicList.removeAll()
//                        }
//                        if let arrMusic = dicData[kData] as? NSArray ,arrMusic.count > 0 {
//                            self.NextPageIndexForMusicList = dicData["nextpage"] as? Int ?? 0
//                            for i in 0 ..< arrMusic.count {
//                                self.arrAllMusicList.append(ClassMusicDetail.init(json: JSON(arrMusic[i])))
//                            }
//                        } else {
//                            self.isLoadingForMusicList = true
//                        }
//                        self.noMusicView.isHidden = self.arrAllMusicList.count > 0
//                    }
//                    self.refreshControl.endRefreshing()
//                    self.tableView.reloadData()
//                }
//            }
//        }
//    }
//}
