# TranditionMarket

>### 목차  
>[1. 홈 페이지](#홈-페이지)  
>[2. 회원가입 페이지](#회원가입-페이지)  
>[3. 로그인 페이지](#로그인-페이지)  
>[4. 마이 페이지](#마이-페이지)  
>[5. 관리자 페이지](#관리자-페이지)  
>[6. 즐겨찾기 페이지](#즐겨찾기-페이지)
>[7. 시장 검색 결과 페이지](#시장-검색-결과-페이지)  
>[8. 시장 페이지](#시장-페이지)  
>[9. 게시판 페이지](#게시판-페이지)
<br>

# 홈 페이지  
![image](https://user-images.githubusercontent.com/89386949/158892303-6134babf-be9c-4e99-bafc-25839d5ab6c9.png)
## 2022.02.24.
- 공용으로 쓰일 header 구현
  - 홈 페이지, 공지사항, 게시판 이동
  - 로그인, 회원가입 이동 (로그인 시 마이페이지 이동, 로그아웃)
- 검색바 구현
- 추천시장 및 공지사항 미리보기 틀 구현
- 공용으로 쓰일 footer 구현
## 2022.03.08.
- 로그아웃 시 로그인 정보 삭제 추가
<br>

# 회원가입 페이지
![image](https://user-images.githubusercontent.com/89386949/158892736-c47f35cf-1f44-4c51-ba67-d6476d6d5675.png)
## 2022.02.24.
- 회원가입 구현
  - 아이디, 패스워드(입력 일치 확인), 이름, 닉네임, 주소, 이메일, 자기소개, 프로필사진(로컬 파일 선택) 데이터 DB user table에 저장
## 2022.03.08.
- 아이디 중복확인 추가
<br>

# 로그인 페이지
![image](https://user-images.githubusercontent.com/89386949/158994627-1f138ba2-eda1-4aa7-82dd-7f3ca77ea4fe.png)
## 2022.02.24.
- 로그인 구현
  - DB user table에서 사용자가 입력한 아이디, 비밀번호 조회 및 비교
<br>

# 마이 페이지
![image](https://user-images.githubusercontent.com/89386949/159051827-0b31a20e-aa7a-405d-b2c1-d8ad23f214dc.png)
![image](https://user-images.githubusercontent.com/89386949/159051942-663921da-2cbc-48b3-9ca1-40eddf83d296.png)
## 2022.02.24.
- 회원정보 구현
  - DB user table에서 로그인한 회원정보 조회
  - 회원정보 수정 구현
  - 회원탈퇴 틀 구현
- 즐겨찾기 목록 틀 구현
- 최근 게시글 목록 틀 구현
## 2022.03.08.
- 회원 이미지 표현
- 회원탈퇴 구현
- 즐겨찾기 목록 구현
  - DB bookmark table에서 로그인한 회원의 즐겨찾기 정보 조회
  - 즐겨찾기 삭제 틀 구현
<br>

# 관리자 페이지
![image](https://user-images.githubusercontent.com/89386949/159045140-0fb42e07-9f39-4e63-b465-7e421d2514e1.png)
![image](https://user-images.githubusercontent.com/89386949/159045692-3218d3e5-12d6-42d8-821e-f34dfe5d630e.png)
## 2022.02.24.
- DB user table에서 관리자를 제외한 모든 회원정보 조회
- 회원 관리(수정, 강퇴) 틀 구현
<br>

# 즐겨찾기 페이지
![image](https://user-images.githubusercontent.com/89386949/159054071-70c636ec-7425-4a61-b80a-749c0bc1f35b.png)
## 2022.03.08
- DB market table에서 로그인한 유저가 즐겨찾기 등록한 시장 정보 조회
- DB mimg table에서 검색어에 맞는 시장 이미지 조회
- 즐겨찾기 시장 미리보기 구현
  - 이름, 이미지, 주소 데이터로 표현
<br>

# 시장 검색 결과 페이지
![image](https://user-images.githubusercontent.com/89386949/158998452-6770ac22-11c8-45c3-aedf-d1d04119dd5b.png)
![image](https://user-images.githubusercontent.com/89386949/158998517-e975ecf6-210e-4297-98a0-20dfa2711763.png)
## 2022.02.24.
- DB market table에서 검색어에 맞는 시장 정보 조회
- DB mimg table에서 검색어에 맞는 시장 이미지 조회
- 검색된 시장 위치 지도 구현
  - 위도, 경도 데이터와 Kakao 지도 Javscript API 이용
- 검색된 시장 미리 보기 구현
  - 이름, 이미지, 주소 데이터로 표현
<br>

# 시장 페이지
![image](https://user-images.githubusercontent.com/89386949/159000941-d9816ce2-bac6-48c3-ad6a-f26bf25646ad.png)
## 2022.02.24.
- DB market table에서 선택한 시장 정보 조회
  - 이름, 유형, 개설 주기, 점포수, 취급 품목, 공중화장실, 주차장 데이터로 표현
<br>

# 게시판 페이지
![image](https://user-images.githubusercontent.com/89386949/159048775-5b9bd256-c79e-4201-bbd1-6cdf2a97b90d.png)
![image](https://user-images.githubusercontent.com/89386949/159049330-5a5253a8-a800-4bf1-9a30-b4e8902e330c.png)
![image](https://user-images.githubusercontent.com/89386949/159049557-dfd4e7a9-7c95-40cd-9428-439a7ceddb2a.png)
## 2022.02.24
- DB board table에서 게시글 정보 조회
- 회원 글쓰기 구현 (공지사항은 관리자만 가능)
- 게시글 열람 구현
  - 추천 기능 구현
  - 게시글 수정/삭제 구현 (게시글 작성자만 가능)
  - 댓글 기능 구현
## 2022.03.08
- 로그인한 회원 정보 가져오기 구현
- 댓글 중복 제출 버그 수정
