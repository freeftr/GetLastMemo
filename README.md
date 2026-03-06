# 🧠 session-memory-for-claude

> Claude Code(클로드 코드)에서 LLM 코딩 세션의 기억을 저장하고 복원하는 슬래시커맨드 도구

CLI에서 Claude Code로 코딩하다 보면 세션이 닫히면 이전 컨텍스트가 사라지는 문제가 있습니다.  
이 도구는 **세션의 진행 상황, 할 일, 핵심 정보를 마크다운으로 저장**하고, 다음 세션에서 바로 불러올 수 있게 해줍니다.

---

## ✨ 기능

| 커맨드 | 설명 |
|--------|------|
| `/save-session` | 현재 세션을 마크다운 파일로 저장 |
| `/remind-last-session` | 가장 최근 세션 기억 불러오기 |
| `/remind-custom [파일명]` | 특정 세션 파일 지정해서 불러오기 |
| `/remember-forever [내용]` | 모든 세션에서 항상 참조할 항목 누적 저장 |
| `/session-config [일수]` | 세션 보존 기간 커스텀 설정 |

---

## 📦 설치

### 방법 1: 특정 프로젝트에 설치

```bash
# 이 저장소를 클론
git clone https://github.com/your-username/session-memory-for-claude.git

# 원하는 프로젝트 디렉토리에 설치
./session-memory-for-claude/install.sh /path/to/your/project

# 또는 현재 디렉토리에 설치
cd /path/to/your/project
/path/to/session-memory-for-claude/install.sh
```

### 방법 2: 수동 설치

프로젝트 루트에 `.claude/commands/` 디렉토리를 만들고,
이 저장소의 `.claude/commands/` 안에 있는 `.md` 파일들을 복사하면 됩니다.

```bash
mkdir -p .claude/commands
cp session-memory-for-claude/.claude/commands/*.md .claude/commands/
```

---

## 🗂️ 디렉토리 구조

설치 후 프로젝트에 아래 구조가 생성됩니다:

```
your-project/
├── .claude/
│   └── commands/
│       ├── save-session.md          ← /save-session
│       ├── remind-last-session.md   ← /remind-last-session
│       ├── remind-custom.md         ← /remind-custom
│       ├── remember-forever.md      ← /remember-forever
│       └── session-config.md        ← /session-config
└── session-memories/
    ├── .config.json                 ← 보존 기간 설정
    ├── forever.md                   ← 영구 기억 (만료 없음)
    ├── 2025-03-06_09-00-00.md
    ├── 2025-03-06_14-30-00.md
    └── ...
```

---

## 📖 사용 예시

### 세션 시작할 때
```
/remind-last-session
```
→ 지난 세션에서 무엇을 했는지, 다음에 할 일이 무엇인지 바로 파악

### 세션 마칠 때
```
/save-session
```
→ Claude가 이번 세션 내용을 요약해서 `session-memories/2025-03-06_18-00-00.md`로 저장

### 특정 날짜 세션 불러오기
```
/remind-custom 2025-03-01_10-00-00
```

### 항상 기억해야 할 것 등록
```
/remember-forever 이 프로젝트는 항상 Node.js 22 LTS 사용. pnpm 패키지 매니저 필수.
```
→ `forever.md`에 누적 저장됨. `/save-session`, `/remind-last-session` 호출 시 항상 함께 출력

### 보존 기간 변경
```
/session-config 30
```
→ 최근 30일치 세션 보관 (기본값: 10일)

---

## 📄 세션 파일 형식

저장되는 마크다운 파일 형식:

```markdown
# 세션 메모리
**날짜**: 2025-03-06
**저장 시각**: 18:00:00

---

## ✅ 이번 세션에서 한 일
- 사용자 인증 API 엔드포인트 구현 완료
- JWT 토큰 검증 로직 버그 수정

## 📋 다음에 해야 할 일
- 이메일 인증 플로우 구현
- 테스트 코드 작성 (auth.test.ts)

## ⚠️ 필수 참고 사항
- DB_HOST 환경변수는 .env.local에서 관리
- users 테이블 마이그레이션 아직 미적용 상태

## 🔑 다음 세션을 위한 핵심 정보
- 작업 중인 파일: src/api/auth/login.ts
- 현재 브랜치: feature/user-auth
- 막힌 부분: refresh token rotation 로직
```

---

## ⚙️ 설정 파일

`session-memories/.config.json`:

```json
{
  "retention_days": 10,
  "updated_at": "2025-03-06"
}
```

- `retention_days`: 세션 파일 보존 기간 (일). `/session-config` 커맨드로 변경 가능
- 기간이 지난 세션만 자동 삭제됨. 수동 삭제 불가 (보호됨)

---

## 🔒 보존 정책

- 세션 파일은 **`retention_days`가 지난 것만** 자동 삭제됩니다
- `forever.md`는 자동 삭제 대상에서 제외됩니다
- 파일을 직접 삭제하고 싶으면 자유롭게 삭제하세요

---

## 💡 팁

- **세션 시작 루틴**: Claude Code를 열면 항상 `/remind-last-session`으로 시작하세요
- **세션 종료 루틴**: 작업 마무리 전 `/save-session`으로 저장하세요
- **팀 공유**: `session-memories/`를 `.gitignore`에 추가해 개인 기억은 로컬에만 보관하세요
- **프로젝트별 설정**: 프로젝트마다 `retention_days`를 다르게 설정할 수 있습니다

---

## 🤝 기여

PR과 이슈 환영합니다!

---

## 📜 라이선스

MIT
