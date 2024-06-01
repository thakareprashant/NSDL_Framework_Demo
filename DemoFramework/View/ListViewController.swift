//
//  ListViewController.swift
//  DemoFramework
//
//  Created by Apple on 01/06/24.
//

import UIKit
public protocol passDataFromFramework:AnyObject{
    
    
    func getResultData(email:String)
}
public class ListViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    public weak var delegate:passDataFromFramework?
    var viewModel = ListViewModel()
    public override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        viewModel.getList { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
        // Do any additional setup after loading the view.
    }
    func registerCells(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: ListTableViewCell.identifier, bundle: Bundle(for:ListViewController.self)), forCellReuseIdentifier: ListTableViewCell.identifier)
    }

    @IBAction func didTapBAckToApp(_ sender: UIButton) {
        delegate?.getResultData(email: viewModel.listModel?.data.first?.email ?? "")
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ListViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listModel?.data.count ?? 0
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier) as? ListTableViewCell else{
            return UITableViewCell()
        }
        if let model = viewModel.listModel?.data[indexPath.row]{
            cell.configure(with: model)
        }
       
        return cell
    }
}
