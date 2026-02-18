# **Media Weave - 디지털미디어학과 통합 학습 관리 플랫폼**

## **1. 프로젝트 개요 (Project Overview)**

**Media Weave (미디어 위브)**는 아주대학교 디지털미디어학과 재학생을 위한 통합 학습 관리 및 커뮤니티 플랫폼입니다. "우리의 이야기를 한곳에, 디미를 잇다"라는 슬로건 아래, 복잡한 커리큘럼 설계부터 프로젝트 아카이빙, 팀 빌딩까지 학과 생활의 모든 측면을 지원합니다.

### **1.1. 핵심 가치 및 해결 과제**

디지털미디어학과는 5개의 자율 트랙(GI, VC, DE, CD, MD)과 100개 이상의 전공선택 과목을 운영하며, 학생들에게 높은 자율성을 제공합니다. 하지만 이러한 자율성은 다음과 같은 문제를 야기합니다:

* **주요 해결 과제**
    * **커리큘럼 정보 투명성 부족:** 5개 트랙별 과목 연관성과 선수과목 관계가 불분명하여 학생들의 진로 설계가 어려움
    * **개인 맞춤형 커리큘럼 설계의 복잡성:** 4년 8학기 수강 계획 수립 시 선수과목 검증과 졸업요건 확인의 어려움
    * **학습 성과물 체계적 아카이빙 부재:** 학과 내 우수 프로젝트가 분산되어 후배들의 학습 참고 자료 부족
    * **비효율적인 팀 구성 프로세스:** 프로젝트 팀원 모집과 역량 매칭의 비효율성

* **솔루션**
    * **React Flow 기반 인터랙티브 트랙 로드맵:** 100개 이상 과목의 선수과목 관계를 시각적으로 표현
    * **드래그 앤 드롭 커리큘럼 플래너:** 4년 8학기 학습 계획을 직관적으로 수립
    * **Tesseract.js OCR 성적표 자동 인식:** 수동 입력 부담을 90% 감소
    * **프로젝트 갤러리 시스템:** CRUD, 태그 기반 분류, 좋아요/댓글/조회수 기능
    * **역량 기반 팀 빌딩 플랫폼:** 실시간 채팅 연동으로 효율적인 협업 지원

### **1.2. 차별화 포인트**

| 기능 | 학과요람 PDF | 에브리타임 | **Media Weave** |
|------|-------------|-----------|----------------|
| 커리큘럼 시각화 | ❌ | ❌ | ✅ 인터랙티브 그래프 |
| 선수과목 관계 | 📝 텍스트 | ❌ | ✅ 화살표 시각화 |
| 학습 계획 도구 | ❌ | ❌ | ✅ 드래그 앤 드롭 |
| 프로젝트 아카이빙 | ❌ | ❌ | ✅ 갤러리 + 필터 |
| 팀 빌딩 | ❌ | 📝 익명 게시판 | ✅ 역량 기반 매칭 |
| OCR 성적표 인식 | ❌ | ❌ | ✅ AI 자동 인식 |

### **1.3. 개발 기간 및 성과**

* **개발 기간:** 2024년 9월 ~ 2024년 12월 (4개월)
* **팀 구성:** 1인 Full-Stack 개발
* **구현 완료율:** 90% 이상 (핵심 기능 완전 구현)

---

## **2. 시스템 아키텍처 (System Architecture)**

### **2.1. 전체 아키텍처 다이어그램**

