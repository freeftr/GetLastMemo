사용자가 입력한 내용을 session-memories/forever.md에 누적 저장하세요. 이 파일은 만료되지 않으며 모든 세션에서 항상 참조됩니다.

## 입력값
`$ARGUMENTS` — 영구적으로 기억할 내용

## 실행 순서

1. `$ARGUMENTS`가 비어있으면 현재 `forever.md` 내용을 보여주고 "기억할 내용을 입력해주세요. 예: `/remember-forever 항상 TypeScript strict 모드 사용`" 라고 안내하세요.

2. `session-memories/` 디렉토리가 없으면 "아직 세션 기록이 없습니다. `/save-session`으로 먼저 세션을 저장해주세요." 라고 안내하고 종료하세요.

3. `session-memories/forever.md`가 없으면 아래 헤더로 새로 생성하세요:
   ```markdown
   # 📌 항상 기억할 사항
   > 이 파일은 만료되지 않습니다. 모든 세션에서 참조됩니다.

   ---
   ```

4. 현재 날짜/시각과 함께 내용을 파일 끝에 추가하세요:
   ```markdown
   ### {YYYY-MM-DD HH:MM} 추가
   {$ARGUMENTS 내용}

   ```

5. 저장 후 `forever.md` 전체 내용을 출력해서 현재까지 누적된 항목을 확인시켜주세요.

6. "영구 기억에 추가되었습니다. 앞으로 모든 세션에서 이 내용을 참고할게요!" 라고 마무리하세요.
