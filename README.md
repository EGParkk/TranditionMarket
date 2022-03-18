# TranditionMarket

>### 목차  
>[1. 홈 페이지](#홈-페이지)  
>[2. 회원가입 페이지](#회원가입-페이지)  
>[3. 로그인 페이지](#로그인-페이지)  
>[4. 마이 페이지](#마이-페이지)  
>[5. 시장 검색 결과 페이지](#시장-검색-결과-페이지)  
>[6. 시장 페이지](#시장-페이지)  
>[7. 공지사항 페이지](#공지사항-페이지)  
>[8. 후기 게시판 페이지](#후기-게시판-페이지)
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
<br>

# 회원가입 페이지
![image](https://user-images.githubusercontent.com/89386949/158892736-c47f35cf-1f44-4c51-ba67-d6476d6d5675.png)
## 2022.02.24.
- 회원가입 구현
  - 아이디, 패스워드(입력 일치 확인), 이름, 닉네임, 주소, 이메일, 자기소개, 프로필사진(로컬 파일 선택) 데이터 DB user table에 저장
<br>

# 로그인 페이지
![image](https://user-images.githubusercontent.com/89386949/158994627-1f138ba2-eda1-4aa7-82dd-7f3ca77ea4fe.png)
## 2022.02.24.
- 로그인 구현
  - DB user table에서 아이디, 비밀번호 조회
<br>

# 마이 페이지
![image](https://user-images.githubusercontent.com/89386949/158995268-0ded3342-d187-4ce5-a659-85c50d6fc7b0.png)
## 2022.02.24.
- 회원정보 구현
  - DB user table에서 회원정보 조회
  - 회원정보 수정 구현
  - 회원탈퇴 구현
- 즐겨찾기 목록 틀 구현
- 최근 게시글 목록 틀 구현
<br>

# 시장 검색 결과 페이지
![image](https://user-images.githubusercontent.com/89386949/158998452-6770ac22-11c8-45c3-aedf-d1d04119dd5b.png)
![image](https://user-images.githubusercontent.com/89386949/158998517-e975ecf6-210e-4297-98a0-20dfa2711763.png)
## 2022.02.24.
- DB market table에서 검색어에 맞는 시장 정보 조회
  - 이름, 이미지, 위도, 경도, 사진 데이터
- 검색된 시장 위치 지도 구현
  - 위도, 경도 데이터와 Kakao 지도 Javscript API 이용
- 검색된 시장 미리 보기 구현
<br>

# 시장 페이지
![image](https://user-images.githubusercontent.com/89386949/159000941-d9816ce2-bac6-48c3-ad6a-f26bf25646ad.png)
## 2022.02.24.
- 