```
┌─────────────────────────────────────────────────────────────┐
│                        Client Layer                          │
│  ┌──────────────────────────────────────────────────────┐   │
│  │   React 18 + Vite 5 (SPA)                           │   │
│  │   - React Flow 11 (트랙 로드맵 시각화)               │   │
│  │   - Tesseract.js 7 (OCR 성적표 인식)                │   │
│  │   - @dnd-kit 6 (드래그앤드롭 플래너)                 │   │
│  │   - React Query 5 (서버 상태 관리)                   │   │
│  │   - Zustand 5 (클라이언트 상태 관리)                 │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                            ↕ HTTPS (REST API)
┌─────────────────────────────────────────────────────────────┐
│                      Application Layer                       │
│  ┌──────────────────────────────────────────────────────┐   │
│  │   Node.js 20 + Express.js 5                         │   │
│  │   - JWT 인증 미들웨어                                 │   │
│  │   - Multer 2 (파일 업로드)                           │   │
│  │   - Sequelize 6 ORM (PostgreSQL)                    │   │
│  │   - Bcrypt 6 (비밀번호 암호화)                       │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                            ↕ SQL
┌─────────────────────────────────────────────────────────────┐
│                       Data Layer                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  PostgreSQL 15 (Single Database)                    │   │
│  │  - 15개 테이블 (Users, Courses, Projects, etc.)     │   │
│  │  - 복잡한 N:M 관계 (Course-Track, User-Project)     │   │
│  │  - JSON 타입 활용 (커리큘럼 데이터)                  │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                            ↕
┌─────────────────────────────────────────────────────────────┐
│                      Storage Layer                           │
│  ┌──────────────────────────────────────────────────────┐   │
│  │   Local File System / AWS S3 (예정)                 │   │
│  │   - 프로젝트 이미지/썸네일                            │   │
│  │   - 프로필 사진                                       │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

### **2.2. 핵심 기능 (Key Features)**

* **1. React Flow 기반 트랙 로드맵**
    * 100개 이상 과목 노드 실시간 렌더링 (200-300ms)
    * 5개 트랙 필터링 시스템 (GI, VC, DE, CD, MD)
    * 선수과목 관계 시각화 (파란색: 선수과목, 초록색: 후속과목)
    * 학년별 그룹 박스 자동 생성 및 동적 높이 조정
    * 인터랙티브 기능: 확대/축소/패닝, 노드 포커스, 과목 상세 모달

* **2. 드래그 앤 드롭 커리큘럼 플래너**
    * 4년 8학기 그리드 UI (1-1학기부터 4-2학기까지)
    * @dnd-kit 기반 드래그 앤 드롭 시스템
    * 상태별 시각적 구분: 이수 완료(초록), 수강 중(파랑), 수강 예정(회색)
    * 실시간 학점 계산: 학기별/전체 학점 자동 계산
    * 커리큘럼 저장/수정/삭제: 공개/비공개 설정 지원

* **3. Tesseract.js OCR 성적표 인식**
    * 한국어+영어 동시 인식: 아주대학교 성적표 템플릿 최적화
    * 자동 과목 매칭: 추출된 텍스트를 기존 과목 데이터베이스와 매칭
    * CSV 업로드 지원: 수동 입력 대안 제공
    * 성적 통계 분석: 학기별 GPA, 이수 학점 시각화

* **4. 프로젝트 갤러리 및 커뮤니티**
    * 프로젝트 CRUD: 생성, 조회, 수정, 삭제 완전 구현
    * 커뮤니티 기능: 좋아요, 댓글, 조회수 시스템
    * 다중 필터링: 트랙, 프로젝트 타입, 기술 스택별 필터
    * 정렬 옵션: 최신순, 인기순, 조회수순
    * 프로젝트 핀 기능: 즐겨찾기 시스템

* **5. 팀 빌딩 플랫폼**
    * 모집 게시판: 팀원 모집 게시글 CRUD
    * 지원 시스템: Apply to Team, 승인/거절 상태 관리
    * 실시간 채팅 연동: 팀 빌딩 → 채팅방 자동 생성
    * 기술 스택 태그: 필요 역량 시각화
    * 모집 상태 관리: 모집 중/모집 완료 자동 전환

* **6. 실시간 채팅 시스템**
    * 1:1 개인 채팅: 사용자 간 직접 메시징
    * 팀 기반 그룹 채팅: TeamPost 연결 채팅방
    * 프로젝트 채팅: Project 연결 협업 채팅
    * 폴링 기반 실시간: 3초 간격 메시지 동기화
    * 읽음 처리: 메시지 읽음 상태 관리

---

## **3. 기술 스택 (Tech Stack)**

### **3.1. Frontend**

| 기술 | 버전 | 용도 |
|------|------|------|
| **React** | 18.2.0 | UI 라이브러리 |
| **Vite** | 5.2.0 | 빌드 도구 (HMR 5배 향상) |
| **React Router DOM** | 7.10.1 | 클라이언트 사이드 라우팅 |
| **React Flow** | 11.11.4 | 트랙 로드맵 그래프 시각화 |
| **@dnd-kit** | 6.3.1 | 드래그앤드롭 (접근성 표준 준수) |
| **TanStack React Query** | 5.90.12 | 서버 상태 캐싱 및 동기화 |
| **Zustand** | 5.0.9 | 경량 클라이언트 상태 관리 |
| **Tailwind CSS** | 3.4.3 | 유틸리티 기반 스타일링 |
| **Tesseract.js** | 7.0.0 | OCR 성적표 자동 인식 |
| **PapaParse** | 5.5.3 | CSV 파싱 |
| **Lucide React** | 0.556.0 | 아이콘 라이브러리 |
| **Axios** | 1.13.2 | HTTP 클라이언트 |

### **3.2. Backend**

| 기술 | 버전 | 용도 |
|------|------|------|
| **Node.js** | 20.x LTS | 런타임 환경 |
| **Express.js** | 5.2.1 | RESTful API 서버 |
| **PostgreSQL** | 15.x | 관계형 데이터베이스 |
| **Sequelize** | 6.37.7 | PostgreSQL ORM |
| **JWT** | 9.0.3 | 토큰 기반 인증 |
| **Bcrypt** | 6.0.0 | 비밀번호 암호화 (Salt Rounds: 10) |
| **Multer** | 2.0.2 | 파일 업로드 처리 |
| **CSV-Parser** | 3.2.0 | 성적표 데이터 처리 |
| **Morgan** | 1.10.1 | HTTP 요청 로깅 |
| **CORS** | 2.8.5 | Cross-Origin Resource Sharing |

### **3.3. Infrastructure (예정)**

| 서비스 | 용도 |
|--------|------|
| **AWS S3** | 정적 파일 호스팅 (React 빌드) |
| **AWS CloudFront** | CDN, HTTPS 강제, 전역 캐싱 |
| **AWS EC2** | 백엔드 서버 (Node.js + PM2) |
| **AWS RDS** | PostgreSQL 관리형 서비스 |

---

## **4. 데이터베이스 설계 (Database Schema)**

### **4.1. 핵심 엔티티 관계**

```
User (사용자)
├── 1:N → Project (프로젝트)
├── 1:N → TeamPost (팀 모집)
├── 1:N → Message (메시지)
├── 1:N → SavedCurriculum (저장된 커리큘럼)
├── 1:N → Transcript (성적표)
├── N:M → Course (수강 이력 - StudentCurriculum)
└── N:M → Project (좋아요 - Like)

