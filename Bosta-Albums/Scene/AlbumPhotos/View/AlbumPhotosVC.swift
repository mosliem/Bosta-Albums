//
//  AlbumPhotosVC.swift
//  Bosta-Albums
//
//  Created by mohamed sliem on 13/12/2024.
//

import UIKit
import Combine
import CombineCocoa

class AlbumPhotosVC: BaseViewController<AlbumPhotosVM> {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.viewDidLoad()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        bindPhotosUpdates()
    }
    
    private func setupView() {
        setupCollectionView()
        setupSearchController()
        
        setCollectionViewPublisher()
        setSearchControllerPublisher()
        
        viewModel.$title.sink { [weak self] title in
            self?.title = title
        }
        .store(in: &cancellable)
    }
    
    private func setupCollectionView() {
        setCollectionLayout()
        
        collectionView.register(
            UINib(
                nibName: PhotoCell.identifier,
                bundle: nil
            ),
            forCellWithReuseIdentifier: PhotoCell.identifier
        )
    }
    
    private func setCollectionLayout() {
        let layout = UICollectionViewFlowLayout()
        let width = collectionView.bounds.width / 3
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = .zero
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    private func setupSearchController() {
        searchController = UISearchController()
        self.navigationItem.searchController = searchController
        self.navigationItem.preferredSearchBarPlacement = .stacked
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setCollectionViewPublisher() {
        collectionView.didSelectItemPublisher.sink { [weak self] index in
            self?.viewModel.selectedImage.send(index.item)
        }
        .store(in: &cancellable)
    }
    
    private func setSearchControllerPublisher() {
        searchController
            .searchBar
            .textDidChangePublisher
            .assign(to: \.searchText , on: viewModel)
            .store(in: &cancellable)
        
        searchController
            .searchBar
            .cancelButtonClickedPublisher
            .assign(to: &viewModel.$searchBehaviorEnd)
    }
    
    private func bindPhotosUpdates() {
        viewModel.updatePhotos.sink { [weak self] state in
            self?.collectionView.reloadData()
        }
        .store(in: &cancellable)
    }

}
