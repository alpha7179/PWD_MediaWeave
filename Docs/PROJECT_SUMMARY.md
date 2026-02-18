# 🎓 PWD MediaWeave - 프로젝트 종합 요약

> 아주대학교 미디어학과 학생들을 위한 스마트 커리큘럼 플래닝 및 커뮤니티 플랫폼

## 📋 프로젝트 개요

### 🎯 프로젝트 목표
**PWD MediaWeave**는 아주대학교 미디어학과 학생들의 학업 관리와 협업을 지원하는 종합 플랫폼입니다. 학생들이 효율적으로 커리큘럼을 계획하고, 프로젝트를 공유하며, 팀을 구성할 수 있도록 돕는 것이 주요 목표입니다.

### 🏗 시스템 아키텍처
- **Frontend**: React 18.2.0 + Vite 5.2.0 (SPA)
- **Backend**: Node.js + Express.js 5.2.1 (REST API)
- **Database**: SQLite3 (개발) / PostgreSQL (프로덕션) + Sequelize ORM
- **Authentication**: JWT 기반 토큰 인증
- **File Storage**: Multer 기반 로컬 파일 시스템

## 🚀 핵심 기능

### 1. 📚 커리큘럼 관리 시스템
- **스마트 플래너**: 드래그앤드롭 기반 8학기 수강계획 수립
- **로드맵 시각화**: ReactFlow를 활용한 전공 트랙별 학습 경로 시각화
- **커리큘럼 갤러리**: 선배들의 수강계획 공유 및 복사 기능
- **졸업요건 체크**: 실시간 졸업 요건 달성도 확인

### 2. 🤝 팀 빌딩 & 협업
- **팀 모집 시스템**: 프로젝트별 팀원 모집 게시판
- **스킬 매칭**: 기술 스택 기반 팀원 추천
- **실시간 채팅**: 팀/프로젝트별 메시징 시스템
- **지원서 관리**: 팀 지원 및 승인 프로세스

### 3. 🎨 프로젝트 포트폴리오
- **프로젝트 갤러리**: 학생 작품 전시 및 공유
- **커뮤니티 기능**: 좋아요, 댓글, 조회수 시스템
- **프로젝트 관리**: 개인 포트폴리오 CRUD 기능
- **썸네일 업로드**: 이미지 파일 업로드 지원

### 4. 📊 성적 관리
- **OCR 성적표 인식**: Tesseract.js 기반 자동 성적표 스캔
- **성적 통계**: 학기별/과목별 성적 분석
- **CSV 업로드**: 기존 성적 데이터 일괄 등록
- **성적 시각화**: 차트 기반 성적 트렌드 분석

### 5. 👤 사용자 관리
- **역할 기반 접근제어**: STUDENT/PROFESSOR/ADMIN 권한 분리
- **프로필 관리**: 개인정보, SNS 링크, 자기소개 관리
- **알림 시스템**: 실시간 활동 알림
- **관리자 대시보드**: 시스템 통계 및 사용자 관리

## 🛠 기술 스택 상세

### Frontend (Client)
```json
{
  "core": {
    "React": "18.2.0",
    "Vite": "5.2.0",
    "JavaScript": "ES6+"
  },
  "state_management": {
    "Zustand": "5.0.9",
    "TanStack React Query": "5.90.12"
  },
  "ui_styling": {
    "TailwindCSS": "3.4.3",
    "Lucide React": "0.556.0"
  },
  "routing": {
    "React Router DOM": "7.10.1"
  },
  "forms": {
    "React Hook Form": "7.68.0",
    "Zod": "4.1.13"
  },
  "special_features": {
    "ReactFlow": "11.11.4",
    "Tesseract.js": "7.0.0",
    "@dnd-kit": "^6.3.1",
    "PapaParse": "5.5.3"
  }
}
```

### Backend (Server)
```json
{
  "runtime": "Node.js v18.x+",
  "framework": "Express.js 5.2.1",
  "database": {
    "SQLite3": "5.1.7",
    "PostgreSQL": "8.16.3",
    "Sequelize": "6.37.7"
  },
  "security": {
    "bcrypt": "6.0.0",
    "jsonwebtoken": "9.0.3",
    "cors": "2.8.5"
  },
  "file_processing": {
    "multer": "2.0.2",
    "csv-parser": "3.2.0"
  },
  "utilities": {
    "dotenv": "17.2.3",
    "morgan": "1.10.1"
  }
}
```

## 📊 데이터베이스 설계

