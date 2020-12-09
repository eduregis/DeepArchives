//
//  AspectsViewController.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 25/11/20.
//
import UIKit

class AspectsViewController: UIViewController, UITextFieldDelegate {

	private let aspectsViewPresenter = AspectsPresenter()
	
	var isEditEnabled: Bool = false
    
   
    
    lazy var configButton: ConfigButton = {
        let cfgBtn = ConfigButton()
        cfgBtn.addTarget(self, action: #selector(goToConfigurations), for: .touchUpInside)
        return cfgBtn
    }()
    
    @objc func goToConfigurations() {
        let configScreen = ConfigViewController()
        self.navigationController?.pushViewController(configScreen, animated: true)
    }
    
	lazy var headerButtons: HeaderButtons = {
		let header = HeaderButtons()
		header.editButton.addTarget(self, action: #selector(self.enterEditing), for: .touchUpInside)
		header.cancelButton.addTarget(self, action: #selector(self.cancelEditing), for: .touchUpInside)
		header.confirmButton.addTarget(self, action: #selector(self.confirmEditing), for: .touchUpInside)
		header.translatesAutoresizingMaskIntoConstraints = false
		return header
	}()
	
	lazy var attributesInformation: AttributesView = {
		let attributes = AttributesView()
		attributes.translatesAutoresizingMaskIntoConstraints = false
		return attributes
	}()
	
	lazy var pointsView: GroupPointsView = {
		let points = GroupPointsView()
		points.translatesAutoresizingMaskIntoConstraints = false
		return points
	}()

	lazy var statesView: GroupStatesView = {
		let states = GroupStatesView()
		states.translatesAutoresizingMaskIntoConstraints = false
		return states
	}()
	
	lazy var scrollingView: UIScrollView = {
		let scroll = UIScrollView()
		scroll.translatesAutoresizingMaskIntoConstraints = false
		scroll.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
		scroll.showsVerticalScrollIndicator = false
		self.view.addSubview(scroll)
		return scroll
	}()
	
	lazy var dimmingOverlay: UIButton = {
		let dim = UIButton()
		dim.translatesAutoresizingMaskIntoConstraints = false
		dim.backgroundColor = .black
		dim.layer.opacity = 0
		dim.addTarget(self, action: #selector(self.dismissAlert), for: .touchUpInside)
		self.view.addSubview(dim)
		return dim
	}()
	
	lazy var diceAlert: DiceAlert = {
		let alert = DiceAlert(test: "", roll: "d100")
		alert.translatesAutoresizingMaskIntoConstraints = false
		alert.layer.backgroundColor = UIColor.backgroundBlack.cgColor
		alert.layer.opacity = 0
		alert.okButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
		self.view.addSubview(alert)
		return alert
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setTitle(LocalizedStrings.investigators, for: .normal)
        button.tintColor = UIColor.ivory
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: configButton)
        self.navigationController?.navigationBar.setNavigationBarStyle()
		self.hideKeyboardWhenTappedAround()
		additionalConfigurations()
	}
    
    @objc func backAction() {
        self.tabBarController?.navigationController?.popViewController(animated: true)
    }
	
	private func additionalConfigurations() {
		attributesInformation.setAllTextFieldDelegates(with: self)
		pointsView.setAllTextFieldDelegates(with: self)
		
		configureLayout()
		
		pointsView.updatePointsValues(with: aspectsViewPresenter.getPoints())
		
		attributesInformation.changeAllCharacteristicValues(with: aspectsViewPresenter.getCharacteristics())
		
		view.backgroundColor = .backgroundBlack
		
		attributesInformation.strView.addTarget(self, action: #selector(triggerCharacteristicRoll), for: .touchUpInside)
		attributesInformation.dexView.addTarget(self, action: #selector(triggerCharacteristicRoll), for: .touchUpInside)
		attributesInformation.intView.addTarget(self, action: #selector(triggerCharacteristicRoll), for: .touchUpInside)
		attributesInformation.conView.addTarget(self, action: #selector(triggerCharacteristicRoll), for: .touchUpInside)
		attributesInformation.appView.addTarget(self, action: #selector(triggerCharacteristicRoll), for: .touchUpInside)
		attributesInformation.powView.addTarget(self, action: #selector(triggerCharacteristicRoll), for: .touchUpInside)
		attributesInformation.sizView.addTarget(self, action: #selector(triggerCharacteristicRoll), for: .touchUpInside)
		attributesInformation.eduView.addTarget(self, action: #selector(triggerCharacteristicRoll), for: .touchUpInside)
		attributesInformation.movView.addTarget(self, action: #selector(triggerCharacteristicRoll), for: .touchUpInside)
		
		pointsView.luckView.diceButton.addTarget(self, action: #selector(self.triggerPointsRoll), for: .touchUpInside)
		pointsView.sanityView.diceButton.addTarget(self, action: #selector(self.triggerPointsRoll), for: .touchUpInside)
	}
	
	private func configureLayout() {
		scrollingView.addSubview(headerButtons)
		scrollingView.addSubview(attributesInformation)
		scrollingView.addSubview(pointsView)
		scrollingView.addSubview(statesView)
		
		NSLayoutConstraint.activate([
			scrollingView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
			scrollingView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
			scrollingView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
			scrollingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
			
			headerButtons.topAnchor.constraint(equalTo: scrollingView.topAnchor, constant: 0),
			headerButtons.heightAnchor.constraint(equalToConstant: 34),
			headerButtons.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
			headerButtons.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
			
			attributesInformation.topAnchor.constraint(equalTo: headerButtons.bottomAnchor, constant: 10),
			attributesInformation.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
			attributesInformation.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
		
			pointsView.topAnchor.constraint(equalTo: attributesInformation.bottomAnchor, constant: 55),
			pointsView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
			pointsView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
			
			statesView.topAnchor.constraint(equalTo: pointsView.bottomAnchor, constant: 55),
			statesView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
			statesView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
			statesView.bottomAnchor.constraint(equalTo: scrollingView.bottomAnchor, constant: 0),
			
			dimmingOverlay.leftAnchor.constraint(equalTo: self.view.leftAnchor),
			dimmingOverlay.rightAnchor.constraint(equalTo: self.view.rightAnchor),
			dimmingOverlay.topAnchor.constraint(equalTo: self.view.topAnchor),
			dimmingOverlay.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
			
			diceAlert.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			diceAlert.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
		])
	}
	
	// MARK: - Editing Logic
	func textFieldDidEndEditing(_ textField: UITextField) {
		if !isEditEnabled {
			pointsView.rewriteAllPoints(is: true)
			aspectsViewPresenter.setPoints(with: pointsView.getAllPointsValues())
				
			//Presenter uses formatted values to update Model
				
			pointsView.updatePointsValues(with: aspectsViewPresenter.getPoints())
		}
	}
	
	@objc func enterEditing() {
		isEditEnabled = true
		headerButtons.enterEditing()
		attributesInformation.groupIsEditable(is: true)
		pointsView.togglePointGroupEditMode()
	}
	
	@objc func cancelEditing() {
		pointsView.rewriteAllPoints(is: false)
		
		//"Rewrites" characteristics text fields with their Current Values
		attributesInformation.changeAllCharacteristicValues(with: attributesInformation.getAllCharacteristicValues())
		
		headerButtons.endEditing()
		attributesInformation.groupIsEditable(is: false)
		pointsView.togglePointGroupEditMode()
		isEditEnabled = false
	}
	
	@objc func confirmEditing() {
		//Presenter gets all values in View and formats
		pointsView.rewriteAllPoints(is: true)
		aspectsViewPresenter.setPoints(with: pointsView.getAllPointsValues())
		aspectsViewPresenter.setCharacteristics(with: attributesInformation.getAllCharacteristicValues())
		
		//Presenter uses formatted values to update Model
		
		//Presenter gets all values from Model and updates View
		pointsView.updatePointsValues(with: aspectsViewPresenter.getPoints())
		attributesInformation.overwriteAllCharacteristicValues()
		
		headerButtons.endEditing()
		attributesInformation.groupIsEditable(is: false)
		pointsView.togglePointGroupEditMode()
		isEditEnabled = false
	}
	
	// MARK: - Dice Roll Logic
	@objc func triggerPointsRoll(sender: UIButton) {
		
		let rolledPoints = pointsView.getPointsRolled()
		
		if let points = rolledPoints {
			diceAlert.rollDice(rollText: points.rollName, rollType: points.diceType)
		}
		
		UIView.animate(withDuration: 0.2, delay: 0, animations: {
			self.diceAlert.layer.opacity = 1
			self.dimmingOverlay.layer.opacity = 0.6
		})
		
		rolledPoints?.resetDiceRoll()
	}
	
	@objc func triggerCharacteristicRoll(sender: CharacteristicView) {
		
		if !isEditEnabled {
			diceAlert.rollDice(rollText: sender.testName, rollType: sender.diceType)
			UIView.animate(withDuration: 0.2, delay: 0, animations: {
				self.diceAlert.layer.opacity = 1
				self.dimmingOverlay.layer.opacity = 0.6
			})
		}
	}
	
	@objc func dismissAlert() {
		UIView.animate(withDuration: 0.2, delay: 0, animations: {
			self.diceAlert.layer.opacity = 0
			self.dimmingOverlay.layer.opacity = 0
		})
	}
}