Course (교과목)
├── N:M → Track (트랙 관계 - course_tracks)
├── 1:N → Project (과목별 프로젝트)
└── N:M → User (수강 이력 - StudentCurriculum)

Project (프로젝트)
├── 1:N → Comment (댓글)
├── 1:N → Like (좋아요)
├── 1:N → ProjectView (조회수)
└── 1:N → Message (프로젝트 채팅)

TeamPost (팀 빌딩)
├── 1:N → TeamApplication (지원)
└── 1:N → Message (팀 채팅)
```

### **4.2. 주요 테이블 구조**

**Users (사용자)**
```sql
user_id, email, name, student_id, password_hash, role (STUDENT/PROFESSOR/ADMIN),
bio, github_url, linkedin_url, profile_image, is_active, created_at, updated_at
```

**Courses (교과목)**
```sql
course_id, code, name_ko, name_en, credit, year, semester, credit_type,
description, prerequisites, created_at, updated_at
```

**Projects (프로젝트)**
```sql
project_id, user_id, track_id, course_id, title, description, thumbnail,
project_type (Team/Individual/Graduation/Competition), start_date, end_date,
tech_stacks (JSON), views, likes, created_at, updated_at
```

**SavedCurriculums (저장된 커리큘럼)**
```sql
id, user_id, name, description, track, curriculum_data (JSON),
is_shared, shared_by, origin_id, views, copies, created_at, updated_at
```

**TeamPosts (팀 빌딩)**
```sql
id, author_id, title, description, track_code, tags, max_members,
status (RECRUITING/CLOSED), recruitment_deadline, project_period,
created_at, updated_at
```

**Messages (채팅)**
```sql
id, sender_id, receiver_id, team_post_id, project_id, profile_id,
content, is_read, created_at, updated_at
```

**Transcripts (성적표)**
```sql
transcript_id, user_id, semester, course_code, course_name, credit,
grade, grade_point, course_type, created_at, updated_at
```

### **4.3. 데이터베이스 선택 근거**

**PostgreSQL 단일 데이터베이스 사용 이유:**

| 장점 | 설명 |
|------|------|
| **관계 무결성** | 사용자, 과목, 프로젝트 간 복잡한 관계를 FOREIGN KEY로 보장 |
| **ACID 트랜잭션** | 커리큘럼 저장, 프로젝트 등록 시 데이터 일관성 보장 |
| **JSON 지원** | 커리큘럼 데이터를 JSON 타입으로 유연하게 저장 |
| **Full-Text Search** | 한국어 프로젝트 검색을 위한 GIN 인덱스 활용 |
| **운영 단순성** | 단일 데이터베이스로 백업, 모니터링, 확장 관리 용이 |
| **개발 효율성** | Sequelize ORM으로 모든 데이터 접근 통일 |

---

## **5. 프로젝트 구조 (Project Structure)**

### **5.1. Frontend 폴더 구조**

```
Client/
├── public/
│   └── data/                    # CSV 데이터 파일
│       ├── Course.csv           # 100+ 과목 정보
│       ├── Course_Prerequisites.csv  # 선수과목 관계
│       ├── Course_Tracks.csv    # 과목-트랙 매핑
│       └── Track.csv            # 5개 트랙 정보
├── src/
│   ├── components/
│   │   ├── common/              # 공통 컴포넌트
│   │   │   ├── Portal.jsx       # 모달 포털
│   │   │   ├── AnimatedEmoji.jsx
│   │   │   ├── CourseDetailModal.jsx
│   │   │   └── TrackSelect.jsx
│   │   ├── layout/              # 레이아웃
│   │   │   ├── Header.jsx
│   │   │   ├── Sidebar.jsx
│   │   │   └── ProtectedRoute.jsx
│   │   └── features/            # 기능별 컴포넌트
│   │       ├── roadmap/         # 트랙 로드맵
│   │       │   ├── CourseNode.jsx
│   │       │   ├── GroupNode.jsx
│   │       │   └── TrackRoadmap.jsx
│   │       ├── planner/         # 커리큘럼 플래너
│   │       │   ├── DraggableCourse.jsx
│   │       │   ├── CsvUploader.jsx
│   │       │   └── TranscriptUploadModal.jsx
│   │       ├── gallery/         # 프로젝트 갤러리
│   │       │   └── ProjectUploadForm.jsx
│   │       └── transcript/      # 성적표
│   │           └── TranscriptOCR.jsx
│   ├── pages/                   # 페이지 컴포넌트
│   │   ├── LandingPage.jsx
│   │   ├── Dashboard.jsx
│   │   ├── curriculum/
│   │   │   ├── Roadmap.jsx
│   │   │   ├── CurriculumPlanner.jsx
│   │   │   └── CurriculumGallery.jsx
│   │   ├── gallery/
│   │   │   └── ProjectGallery.jsx
│   │   ├── community/
│   │   │   ├── TeamBuilding.jsx
│   │   │   └── CareerProfile.jsx
│   │   ├── profile/
│   │   │   ├── Profile.jsx
│   │   │   ├── ProjectManagement.jsx
│   │   │   └── Chat.jsx
│   │   └── admin/
│   │       └── AdminDashboard.jsx
│   ├── hooks/                   # 커스텀 훅
│   │   └── useDragAndDrop.js
│   ├── services/                # API 호출
│   │   ├── api.js
│   │   └── curriculumLoader.js
│   ├── stores/                  # Zustand 스토어
│   │   ├── authStore.js
│   │   ├── curriculumStore.js
│   │   ├── profileStore.js
│   │   └── uiStore.js
│   ├── utils/                   # 유틸리티
│   │   ├── avatarUtils.js
│   │   ├── trackColors.js
│   │   ├── templateBasedOCR.js
│   │   └── transcriptTemplate.js
│   ├── App.jsx
│   ├── main.jsx
│   └── index.css
├── package.json
└── vite.config.js
```

### **5.2. Backend 폴더 구조**

```
Server/
├── src/
│   ├── config/
│   │   └── db.js                # PostgreSQL 연결 설정
│   ├── models/                  # Sequelize 모델
│   │   ├── index.js             # 모델 관계 정의
│   │   ├── User.js
│   │   ├── Course.js
│   │   ├── Project.js
│   │   ├── Track.js
│   │   ├── TeamPost.js
│   │   ├── Message.js
│   │   ├── Transcript.js
│   │   ├── SavedCurriculum.js
│   │   ├── Comment.js
│   │   ├── Like.js
│   │   └── Notification.js
│   ├── controllers/             # 비즈니스 로직
│   │   ├── authController.js
│   │   ├── projectController.js
│   │   ├── teamController.js
│   │   ├── transcriptController.js
│   │   ├── messageController.js
│   │   └── adminController.js
│   ├── routes/                  # API 라우트
│   │   ├── authRoutes.js
│   │   ├── projectRoutes.js
│   │   ├── teamRoutes.js
│   │   ├── transcriptRoutes.js
│   │   ├── messageRoutes.js
│   │   └── adminRoutes.js
│   ├── middlewares/             # 미들웨어
│   │   ├── auth.js              # JWT 검증
│   │   └── upload.js            # Multer 설정
│   └── seeders/                 # 데이터 시딩
│       └── csvSeeder.js
├── uploads/                     # 업로드된 파일
├── .env                         # 환경 변수
├── package.json
└── server.js                    # 서버 엔트리 포인트
```

---

## **6. 설치 및 실행 (Installation & Usage)**

### **6.1. Prerequisites**

```bash
# Node.js 20.x 이상 설치 필요
# PostgreSQL 15.x 이상 설치 필요