### 핵심 엔티티
- **Users**: 사용자 정보 및 권한 관리
- **Projects**: 프로젝트 포트폴리오 데이터
- **Courses**: 교과목 정보
- **Tracks**: 전공 트랙 분류
- **TeamPosts**: 팀 모집 게시글
- **Messages**: 실시간 채팅 메시지
- **SavedCurriculums**: 저장된 커리큘럼 계획
- **Transcripts**: 성적표 데이터
- **Notifications**: 알림 시스템

### 주요 관계
- User ↔ Project (1:N)
- User ↔ TeamPost (1:N)
- Project ↔ Comment/Like (1:N)
- Course ↔ Track (N:M)
- User ↔ SavedCurriculum (1:N)

## 🌐 API 구조

### 인증 & 사용자
- `POST /api/v1/auth/register` - 회원가입
- `POST /api/v1/auth/login` - 로그인
- `GET /api/v1/users/me` - 프로필 조회
- `PUT /api/v1/users/me` - 프로필 수정

### 프로젝트 관리
- `GET /api/v1/projects` - 프로젝트 목록
- `POST /api/v1/projects` - 프로젝트 생성
- `POST /api/v1/projects/:id/like` - 좋아요 토글
- `POST /api/v1/projects/:id/comments` - 댓글 작성

### 팀 빌딩
- `GET /api/v1/teams` - 팀 모집 목록
- `POST /api/v1/teams` - 팀 모집 게시글 작성
- `POST /api/v1/teams/:id/apply` - 팀 지원

### 커리큘럼 관리
- `GET /api/v1/curriculums/public` - 공개 커리큘럼 갤러리
- `POST /api/v1/curriculums/save` - 커리큘럼 저장
- `GET /api/v1/my-plan` - 내 수강계획 조회

## 📁 프로젝트 구조

```
PWD_MediaWeave/
├── Client/                    # React 프론트엔드
│   ├── src/
│   │   ├── components/       # 재사용 컴포넌트
│   │   ├── pages/           # 페이지 컴포넌트
│   │   ├── stores/          # Zustand 상태 관리
│   │   ├── services/        # API 서비스
│   │   ├── hooks/           # 커스텀 훅
│   │   └── utils/           # 유틸리티 함수
│   └── package.json
├── Server/                   # Node.js 백엔드
│   ├── src/
│   │   ├── controllers/     # 비즈니스 로직
│   │   ├── models/          # 데이터 모델
│   │   ├── routes/          # API 라우트
│   │   ├── middlewares/     # 미들웨어
│   │   └── config/          # 설정 파일
│   └── package.json
└── Docs/                    # 프로젝트 문서
    ├── 1. [Plan] Product Requirement Document.md
    ├── 2. [Plan] Requirements Specification.md
    └── ...
```

## 🎯 구현 현황

### ✅ 완전 구현된 기능
- JWT 기반 인증 시스템
- 프로젝트 CRUD 및 커뮤니티 기능
- 팀 빌딩 시스템
- 실시간 채팅
- 커리큘럼 플래너 (드래그앤드롭)
- 로드맵 시각화 (ReactFlow)
- OCR 성적표 인식
- 관리자 대시보드
- 파일 업로드 시스템

### 🔄 부분 구현/개선 필요
- 선수과목 자동 검증 로직
- 졸업요건 자동 체크 시스템
- 실시간 알림 푸시
- 고급 검색/필터링
- 성능 최적화

## 🚀 배포 및 운영

### 개발 환경
- **Frontend**: `npm run dev` (Vite 개발 서버)
- **Backend**: `npm run dev` (nodemon 자동 재시작)
- **Database**: SQLite3 (로컬 파일)

### 프로덕션 환경
- **Frontend**: `npm run build` → 정적 파일 배포
- **Backend**: `npm start` → Express 서버 실행
- **Database**: PostgreSQL 연동

## 📈 향후 계획

### 단기 목표 (1-2개월)
- 선수과목 검증 로직 구현
- 실시간 알림 시스템 완성
- 성능 최적화 및 버그 수정
- 사용자 피드백 반영

### 중장기 목표 (3-6개월)
- 모바일 앱 개발 (React Native)
- AI 기반 커리큘럼 추천 시스템
- 외부 시스템 연동 (학사 시스템)
- 다른 학과로 확장

## 👥 팀 구성 및 역할

- **프론트엔드 개발**: React, UI/UX 구현
- **백엔드 개발**: Node.js, API 설계
- **데이터베이스 설계**: 스키마 설계 및 최적화
- **프로젝트 관리**: 요구사항 분석 및 일정 관리

---

**Built with ❤️ for Ajou University Media Department Students**

*Last Updated: 2024년 12월*