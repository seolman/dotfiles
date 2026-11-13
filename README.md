# dotfiles

`chezmoi` 기반의 멀티 플랫폼(Windows → Linux → macOS) dotfiles 저장소입니다.

## 디렉토리 구조

```text
.
├── .chezmoi.toml.tmpl          # chezmoi 설정 템플릿 (OS 감지 및 기본 셸 설정)
├── .chezmoiignore              # OS별 제외 대상 설정 (README, OS 전용 경로 등)
├── .gitattributes              # 크로스 플랫폼 줄바꿈(LF/CRLF) 설정
└── AppData/
    └── Local/
        └── nvim/               # Windows Neovim 설정 (%LOCALAPPDATA%\nvim)
            ├── init.lua
            └── lua/
                ├── config/
                │   └── init.lua
                └── plugins/
                    └── init.lua
```

## 사용 방법

### Windows에서 초기화 및 적용

```powershell
chezmoi init --apply https://github.com/seolman/dotfiles.git
```

### 변경 사항 확인 및 반영

```powershell
# 적용될 변경 사항 미리 보기
chezmoi diff

# 로컬 환경에 반영
chezmoi apply
```
