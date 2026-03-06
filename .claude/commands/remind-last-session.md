session-memories 디렉토리에서 가장 최근 세션 파일을 불러와 내용을 보여주세요.

## 실행 순서

1. `session-memories/` 디렉토리가 존재하는지 확인하세요.
   없으면 "아직 저장된 세션이 없습니다. /save-session으로 현재 세션을 저장해보세요." 라고 안내하세요.

2. `session-memories/` 안에서 `forever.md`를 제외하고,
   파일명이 `YYYY-MM-DD_HH-MM-SS.md` 형식인 파일들 중 **가장 최근 파일**을 찾으세요:
   ```bash
   ls session-memories/*.md 2>/dev/null | grep -v forever.md | sort | tail -1
   ```

3. 파일이 없으면 "저장된 세션 기록이 없습니다." 라고 안내하세요.

4. 파일을 읽어서 전체 내용을 보여주세요.

5. `session-memories/forever.md`가 있으면 구분선 후에 함께 출력하세요:
   ```
   ---
   ## 📌 항상 기억할 사항 (forever.md)
   {forever.md 내용}
   ```

6. 마지막으로 "이전 세션 기억을 불러왔습니다. 이어서 작업할게요!" 라고 마무리하세요.
