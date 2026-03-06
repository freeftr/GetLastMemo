# session-memory-for-claude

Claude Code로 이 프로젝트를 개발할 때 참조하는 컨텍스트 파일입니다.

## 프로젝트 개요

LLM 코딩 세션의 기억을 저장/복원하는 Claude Code 슬래시커맨드 도구.
별도 런타임 없이 `.claude/commands/*.md` 마크다운 프롬프트만으로 동작.

## 핵심 설계 원칙

1. **런타임 불필요** — 슬래시커맨드는 마크다운 프롬프트. bash 명령은 Claude가 직접 실행
2. **글로벌 설치** — `~/.claude/commands/`에 한 번 설치하면 모든 프로젝트에서 사용 가능
3. **프로젝트별 기억** — `session-memories/`는 각 프로젝트 루트에 독립 생성
4. **forever.md 불멸** — 어떤 커맨드도 forever.md를 자동 삭제하지 않음
5. **항상 함께 출력** — save/remind 시 forever.md 내용을 항상 마지막에 출력

## 파일 구조

```
이 저장소:
.claude/commands/       ← 슬래시커맨드 (마크다운 프롬프트)
install.sh              ← ~/.claude/commands/에 글로벌 설치
README.md
CLAUDE.md               ← 이 파일

설치 후 (~/.claude/commands/에 복사됨):
~/.claude/commands/
  save-session.md
  remind-last-session.md
  remind-custom.md
  remember-forever.md
  session-config.md

각 프로젝트에서 런타임 생성:
{project}/session-memories/
  .config.json          ← retention_days 설정
  forever.md            ← 영구 기억
  YYYY-MM-DD_HH-MM-SS.md ← 세션 파일
```

## GitHub repo description

`Save and restore Claude Code session memory across conversations using slash commands`
