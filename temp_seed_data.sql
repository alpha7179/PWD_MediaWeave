
---

## 8. 시드 데이터 (Seed Data)

### 8.1. 트랙 초기 데이터

```sql
-- 5대 트랙 데이터 삽입
INSERT INTO tracks (track_id, initials, name_ko, name_en, description) VALUES
(1, 'GI', '게임앤인터랙티브콘텐츠', 'Game & Interactive Contents', '게임 및 인터랙티브 미디어 제작 전문 트랙'),
(2, 'VC', '영상콘텐츠', 'Visual Contents', '영화, 드라마, 광고 등 영상 콘텐츠 제작 전문 트랙'),
(3, 'DE', '디지털엔터테인먼트', 'Digital Entertainment', '디지털 엔터테인먼트 기획 및 제작 전문 트랙'),
(4, 'CD', '콘텐츠디자인', 'Contents Design', 'UX/UI 및 콘텐츠 디자인 전문 트랙'),
(5, 'MD', '미디어아트', 'Media Art', '미디어 아트 및 실험적 콘텐츠 제작 전문 트랙');
```

### 8.2. 전공 초기 데이터

```sql
-- 전공 데이터 삽입
INSERT INTO majors (major_id, name, type, total_credits, required_credits, description) VALUES
(1, '디지털미디어', '심화', 130, 66, '디지털 미디어 콘텐츠 제작 및 기술 전문 심화 전공'),
(2, '디지털미디어', '일반', 130, 45, '디지털 미디어 기초 및 응용 일반 전공'),
(3, '디지털휴먼', '마이크로', 21, 21, 'AI 기반 디지털 휴먼 제작 마이크로디그리');
```

### 8.3. 교과목 초기 데이터

