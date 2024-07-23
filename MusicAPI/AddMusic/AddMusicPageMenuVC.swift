//
//  AddMusicPageMenuVC.swift
//  outgoer
//
//  Created by DREAMWORLD on 25/10/23.
//

import UIKit
import AVFoundation
//import SVProgressHUD

protocol DelegateSelectedMusic {
//    func selectedMusic(indexPath: IndexPath, objMusic: ClassMusicDetail)
}

class AddMusicPageMenuVC: UIViewController {

    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var noMusicView: UIView!
    
    var isLoading = false
    var refreshControl = UIRefreshControl()
    var NextPageIndex = 1
    var isLoadingForMusicList = false
    var NextPageIndexForMusicList = 1
//    var arrAllCategory = [ClassMusicCategory]()
    var selectedCategory = 0
    var searchText = ""
//    var arrAllMusicList = [ClassMusicDetail]()
    var selectedTimerIndex = 0
    var videoUrl: URL?
    var duration: Double = 0.0
//    var isFromPost = false
    var isSongSelected = false
    var downloadTask: URLSessionDownloadTask?
//    var contentType: ContentType = .Post
    var isFromStory = false
    var indexPath: IndexPath!
    var delegate: DelegateSelectedMusic?
    var isCategoryAPICalling = false
    var isMusicAPICalling = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        API_GetMusicCategory(page: 1, showLoader: false)
        self.searchTF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        self.refreshControl.addTarget(self, action: #selector(self.reload), for: .valueChanged)
        self.tableView.addSubview(refreshControl)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        updateCellTimer()
    }
     
    @IBAction func btnBack_Clk(_ sender: UIButton) {
        if isFromStory {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

//MARK: - textfield delegate
extension AddMusicPageMenuVC: UITextFieldDelegate {
    @objc func textFieldDidChange(textField: UITextField){
        searchText = textField.text ?? ""
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reload), object: nil)
        self.perform(#selector(self.reload), with: nil, afterDelay: 0.5)
    }
    
    @objc func reload() {
        isLoadingForMusicList = false
        NextPageIndexForMusicList = 1
        isMusicAPICalling = false
//        API_GetMusicList(page: 1, showLoader: true)
    }
}
