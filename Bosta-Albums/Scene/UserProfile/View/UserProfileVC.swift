//
//  UserProfileVC.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import UIKit
import CombineCocoa

class UserProfileVC: BaseViewController<UserProfileViewModel> {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noAlbumsLayer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func bindViewModel() {
        super.bindViewModel()

        bindUserInfo()
        bindTableViewSelection()
        bindAlbumUpdates()
        bindNoAlbumsState()
        
    }

    // MARK: - Private Binding Methods
    
    private func bindUserInfo() {
        viewModel.userInfo
            .sink { [weak self] user in
                self?.nameLabel.text = user.name
                self?.addressLabel.text = user.getFullAddress()
            }
            .store(in: &cancellable)
    }

    private func bindTableViewSelection() {
        tableView
            .didSelectRowPublisher
            .sink { [weak self] indexPath in
                self?.viewModel.didPressAlbum(at: indexPath.row)
                self?.tableView.deselectRow(at: indexPath, animated: true)
            }
            .store(in: &cancellable)
    }

    private func bindAlbumUpdates() {
        viewModel.updateAlbums
            .sink { [weak self] reload in
                self?.tableView.reloadData()
            }
            .store(in: &cancellable)
        
    }
    
    private func bindNoAlbumsState() {
        viewModel.noAlbums.sink { [weak self] showLayer in
            self?.noAlbumsLayer.isHidden = !showLayer
        }
        .store(in: &cancellable)
    }
    
    private func setupTableView() {
        tableView.register(
            UINib(
                nibName: AlbumCell.identifier,
                bundle: nil
            ),
            forCellReuseIdentifier: AlbumCell.identifier
        )
    }
}
