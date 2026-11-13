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
                │   ├── init.lua
                │   ├── globals.lua
                │   └── options.lua
                └── plugins/
                    └── init.lua
```

---

## 사용 방법 (Chezmoi 워크플로우)

### 1. 초기 설치 및 적용 (최초 1회)

```powershell
chezmoi init --apply https://github.com/seolman/dotfiles.git
```

### 2. 원격 저장소(GitHub)의 최신 변경 사항 받아서 로컬에 적용하기

다른 환경이나 원격에서 수정된 내용을 로컬(`~/.local/share/chezmoi`)로 `git pull` 받고 실제 홈 디렉토리(`~/AppData/Local/nvim` 등)에 바로 반영합니다:

```powershell
# 원격 변경 사항 미리 확인
chezmoi git -- fetch
chezmoi diff

# git pull + chezmoi apply를 한 번에 수행
chezmoi update
```

### 3. 로컬 설정 파일(`~/AppData/Local/nvim` 등)을 직접 수정했을 때 반영하기

`~/.local/share/chezmoi`가 아니라 실제 적용 경로(예: `~/AppData/Local/nvim`)에서 직접 파일을 수정하거나 새 파일을 추가했을 때는 **`re-add`** 또는 **`add`**로 chezmoi 소스 디렉토리에 가져옵니다.

```powershell
# [확인] 로컬 파일과 chezmoi 소스 간의 차이점 확인
chezmoi status
chezmoi diff

# [방법 A] 이미 chezmoi가 관리 중인 파일들의 수정 사항만 한 번에 소스로 가져오기 (권장)
chezmoi re-add

# [방법 B] 새로 만든 파일이나 특정 파일/폴더를 chezmoi 관리 대상에 추가(또는 갱신)하기
chezmoi add ~/AppData/Local/nvim
# 또는 특정 파일만 지정:
# chezmoi add ~/AppData/Local/nvim/lua/config/options.lua
```

> **참고**: `chezmoi edit <파일경로>` (예: `chezmoi edit ~/AppData/Local/nvim/init.lua`)를 사용하면 소스 디렉토리의 파일을 바로 열어서 수정할 수 있고, 그 후 `chezmoi apply`로 로컬에 반영할 수도 있습니다.

### 4. Git 커밋 및 푸시하기 (`chezmoi git`)

`re-add` 또는 `add`로 소스 디렉토리(`~/.local/share/chezmoi`)에 변경 사항을 가져온 뒤 GitHub에 올리는 방법입니다.

#### 방법 A: 현재 위치에서 바로 `chezmoi git` 실행 (가장 간편)
`chezmoi git -- <git 명령어>`를 사용하면 폴더를 이동하지 않고도 `~/.local/share/chezmoi` 내부에서 Git 명령어를 실행합니다.

```powershell
chezmoi git -- status
chezmoi git -- add .
chezmoi git -- commit -m "chore(nvim): 설정 업데이트"
chezmoi git -- push
```

#### 방법 B: `chezmoi cd`로 소스 디렉토리에 이동해서 실행
```powershell
chezmoi cd
# ~/.local/share/chezmoi 경로의 셸이 열림
git status
git add .
git commit -m "chore(nvim): 설정 업데이트"
git push
exit
```
