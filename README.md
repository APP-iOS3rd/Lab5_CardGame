# 🃏 카드게임
> 프로젝트 기간: 2022-11-09 14:00 ~ 16:30
> 
> 팀원: [hamfan524](https://github.com/hamfan524), [Dev_Larva](https://github.com/Dev_Larva), [2HYUNHO](https://github.com/2HYUNHO), [zoa0945](https://github.com/zoa0945)

## 🔎 프로젝트 소개

미니 게임 프로젝트 

## 📺 프로젝트 실행화면
|게임 시작|게임 완료|
|:--:|:--:|
|![화면 기록 2023-11-09 오후 5 36 37](https://github.com/APP-iOS3rd/Team8_Eight/assets/37105602/c87a4898-56a9-4df5-893b-ae53aef79c57)|![화면 기록 2023-11-09 오후 5 11 44](https://github.com/APP-iOS3rd/Team8_Eight/assets/37105602/f16ff517-f017-4f15-9f09-588ac366f040)|


## 🔑 키워드

- MVVM
- LazyGrid

## ✨ 구현내용
1. 그리드 레이아웃 및 카드 뷰
    - LazyVGrid와 GridItem을 사용하여 그리드 레이아웃을 생성
    - CardView를 만들어 각 카드를 표현하고, 터치 제스처를 추가하여 사용자의 입력에 대응

2. 시작 버튼 및 게임 초기화
    - 시작 버튼을 누르면 viewModel.newGame()을 호출하여 카드를 초기화하고, viewModel.showAllCards() 메서드를 사용하여 2초 동안 카드를 뒤집어 보여주기
    - 2초 후에 viewModel.hideAllCards() 메서드를 호출하여 카드를 다시 뒤집기

3. 미션 성공 알림
    - 게임에서 미션을 성공하면 viewModel.showAlert가 true로 설정되고, Alert를 통해 사용자에게 알림창이 표시