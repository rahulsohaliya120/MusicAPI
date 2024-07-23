//
//  AddMusicPageMenuTableView.swift
//  outgoer
//
//  Created by DREAMWORLD on 27/10/23.
//

import UIKit
//import SVProgressHUD

extension AddMusicPageMenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrAllMusicList.count
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicListTableViewCell", for: indexPath) as! MusicListTableViewCell
        cell.playMusic.tag = indexPath.row
//        cell.audioUrl = arrAllMusicList[indexPath.row].songFile ?? ""
//        cell.audioUrl = 
//        cell.musicTitleLbl.text = arrAllMusicList[indexPath.row].songTitle
        cell.musicTitleLbl.text = "Heeriye"
//        if arrAllMusicList[indexPath.row].artists != "" {
            cell.musicSingerLbl.isHidden = false
//            cell.musicSingerLbl.text = arrAllMusicList[indexPath.row].artists
            cell.musicSingerLbl.text = "Arjit Singh"
//        } else {
//            cell.musicSingerLbl.isHidden = true
//        }
//        cell.profileImage.sd_setImage(with: URL(string: arrAllMusicList[indexPath.row].songImage ?? ""), placeholderImage: UIImage(named: ImageNames.musicImagePlaceholder.rawValue))
        
        cell.profileImage.image = UIImage(named: "ic_music_placeholder")
        
        cell.onPlay = { [weak self] index in
            if self?.selectedTimerIndex != index {
                self?.updateCellTimer()
                self?.selectedTimerIndex = index
            }
            if cell.timer == nil {
                cell.shapeLayer.isHidden = false
                cell.playSound()
            } else {
                cell.shapeLayer.isHidden = true
                cell.stopTimer()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let audioUrl = URL(string: arrAllMusicList[indexPath.row].songFile ?? "") {
//            if isFromStory {
//                self.dismiss(animated: true) {
//                    self.delegate?.selectedMusic(indexPath: self.indexPath, objMusic: self.arrAllMusicList[indexPath.row])
//                }
//            } else {
////                let vc = loadVC(strStoryboardId: SB_NEWPOST, strVCId: idEditAudioVC) as! EditAudioVC
////                vc.url = self.videoUrl
////                vc.vdoDur = self.duration
////                vc.objMusic = self.arrAllMusicList[indexPath.row]
////                vc.audioUrl = audioUrl
////                print("Audio URL", audioUrl)
////                vc.contentType = self.contentType
////                AppDelgate.appNavigation?.pushViewController(vc, animated: true)
//            }
//        }
    }
    
    func updateCellTimer() {
        if let cell = tableView.cellForRow(at: IndexPath(row: selectedTimerIndex, section: 0)) as? MusicListTableViewCell {
            cell.playMusic.setImage(UIImage(named: "ic_post_play"), for: .normal)
            cell.progressLayer.isHidden = true
            cell.player?.pause()
            cell.timer?.invalidate()
            cell.shapeLayer.isHidden = true
            cell.stopTimer()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row == self.arrAllMusicList.count - 3 && !self.isLoadingForMusicList && !self.isMusicAPICalling {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
////                self.API_GetMusicList(page: self.NextPageIndexForMusicList, showLoader: false)
//            }
//        }
    }
}

//extension AddMusicPageMenuVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return arrAllCategory.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCategoryCollectionViewCell", for: indexPath) as! MusicCategoryCollectionViewCell
//        cell.categoryLbl.text = arrAllCategory[indexPath.row].categoryName
//        UIView.animate(withDuration: .nan, delay: 0.3) {
//            cell.indicatorLbl.isHidden = self.selectedCategory != self.arrAllCategory[indexPath.row].id
//        }
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if selectedCategory != arrAllCategory[indexPath.row].id {
//            selectedCategory = arrAllCategory[indexPath.row].id ?? 0
//            isLoadingForMusicList = false
//            NextPageIndexForMusicList = 1
//            isMusicAPICalling = false
////            API_GetMusicList(page: 1, showLoader: true)
//            collectionView.reloadData()
//            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//            self.updateCellTimer()
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if indexPath.row + 1 == self.arrAllCategory.count && !self.isLoading && !self.isCategoryAPICalling {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                if self.collView.visibleCells.contains(cell) {
//                    DispatchQueue.main.async { [self] in
////                        self.API_GetMusicCategory(page: NextPageIndex, showLoader: false)
//                    }
//                }
//            }
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let tag = arrAllCategory[indexPath.item].categoryName ?? ""
//        let tagsize = tag.size(withAttributes:[.font: UIFont.systemFont(ofSize: 14.0)])
//        return CGSize(width: (tagsize.width) + 16, height: collectionView.frame.height)
//    }
//}
