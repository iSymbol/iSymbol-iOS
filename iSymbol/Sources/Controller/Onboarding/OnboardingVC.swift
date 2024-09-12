//
//  OnboardingVC.swift
//  iSymbol
//
//  Created by ohseungyeon on 9/2/24.
//

import Lottie
import UIKit

final class OnboardingViewController: BaseViewController {

    private let onboardingView = OnboardingView()
    private var onboardingItems: [OnboardingItem] = []

    // 체크버튼, 글 색
    private let checkColors: [UIColor] = [
        .orange,
        .purple,
        .yellow,
        .blue,
        .red
    ]

    override func loadView() {
        view = onboardingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
        onboardingView.setupOnboardingItems(onboardingItems)
        setupActions()
    }

    @objc private func didTapCheckButton(_ sender: UIButton) {
        let index = sender.tag
        onboardingItems[index].isSelected.toggle()

        let isSelected = onboardingItems[index].isSelected
        let imageName = isSelected ? "checkmark.circle.fill" : "checkmark.circle"
        sender.setImage(UIImage(systemName: imageName), for: .normal)

        // 색 변경
        let color = isSelected ? checkColors[index] : .gray
        sender.tintColor = color
        onboardingView.descriptionLabels[index].textColor = color

        // 모든 체크버튼 눌러졌을때 start 버튼 나타남
        let allSelected = onboardingItems.allSatisfy { $0.isSelected }
        onboardingView.startButton.isHidden = !allSelected

        if allSelected{
            congrateanimation()
        }
    }

    @objc private func didTapStartButton() {
        // 홈 화면으로 이동
        //let homeVC = HomeVC()
        let loginIntroVC = LoginIntroController()

        if let navigationController = self.navigationController {
            navigationController.pushViewController(loginIntroVC, animated: true)
        } else {
            loginIntroVC.modalPresentationStyle = .fullScreen
            present(loginIntroVC, animated: true, completion: nil)
        }
    }

    // lottie 사용
    private func congrateanimation(){
        let animation = LottieAnimation.named("Animation - 1726030734391")
        let animationView = LottieAnimationView(animation: animation)
        animationView.center = view.center
        animationView.isUserInteractionEnabled = false
        view.addSubview(animationView)
        animationView.play()
    }

    private func setupData() {
        onboardingItems = [
            OnboardingItem(text: "빠르고 재미있게 SF Symbols를 배워보세요!", color: .orange, isSelected: false),
            OnboardingItem(text: "이제부터 이모티콘 찾느라 시간을 낭비하지 마세요!", color: .purple, isSelected: false),
            OnboardingItem(text: "재미있는 게임을 통해 SF Symbols를 쉽게 익혀보세요.", color: .yellow, isSelected: false),
            OnboardingItem(text: "매일 조금씩 발전해 전문가가 되어보세요.", color: .blue, isSelected: false),
            OnboardingItem(text: "SF Symbols와 친숙해지는 시간, 지금 시작해볼까요?", color: .red, isSelected: false)
        ]
    }

    // 체크박스, 레이블 회색으로 초기설정
    private func initialGrayColor() {
        for (index, button) in onboardingView.checkButtons.enumerated() {
            button.tintColor = .gray
            onboardingView.descriptionLabels[index].textColor = .gray
        }
    }

    private func setupActions() {
        initialGrayColor()

        for (index, button) in onboardingView.checkButtons.enumerated() {
            button.tag = index
            button.addTarget(self, action: #selector(didTapCheckButton(_:)), for: .touchUpInside)
        }

        onboardingView.startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
    }



}