```sql
-- 1학년 1학기 과목
INSERT INTO courses (course_code, name_ko, name_en, credit, class_type, grade_level, semester, course_category, is_required, description) VALUES
('CSE101', '프로그래밍기초', 'Introduction to Programming', 3, 'Lecture', 1, 1, '전필', TRUE, 'Python 기반 프로그래밍 기초'),
('DM101', '디지털미디어개론', 'Introduction to Digital Media', 3, 'Lecture', 1, 1, '전필', TRUE, '디지털 미디어의 기본 개념 및 역사'),
('DM102', '디자인씽킹', 'Design Thinking', 3, 'PBL', 1, 1, '전필', TRUE, '문제 해결을 위한 디자인 사고 방법론'),
('ART101', '드로잉기초', 'Basic Drawing', 2, 'Lab', 1, 1, '전선', FALSE, '기초 드로잉 및 스케치 기법');

-- 1학년 2학기 과목
INSERT INTO courses (course_code, name_ko, name_en, credit, class_type, grade_level, semester, course_category, is_required, description) VALUES
('CSE102', '자료구조', 'Data Structures', 3, 'Lecture', 1, 2, '전필', TRUE, '기본 자료구조 및 알고리즘'),
('DM103', '디지털이미지처리', 'Digital Image Processing', 3, 'Lab', 1, 2, '전필', TRUE, 'Photoshop 기반 이미지 편집 및 처리'),
('DM104', '영상제작기초', 'Basic Video Production', 3, 'Lab', 1, 2, '전선', FALSE, '영상 촬영 및 편집 기초'),
('DM105', '3D모델링기초', 'Basic 3D Modeling', 3, 'Lab', 1, 2, '전선', FALSE, 'Blender 기반 3D 모델링 입문');

-- 2학년 1학기 과목
INSERT INTO courses (course_code, name_ko, name_en, credit, class_type, grade_level, semester, course_category, is_required, description) VALUES
('CSE201', '웹프로그래밍', 'Web Programming', 3, 'Lecture', 2, 1, '전필', TRUE, 'HTML, CSS, JavaScript 기반 웹 개발'),
('DM201', '게임엔진프로그래밍', 'Game Engine Programming', 3, 'Lab', 2, 1, '전선', FALSE, 'Unity 기반 게임 개발'),
('DM202', '인터랙션디자인', 'Interaction Design', 3, 'PBL', 2, 1, '전선', FALSE, '사용자 인터랙션 설계 및 프로토타이핑'),
('DM203', '영상편집', 'Video Editing', 3, 'Lab', 2, 1, '전선', FALSE, 'Premiere Pro 기반 영상 편집');

-- 2학년 2학기 과목
INSERT INTO courses (course_code, name_ko, name_en, credit, class_type, grade_level, semester, course_category, is_required, description) VALUES
('CSE202', '데이터베이스', 'Database Systems', 3, 'Lecture', 2, 2, '전필', TRUE, '관계형 데이터베이스 설계 및 SQL'),
('DM204', '모바일앱개발', 'Mobile App Development', 3, 'Lab', 2, 2, '전선', FALSE, 'React Native 기반 모바일 앱 개발'),
('DM205', '3D애니메이션', '3D Animation', 3, 'Lab', 2, 2, '전선', FALSE, 'Maya 기반 3D 애니메이션 제작'),
('DM206', 'UX/UI디자인', 'UX/UI Design', 3, 'PBL', 2, 2, '전선', FALSE, 'Figma 기반 UX/UI 설계');

-- 3학년 1학기 과목
INSERT INTO courses (course_code, name_ko, name_en, credit, class_type, grade_level, semester, course_category, is_required, description) VALUES
('DM301', '게임디자인', 'Game Design', 3, 'PBL', 3, 1, '전선', FALSE, '게임 메커닉 및 레벨 디자인'),
('DM302', 'VR/AR콘텐츠제작', 'VR/AR Contents Production', 3, 'Lab', 3, 1, '전선', FALSE, 'Unity 기반 VR/AR 콘텐츠 개발'),
('DM303', '영상특수효과', 'Visual Effects', 3, 'Lab', 3, 1, '전선', FALSE, 'After Effects 기반 VFX 제작'),
('DM304', '인공지능기초', 'Introduction to AI', 3, 'Lecture', 3, 1, '전선', FALSE, '머신러닝 및 딥러닝 기초');

-- 3학년 2학기 과목
INSERT INTO courses (course_code, name_ko, name_en, credit, class_type, grade_level, semester, course_category, is_required, description) VALUES
('DM305', '몰입형미디어프로그래밍', 'Immersive Media Programming', 3, 'PBL', 3, 2, '전선', FALSE, 'VR/AR 고급 프로그래밍'),
('DM306', '컴퓨터그래픽스', 'Computer Graphics', 3, 'Lecture', 3, 2, '전선', FALSE, '3D 그래픽스 이론 및 렌더링'),
('DM307', '사운드디자인', 'Sound Design', 3, 'Lab', 3, 2, '전선', FALSE, '게임 및 영상 사운드 제작'),
('DM308', '디지털휴먼제작', 'Digital Human Production', 3, 'Lab', 3, 2, '전선', FALSE, 'AI 기반 디지털 휴먼 모델링');

-- 4학년 1학기 과목
INSERT INTO courses (course_code, name_ko, name_en, credit, class_type, grade_level, semester, course_category, is_required, description) VALUES
('DM401', '캡스톤디자인1', 'Capstone Design 1', 3, 'PBL', 4, 1, '전필', TRUE, '졸업 작품 기획 및 프로토타입 제작'),
('DM402', '포트폴리오제작', 'Portfolio Production', 2, 'Seminar', 4, 1, '전선', FALSE, '취업용 포트폴리오 제작 및 발표'),
('DM403', '게임프로젝트', 'Game Project', 3, 'PBL', 4, 1, '전선', FALSE, '팀 기반 게임 프로젝트'),
('DM404', '영상프로젝트', 'Video Project', 3, 'PBL', 4, 1, '전선', FALSE, '팀 기반 영상 프로젝트');

-- 4학년 2학기 과목
INSERT INTO courses (course_code, name_ko, name_en, credit, class_type, grade_level, semester, course_category, is_required, description) VALUES
('DM405', '캡스톤디자인2', 'Capstone Design 2', 3, 'PBL', 4, 2, '전필', TRUE, '졸업 작품 완성 및 전시'),
('DM406', '인턴십', 'Internship', 3, 'Field', 4, 2, '전선', FALSE, '산업체 현장 실습'),
('DM407', '창업실습', 'Startup Practice', 3, 'PBL', 4, 2, '전선', FALSE, '스타트업 창업 실습'),
('DM408', '미디어아트프로젝트', 'Media Art Project', 3, 'PBL', 4, 2, '전선', FALSE, '실험적 미디어 아트 제작');
```