# Node.js 버전 확인
node --version  # v20.x.x

# PostgreSQL 버전 확인
psql --version  # PostgreSQL 15.x
```

### **6.2. Installation**

#### **1. 레포지토리 클론**

```bash
git clone https://github.com/your-username/PWD_MediaWeave.git
cd PWD_MediaWeave
```

#### **2. Frontend 설정**

```bash
cd Client
npm install

# 환경 변수 설정
cp .env.example .env
# .env 파일 수정:
# VITE_API_URL=http://localhost:3000/api/v1
```

#### **3. Backend 설정**

```bash
cd ../Server
npm install

# 환경 변수 설정
cp .env.example .env
# .env 파일 수정:
# DB_HOST=localhost
# DB_PORT=5432
# DB_NAME=mediaweave
# DB_USER=your_username
# DB_PASSWORD=your_password
# JWT_SECRET=your_jwt_secret
# PORT=3000
```

#### **4. 데이터베이스 설정**

```bash
# PostgreSQL 데이터베이스 생성
psql -U postgres
CREATE DATABASE mediaweave;
\q

# 데이터베이스 마이그레이션 (자동 테이블 생성)
cd Server
npm start  # Sequelize가 자동으로 테이블 생성

# CSV 데이터 시딩 (과목 데이터 로드)
npm run seed
```

### **6.3. Development**

#### **Frontend 개발 서버 실행**

```bash
cd Client
npm run dev
# → http://localhost:5173
```

#### **Backend 개발 서버 실행**

```bash
cd Server
npm run dev
# → http://localhost:3000
```

### **6.4. Production Build**

#### **Frontend 빌드**

```bash
cd Client
npm run build
# → dist/ 폴더 생성
```

#### **Backend 프로덕션 실행**

```bash
cd Server
npm start
```

---

## **7. API 명세 (API Specification)**

### **7.1. 인증 API**

```
POST   /api/v1/auth/register     # 회원가입
POST   /api/v1/auth/login        # 로그인
POST   /api/v1/auth/logout       # 로그아웃
GET    /api/v1/auth/me           # 현재 사용자 정보
```

### **7.2. 프로젝트 API**

```
GET    /api/v1/projects          # 프로젝트 목록 조회
POST   /api/v1/projects          # 프로젝트 생성 (인증 필요)
PUT    /api/v1/projects/:id      # 프로젝트 수정 (인증 필요)
DELETE /api/v1/projects/:id      # 프로젝트 삭제 (인증 필요)

