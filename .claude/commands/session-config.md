세션 메모리 보존 기간을 설정합니다.

## 입력값
`$ARGUMENTS` — 보존할 일수 (숫자, 예: `30`)

## 실행 순서

1. `$ARGUMENTS`가 비어있거나 숫자가 아니면 현재 설정을 보여주세요:
   - `session-memories/.config.json`이 있으면 읽어서 현재 `retention_days` 값을 출력
   - 없으면 "현재 기본값: 10일" 출력
   - "변경하려면 `/session-config 30` 형식으로 입력하세요." 안내

2. 숫자가 입력됐으면 1 이상인지 확인하세요. 0 이하면 "1일 이상으로 설정해주세요." 안내.

3. `session-memories/` 디렉토리가 없으면 "아직 세션 기록이 없습니다. `/save-session`으로 먼저 세션을 저장해주세요." 라고 안내하고 종료하세요.

4. `session-memories/.config.json`을 아래 형식으로 저장하세요:
   ```json
   {
     "retention_days": {입력한 숫자},
     "updated_at": "{현재 날짜 YYYY-MM-DD}"
   }
   ```

5. 새 설정 기준으로 만료된 세션 파일들을 즉시 정리하세요:
   - `forever.md`와 `.config.json`은 제외
   - 오늘 날짜 기준으로 `retention_days`일보다 오래된 파일 삭제
   - 삭제된 파일 목록을 알려주세요

6. "보존 기간이 {N}일로 설정되었습니다." 라고 마무리하세요.