### 8.4. 과목-트랙 매핑 데이터

```sql
-- GI 트랙 (게임앤인터랙티브콘텐츠) 과목 매핑
INSERT INTO course_tracks (course_id, track_id, is_core) VALUES
((SELECT course_id FROM courses WHERE course_code = 'CSE101'), 1, TRUE),
((SELECT course_id FROM courses WHERE course_code = 'CSE102'), 1, TRUE),
((SELECT course_id FROM courses WHERE course_code = 'CSE201'), 1, TRUE),
((SELECT course_id FROM courses WHERE course_code = 'DM201'), 1, TRUE),
((SELECT course_id FROM courses WHERE course_code = 'DM301'), 1, TRUE),
((SELECT course_id FROM courses WHERE course_code = 'DM302'), 1, TRUE),
((SELECT course_id FROM courses WHERE course_code = 'DM305'), 1, TRUE),
((SELECT course_id FROM courses WHERE course_code = 'DM403'), 1, TRUE);

-- VC 트랙 (영상콘텐츠) 과목 매핑
INSERT INTO course_tracks (course_id, track_id, is_core) VALUES
((SELECT course_id FROM courses WHERE course_code = 'DM103'), 2, TRUE),
((SELECT course_id FROM courses WHERE course_code = 'DM104'), 2, TRUE),
((SELECT course_id FROM courses WHERE course_code = 'DM203'), 2, TRUE),
((SELECT course_id FROM courses WHERE course_code = 'DM303'), 2, TRUE),
((SELECT course_id FROM courses WHERE course_code = 'DM404'), 2, TRUE);

-- CD 트랙 (콘텐츠디자인) 과목 매핑
INSERT INTO course_tracks (course_id, track_id, is_core) VALUES
((SELECT course_id FROM courses WHERE course_code = 'DM102'), 4, TRUE),
((SELECT course_id FROM courses WHERE course_code = 'DM202'), 4, TRUE),
((SELECT course_id FROM courses WHERE course_code = 'DM206'), 4, TRUE),
((SELECT course_id FROM courses WHERE course_code = 'DM402'), 4, TRUE);
```

### 8.5. 선수과목 관계 데이터

```sql
-- 선수과목 관계 삽입
INSERT INTO course_prerequisites (course_id, pre_course_id, type) VALUES
-- 자료구조의 선수과목: 프로그래밍기초 (필수)
((SELECT course_id FROM courses WHERE course_code = 'CSE102'), 
 (SELECT course_id FROM courses WHERE course_code = 'CSE101'), 'Required'),

-- 웹프로그래밍의 선수과목: 프로그래밍기초 (필수)
((SELECT course_id FROM courses WHERE course_code = 'CSE201'), 
 (SELECT course_id FROM courses WHERE course_code = 'CSE101'), 'Required'),

-- 게임엔진프로그래밍의 선수과목: 프로그래밍기초 (필수), 자료구조 (권장)
((SELECT course_id FROM courses WHERE course_code = 'DM201'), 
 (SELECT course_id FROM courses WHERE course_code = 'CSE101'), 'Required'),
((SELECT course_id FROM courses WHERE course_code = 'DM201'), 
 (SELECT course_id FROM courses WHERE course_code = 'CSE102'), 'Recommended'),

-- 데이터베이스의 선수과목: 자료구조 (필수)
((SELECT course_id FROM courses WHERE course_code = 'CSE202'), 
 (SELECT course_id FROM courses WHERE course_code = 'CSE102'), 'Required'),

-- 모바일앱개발의 선수과목: 웹프로그래밍 (필수)
((SELECT course_id FROM courses WHERE course_code = 'DM204'), 
 (SELECT course_id FROM courses WHERE course_code = 'CSE201'), 'Required'),

-- VR/AR콘텐츠제작의 선수과목: 게임엔진프로그래밍 (필수)
((SELECT course_id FROM courses WHERE course_code = 'DM302'), 
 (SELECT course_id FROM courses WHERE course_code = 'DM201'), 'Required'),

-- 몰입형미디어프로그래밍의 선수과목: VR/AR콘텐츠제작 (필수)
((SELECT course_id FROM courses WHERE course_code = 'DM305'), 
 (SELECT course_id FROM courses WHERE course_code = 'DM302'), 'Required'),

-- 3D애니메이션의 선수과목: 3D모델링기초 (필수)
((SELECT course_id FROM courses WHERE course_code = 'DM205'), 
 (SELECT course_id FROM courses WHERE course_code = 'DM105'), 'Required'),

-- 영상편집의 선수과목: 영상제작기초 (필수)
((SELECT course_id FROM courses WHERE course_code = 'DM203'), 
 (SELECT course_id FROM courses WHERE course_code = 'DM104'), 'Required'),

-- 영상특수효과의 선수과목: 영상편집 (필수)
((SELECT course_id FROM courses WHERE course_code = 'DM303'), 
 (SELECT course_id FROM courses WHERE course_code = 'DM203'), 'Required'),

-- 캡스톤디자인2의 선수과목: 캡스톤디자인1 (필수)
((SELECT course_id FROM courses WHERE course_code = 'DM405'), 
 (SELECT course_id FROM courses WHERE course_code = 'DM401'), 'Required');
```