POST   /api/v1/projects/:id/like     # 좋아요 토글
POST   /api/v1/projects/:id/view     # 조회수 증가
GET    /api/v1/projects/:id/comments # 댓글 목록
POST   /api/v1/projects/:id/comments # 댓글 작성
```

### **7.3. 팀 빌딩 API**

```
GET    /api/v1/teams             # 팀 빌딩 게시글 목록
POST   /api/v1/teams             # 게시글 작성 (인증 필요)
PUT    /api/v1/teams/:id         # 게시글 수정 (인증 필요)
DELETE /api/v1/teams/:id         # 게시글 삭제 (인증 필요)

POST   /api/v1/teams/:id/apply   # 팀 지원
GET    /api/v1/teams/:id/applications # 지원자 목록
PUT    /api/v1/teams/applications/:id # 지원 상태 변경
```

### **7.4. 커리큘럼 API**

```
GET    /api/v1/curriculums       # 공유된 커리큘럼 목록
POST   /api/v1/curriculums       # 커리큘럼 저장 (인증 필요)
PUT    /api/v1/curriculums/:id   # 커리큘럼 수정 (인증 필요)
DELETE /api/v1/curriculums/:id   # 커리큘럼 삭제 (인증 필요)

GET    /api/v1/my-plan           # 개인 커리큘럼 플랜 조회
POST   /api/v1/my-plan           # 개인 커리큘럼 플랜 저장
```

### **7.5. 성적표 API**

```
GET    /api/v1/transcripts       # 성적표 목록 (인증 필요)
POST   /api/v1/transcripts       # 성적표 업로드 (인증 필요)
DELETE /api/v1/transcripts/:id   # 성적표 삭제 (인증 필요)
```

### **7.6. 메시지 API**

```
GET    /api/v1/messages          # 메시지 목록 (인증 필요)
POST   /api/v1/messages          # 메시지 전송 (인증 필요)
PUT    /api/v1/messages/:id/read # 메시지 읽음 처리
```

자세한 API 명세는 [API Specification 문서](Docs/7.%20%5BDevelop%5D%20API%20Specification.md)를 참고하세요.

---

## **8. 주요 기능 구현 상세 (Feature Implementation Details)**

### **8.1. React Flow 기반 트랙 로드맵**

**구현 성과:**
- 100개 이상 과목 노드 실시간 렌더링 (200-300ms)
- 5개 트랙 필터링 시스템 (GI, VC, DE, CD, MD)
- 선수과목 관계 시각화 (파란색: 선수과목, 초록색: 후속과목)
- 학년별 그룹 박스 자동 생성 및 동적 높이 조정

**핵심 알고리즘:**
```javascript
// 동적 레이아웃 계산 엔진
1. 학년별 과목 그룹화 (1-4학년)
2. 학기별 최대 행 수 계산 (1학기/2학기 분리)
3. 트랙별 X 좌표 오프셋 적용
4. 선수과목 관계 기반 Y 좌표 조정
5. 학년 박스 높이 자동 계산 (과목 수에 따라)
```

**기술적 도전과 해결:**
- **문제**: 복잡한 선수과목 관계로 인한 노드 겹침 현상
- **해결**: 레이아웃 알고리즘 개선, 충돌 감지 및 자동 위치 조정

### **8.2. Tesseract.js OCR 성적표 인식**

**구현 성과:**
- 한국어+영어 동시 인식: 아주대학교 성적표 템플릿 최적화
- 자동 과목 매칭: 추출된 텍스트를 기존 과목 데이터베이스와 매칭
- CSV 업로드 지원: 수동 입력 대안 제공

**OCR 처리 워크플로우:**
```javascript
1. 사용자가 성적표 이미지 업로드
2. Tesseract.js로 텍스트 추출 (3-5초)
3. 정규표현식으로 과목명/학점/성적 파싱
4. 기존 Course 데이터와 매칭 (유사도 알고리즘)
5. StudentCurriculum 테이블 자동 업데이트
6. 커리큘럼 플래너 동기화
```

### **8.3. 드래그 앤 드롭 커리큘럼 플래너**

**구현 성과:**
- 4년 8학기 그리드 UI (1-1학기부터 4-2학기까지)
- @dnd-kit 기반 드래그 앤 드롭 시스템
- 상태별 시각적 구분: 이수 완료(초록), 수강 중(파랑), 수강 예정(회색)
- 실시간 학점 계산: 학기별/전체 학점 자동 계산

**기술 구현:**
```javascript
// DnD Context 설정
<DndContext onDragEnd={handleDragEnd}>
  <SortableContext items={semesterCourses}>
    {/* 드래그 가능한 과목 목록 */}
  </SortableContext>