### 8.6. 테스트 사용자 데이터

```sql
-- 관리자 계정
INSERT INTO users (email, password_hash, role, is_active) VALUES
('admin@ajou.ac.kr', '$2b$10$abcdefghijklmnopqrstuvwxyz1234567890', 'ADMIN', TRUE);

-- 교수 계정
INSERT INTO users (email, password_hash, role, is_active) VALUES
('prof.kim@ajou.ac.kr', '$2b$10$abcdefghijklmnopqrstuvwxyz1234567890', 'PROFESSOR', TRUE),
('prof.lee@ajou.ac.kr', '$2b$10$abcdefghijklmnopqrstuvwxyz1234567890', 'PROFESSOR', TRUE);

-- 교수 상세 정보
INSERT INTO professors (professor_id, user_id, name_ko, name_en, research_areas, email, office) VALUES
(10001, (SELECT user_id FROM users WHERE email = 'prof.kim@ajou.ac.kr'), 
 '김교수', 'Kim Professor', '게임 개발, 인공지능', 'prof.kim@ajou.ac.kr', '팔달관 501호'),
(10002, (SELECT user_id FROM users WHERE email = 'prof.lee@ajou.ac.kr'), 
 '이교수', 'Lee Professor', '영상 제작, VFX', 'prof.lee@ajou.ac.kr', '팔달관 502호');

-- 학생 계정
INSERT INTO users (email, password_hash, role, is_active) VALUES
('student1@ajou.ac.kr', '$2b$10$abcdefghijklmnopqrstuvwxyz1234567890', 'STUDENT', TRUE),
('student2@ajou.ac.kr', '$2b$10$abcdefghijklmnopqrstuvwxyz1234567890', 'STUDENT', TRUE),
('student3@ajou.ac.kr', '$2b$10$abcdefghijklmnopqrstuvwxyz1234567890', 'STUDENT', TRUE);

-- 학생 상세 정보
INSERT INTO students (student_id, user_id, name, major_id, track_id, grade_level, enrollment_status, credits, gpa) VALUES
(202221001, (SELECT user_id FROM users WHERE email = 'student1@ajou.ac.kr'), 
 '홍길동', 1, 1, 3, '재학', 72, 3.85),
(202221002, (SELECT user_id FROM users WHERE email = 'student2@ajou.ac.kr'), 
 '김영희', 1, 2, 2, '재학', 45, 4.12),
(202221003, (SELECT user_id FROM users WHERE email = 'student3@ajou.ac.kr'), 
 '이철수', 1, 4, 4, '재학', 110, 3.67);
```

### 8.7. 테스트 프로젝트 데이터

```sql
-- 샘플 프로젝트
INSERT INTO projects (project_id, user_id, title, summary, content_markdown, track_type, tech_stacks, thumbnail_url, views, likes) VALUES
('proj-001', 
 (SELECT user_id FROM users WHERE email = 'student1@ajou.ac.kr'),
 'Media Weave Platform',
 '학과 커뮤니티 및 포트폴리오 플랫폼',
 '# Media Weave Platform\n\n디지털미디어학과 학생들을 위한 통합 플랫폼입니다.',
 'GI',
 '["React", "Node.js", "PostgreSQL", "TypeScript"]'::jsonb,
 'https://example.com/thumbnail1.jpg',
 1250,
 142);

INSERT INTO projects (project_id, user_id, title, summary, content_markdown, track_type, tech_stacks, thumbnail_url, views, likes) VALUES
('proj-002', 
 (SELECT user_id FROM users WHERE email = 'student2@ajou.ac.kr'),
 '단편 영화: 디지털 드림',
 'SF 장르의 단편 영화 작품',
 '# 단편 영화: 디지털 드림\n\n미래 사회를 배경으로 한 SF 단편 영화입니다.',
 'VC',
 '["Premiere Pro", "After Effects", "DaVinci Resolve"]'::jsonb,
 'https://example.com/thumbnail2.jpg',
 890,
 76);
```

### 8.8. 시드 데이터 실행 순서

데이터베이스 초기화 시 다음 순서로 SQL을 실행:

1. **확장 설치**
```sql
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION IF NOT EXISTS btree_gin;
```

2. **테이블 생성** (섹션 5의 DDL 순서대로)
   - users
   - professors, students
   - majors, tracks
   - courses
   - 매핑 테이블 (course_professors, course_tracks, course_majors, course_prerequisites)
   - curriculums, projects, project_media, project_team_members, project_likes
   - team_building_posts

3. **외래키 제약조건 추가** (섹션 6)

4. **인덱스 생성** (섹션 7)

5. **시드 데이터 삽입** (섹션 8)
   - tracks
   - majors
   - courses
   - course_tracks
   - course_prerequisites
   - users (admin, professors, students)
   - professors, students
   - projects (테스트 데이터)

### 8.9. 전체 초기화 스크립트

```sql
-- 데이터베이스 초기화 (주의: 모든 데이터 삭제)
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;

-- 확장 설치
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION IF NOT EXISTS btree_gin;

-- 이후 섹션 5, 6, 7, 8의 SQL을 순서대로 실행
```

---

## 9. 데이터베이스 마이그레이션 가이드

### 9.1. 개발 환경 설정

```bash
# PostgreSQL 설치 확인
psql --version

# 데이터베이스 생성
createdb mediaweave_dev

# 초기화 스크립트 실행
psql -d mediaweave_dev -f init_schema.sql
psql -d mediaweave_dev -f init_seed_data.sql
```

### 9.2. 마이그레이션 도구 (Node.js 예시)

```javascript
// migrations/001_create_tables.js
exports.up = async (knex) => {
  // 테이블 생성 로직
};

exports.down = async (knex) => {
  // 롤백 로직
};
```

### 9.3. 백업 및 복구

```bash
# 백업
pg_dump -U postgres -d mediaweave_dev -F c -f backup.dump

# 복구
pg_restore -U postgres -d mediaweave_dev -c backup.dump
```

---

## 10. 성능 최적화 체크리스트

- [ ] 모든 외래키에 인덱스 생성 완료
- [ ] 자주 조회되는 컬럼에 단일 인덱스 생성
- [ ] 복합 조회 쿼리에 복합 인덱스 생성
- [ ] JSONB 컬럼에 GIN 인덱스 생성
- [ ] 부분 인덱스로 불필요한 데이터 제외
- [ ] 커버링 인덱스로 인덱스 온리 스캔 활용
- [ ] EXPLAIN ANALYZE로 쿼리 성능 분석
- [ ] 사용되지 않는 인덱스 정기 점검
- [ ] 인덱스 크기 모니터링
- [ ] 정기적인 VACUUM 및 ANALYZE 실행