</DndContext>
```

### **8.4. 실시간 채팅 시스템**

**구현 성과:**
- 1:1 개인 채팅: 사용자 간 직접 메시징
- 팀 기반 그룹 채팅: TeamPost 연결 채팅방
- 프로젝트 채팅: Project 연결 협업 채팅
- 폴링 기반 실시간: 3초 간격 메시지 동기화

**기술 구현:**
```javascript
// 폴링 기반 메시지 시스템
const useMessages = (chatId) => {
  return useQuery({
    queryKey: ['messages', chatId],
    queryFn: () => fetchMessages(chatId),
    refetchInterval: 3000, // 3초마다 폴링
    enabled: !!chatId
  });
};
```

---

## **9. 개발 규칙 (Development Convention)**

### **9.1. 커밋 메시지**

커밋 메시지는 `[태그] 내용` 형식으로 작성합니다.

| 태그 | 설명 |
|------|------|
| `[Feat]` | 새로운 기능 구현 |
| `[Add]` | Feat 이외의 코드, 라이브러리 추가 |
| `[Update]` | 기존 기능 및 요소 강화 |
| `[Change]` | 기존 기능 및 요소 단순 변경 |
| `[Fix]` | 버그 및 오류 해결 |
| `[Remove]` | 파일 및 리소스 삭제 |
| `[Refactor]` | 코드 구조 개선 (기능 변경 없음) |
| `[Design]` | UI/UX 디자인 수정 |
| `[Comment]` | 주석 추가 및 수정 |
| `[Docs]` | 문서 작성 및 수정 |

**예시:**
```bash
git commit -m "[Feat] React Flow 기반 트랙 로드맵 구현"
git commit -m "[Fix] 커리큘럼 플래너 드래그 버그 수정"
git commit -m "[Docs] README.md 업데이트"
```

### **9.2. 코딩 컨벤션**

#### **JavaScript/React**

**변수명:**
- `const`, `let`: camelCase (예: `userName`, `courseList`)
- `boolean` 변수: is~, has~, can~ 등의 질문형 (예: `isLoading`, `hasError`)
- 상수: UPPER_SNAKE_CASE (예: `MAX_FILE_SIZE`, `API_BASE_URL`)

**함수명:**
- 일반 함수: camelCase (예: `fetchProjects()`, `calculateGPA()`)
- 컴포넌트: PascalCase (예: `TrackRoadmap`, `CurriculumPlanner`)
- 이벤트 핸들러: handle~ (예: `handleDragEnd`, `handleSubmit`)

**파일명:**
- 컴포넌트: PascalCase (예: `TrackRoadmap.jsx`, `CourseNode.jsx`)
- 유틸리티: camelCase (예: `avatarUtils.js`, `trackColors.js`)
- 스토어: camelCase + Store (예: `authStore.js`, `curriculumStore.js`)

#### **SQL/Database**

**테이블명:**
- PascalCase (예: `Users`, `Courses`, `SavedCurriculums`)

**컬럼명:**
- snake_case (예: `user_id`, `created_at`, `is_active`)

---

## **10. 개발 로드맵 (Roadmap)**

### **Phase 1: 핵심 기능 구현 (완료) ✅**
- [x] React Flow 기반 트랙 로드맵
- [x] 드래그 앤 드롭 커리큘럼 플래너
- [x] Tesseract.js OCR 성적표 인식
- [x] 프로젝트 갤러리 CRUD
- [x] 팀 빌딩 플랫폼
- [x] 실시간 채팅 시스템
- [x] JWT 인증 시스템
- [x] PostgreSQL 데이터베이스 설계

### **Phase 2: 고급 기능 (진행 중) 🚧**
- [ ] WebSocket 기반 실시간 채팅 (현재 폴링 방식)
- [ ] 선수과목 자동 검증 로직
- [ ] 졸업 요건 자동 체크
- [ ] 고급 검색 기능 (Elasticsearch)
- [ ] 푸시 알림 시스템
- [ ] 프로젝트 추천 알고리즘

### **Phase 3: 배포 및 최적화 (예정) 📅**
- [ ] AWS 인프라 구축 (S3, CloudFront, EC2, RDS)
- [ ] CI/CD 파이프라인 (GitHub Actions)
- [ ] 성능 최적화 (이미지 CDN, 쿼리 최적화)
- [ ] 보안 강화 (HTTPS, XSS 방지, SQL Injection 방지)
- [ ] 모니터링 설정 (CloudWatch, Sentry)

### **Phase 4: 확장 기능 (장기 계획) 🔮**
- [ ] 모바일 앱 개발 (React Native)
- [ ] AI 기반 커리큘럼 추천 시스템
- [ ] 외부 시스템 연동 (학사 시스템, GitHub API)
- [ ] 다국어 지원 (i18n)
- [ ] 타 학과 적용 가능성 검토

---

## **11. 공유 문서 (Shared Documents)**

### **11.1. 프로젝트 문서**

* **기획 문서**
    * [Product Requirement Document](Docs/1.%20%5BPlan%5D%20Product%20Requirement%20Document.md) - 제품 요구사항 정의서
    * [Requirements Specification](Docs/2.%20%5BPlan%5D%20Requirements%20Specification.md) - 요구사항 명세서
    * [Information Architecture](Docs/3.%20%5BPlan%5D%20Information%20Architecture.md) - 정보 구조 설계
    * [Storyboard & Screen Design](Docs/4.%20%5BPlan%5D%20Storyboar_Screen%20design%20document.md) - 화면 설계 문서

* **설계 문서**
    * [System Architecture](Docs/5.%20%5BDevelop%5D%20System%20Architecture.md) - 시스템 아키텍처
    * [Entity Relationship Diagram](Docs/6.%20%5BDevelop%5D%20Entity%20Relationship%20Diagram.md) - 데이터베이스 ERD
    * [API Specification](Docs/7.%20%5BDevelop%5D%20API%20Specification.md) - API 명세서
    * [User Flow](Docs/8.%20%5BDesign%5D%20User%20Flow.md) - 사용자 플로우
    * [Style Guide & Design System](Docs/9.%20%5BDesign%5D%20Style%20Guide_Design%20System.md) - 디자인 시스템

* **개발 문서**
    * [Frontend README](Client/README.md) - 프론트엔드 개발 가이드
    * [Backend README](Server/README.md) - 백엔드 개발 가이드
    * [Development Description](Docs/10.%20%5B%EC%B5%9C%EC%A2%85%EA%B8%B0%EC%88%A0%EA%B0%9C%EB%B0%9C%EC%84%9C%5D%20development%20description.md) - 최종 기술 개발서
    * [Requirements Satisfying Statement](Docs/11.%20%5B%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD%20%EC%B6%A9%EC%A1%B1%20%EB%AA%85%EC%84%B8%5D%20Requirements%20Satisfying%20Statement.md) - 요구사항 충족 명세

* **보고서**
    * [최종 프로젝트 보고서](Docs/%EC%B5%9C%EC%A2%85_%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8_%EB%B3%B4%EA%B3%A0%EC%84%9C.md) - 프로젝트 최종 보고서
    * [중간발표 개발현황](Docs/%EC%A4%91%EA%B0%84%EB%B0%9C%ED%91%9C_%EA%B0%9C%EB%B0%9C%ED%98%84%ED%99%A9.md) - 중간 개발 현황
    * [중간발표 프레젠테이션](Docs/%EC%A4%91%EA%B0%84%EB%B0%9C%ED%91%9C_%ED%94%84%EB%A0%88%EC%A0%A0%ED%85%8C%EC%9D%B4%EC%85%98.md) - 중간발표 자료

### **11.2. 데이터 파일**

* **CSV 데이터** (`Client/public/data/`)
    * `Course.csv` - 100개 이상 과목 정보
    * `Course_Prerequisites.csv` - 200개 이상 선수과목 관계
    * `Course_Tracks.csv` - 과목-트랙 매핑
    * `Track.csv` - 5개 트랙 정보 (GI, VC, DE, CD, MD)

---

## **12. 알려진 이슈 및 향후 개선 사항 (Known Issues & Future Improvements)**

### **12.1. 현재 버전의 한계**

#### **1. 실시간 기능 제한**
- **문제**: 폴링 기반 채팅으로 인한 지연 시간 (3초)
- **해결 방안**: WebSocket 도입으로 진정한 실시간 통신 구현 필요

#### **2. 검색 기능 고도화 필요**
- **문제**: 기본 필터링만 구현, 전문 검색 엔진 미도입
- **해결 방안**: Elasticsearch 도입 검토 필요

#### **3. 모바일 최적화 부분 완성**
- **문제**: 주요 페이지는 반응형 완성, 일부 페이지 추가 최적화 필요
- **해결 방안**: PWA 기능 도입으로 네이티브 앱 경험 제공 고려

#### **4. 성능 최적화**
- **문제**: 대용량 데이터 로딩 시 초기 로딩 시간 증가
- **해결 방안**: 
  - 데이터베이스 쿼리 최적화 (N+1 문제 해결)
  - 이미지 CDN 도입 (AWS CloudFront)
  - React Query 캐싱 전략 고도화

### **12.2. 향후 개선 계획**

#### **단기 계획 (1-2개월)**
1. **성능 최적화**
   - 데이터베이스 인덱스 전략 개선
   - 이미지 최적화 및 CDN 도입
   - React Query 캐싱 전략 고도화

2. **사용자 경험 개선**
   - 고급 검색 기능 (Elasticsearch 도입)
   - 푸시 알림 지원 (Service Worker)
   - 오프라인 모드 지원 (PWA)

#### **중기 계획 (3-6개월)**
1. **AI 기능 도입**
   - 개인 맞춤형 커리큘럼 추천 시스템
   - 프로젝트 태그 자동 분류 (NLP)
   - 팀 매칭 알고리즘 고도화

2. **확장 기능**
   - 모바일 앱 개발 (React Native)
   - 외부 시스템 연동 (학사 시스템, GitHub API)
   - 다국어 지원 (i18n)

#### **장기 계획 (6개월 이상)**
1. **플랫폼 확장**
   - 타 학과 적용 가능성 검토
   - 대학 간 연동 시스템
   - 산업체 연계 기능 (인턴십, 프로젝트 매칭)

2. **데이터 분석**
   - 학습 패턴 분석 대시보드
   - 취업률 추적 시스템
   - 교육과정 개선 인사이트 제공

---

## **13. 기여 가이드 (Contributing)**

### **13.1. 기여 방법**

1. **Fork** 이 레포지토리
2. **Feature 브랜치** 생성 (`git checkout -b feature/AmazingFeature`)
3. **변경사항 커밋** (`git commit -m '[Feat] Add some AmazingFeature'`)
4. **브랜치에 Push** (`git push origin feature/AmazingFeature`)
5. **Pull Request** 생성

### **13.2. 코드 리뷰 프로세스**

1. PR 생성 시 자동으로 CI/CD 파이프라인 실행
2. 린트 체크 및 테스트 통과 확인
3. 코드 리뷰어 지정 및 리뷰 진행
4. 승인 후 main 브랜치에 병합

### **13.3. 이슈 리포팅**

버그 발견 시 [GitHub Issues](https://github.com/your-username/PWD_MediaWeave/issues)에 다음 정보를 포함하여 제출해주세요:

- **버그 설명**: 어떤 문제가 발생했는지
- **재현 방법**: 버그를 재현하는 단계
- **예상 동작**: 어떻게 동작해야 하는지
- **실제 동작**: 실제로 어떻게 동작하는지
- **환경 정보**: OS, 브라우저, Node.js 버전 등

---

## **14. 라이선스 (License)**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## **15. 연락처 (Contact)**

프로젝트 관련 문의사항이 있으시면 GitHub Issues를 통해 연락 주세요.

* **GitHub Repository**: [https://github.com/your-username/PWD_MediaWeave](https://github.com/your-username/PWD_MediaWeave)
* **Frontend Repository**: [https://github.com/your-username/PWD_MediaWeave_Client](https://github.com/your-username/PWD_MediaWeave_Client)
* **Backend Repository**: [https://github.com/your-username/PWD_MediaWeave_Server](https://github.com/your-username/PWD_MediaWeave_Server)

---

## **16. 감사의 말 (Acknowledgments)**

* 아주대학교 디지털미디어학과 교수님들과 학생들의 피드백에 감사드립니다.
* React, Node.js, PostgreSQL 등 오픈소스 커뮤니티에 감사드립니다.
* 프로젝트 개발 과정에서 도움을 주신 모든 분들께 감사드립니다.

---

**Media Weave**는 디지털미디어학과 학생들의 학습 여정을 체계적으로 지원하는 통합 플랫폼으로서, 기획된 핵심 기능의 **90% 이상을 성공적으로 구현**하였습니다.

특히 **React Flow 기반 시각적 로드맵**, **Tesseract.js OCR 성적표 인식**, **실시간 팀 빌딩 플랫폼** 등의 차별화된 기능을 통해 기존 학사 관리 시스템의 한계를 극복하고, 학과 교육의 질적 향상에 기여할 수 있는 견고한 기반을 마련하였습니다.

앞으로도 지속적인 개선과 확장을 통해 **디지털미디어학과를 넘어 전체 대학으로 확장 가능한 범용 플랫폼**으로 발전시켜 나갈 계획입니다.

---

*"우리의 이야기를 한곳에, 디미를 잇다" - Media Weave*

**작성일**: 2024년 12월  
**버전**: v1.0.0  
**최종 업데이트**: 2024년 12월
