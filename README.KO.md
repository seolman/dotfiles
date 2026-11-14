# dotfiles

[English](README.md) | [한국어](README.KO.md)

`chezmoi` 기반의 멀티 플랫폼(Windows → Linux → macOS) dotfiles 저장소입니다.

## 디렉토리 구조

```text
.
├── .chezmoi.toml.tmpl          # chezmoi 설정 템플릿 (OS 감지 및 기본 셸 설정)
├── .chezmoiignore              # OS별 제외 대상 설정 (README, OS 전용 경로 등)
├── .gitattributes              # 크로스 플랫폼 줄바꿈(LF/CRLF) 설정
├── AGENTS.md                   # AI 코딩 에이전트 작업 규칙
├── LICENSE.md                  # MIT 라이선스
├── README.md                   # 영문 문서
├── README.KO.md                # 한국어 문서
├── AppData/
│   └── Local/
│       └── nvim/               # Windows Neovim 설정 (%LOCALAPPDATA%\nvim)
│           ├── init.lua
│           └── lua/
│               ├── config/
│               │   ├── init.lua
│               │   ├── globals.lua
│               │   ├── options.lua
│               │   └── lsp.lua
│               └── plugins/
│                   └── init.lua
└── dot_config/
    └── tmux/
        └── tmux.conf           # Linux tmux 설정 (~/.config/tmux/tmux.conf)
```

---

## Neovim (Windows — 순정 `vim.pack` & Native LSP)

**Neovim 0.13**의 내장 패키지 매니저(`vim.pack`)로 [`neovim/nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig)만 설치하고, 순정 `vim.lsp.config` / `vim.lsp.enable` API로 구성했습니다.

- **기본 활성화된 언어 서버** (`PATH`에 실행 파일이 있으면 자동 연결): `lua_ls`, `ts_ls`, `pyright`, `basedpyright`, `clangd`, `rust_analyzer`, `gopls`
- **`LspAttach` 시 활성화되는 네이티브 기능**:
  - 네이티브 자동 완성: `vim.lsp.completion.enable(..., { autotrigger = true })` (`<C-n>` / `<C-p>` 이동, `<C-y>` 선택 확정)
  - 네이티브 Inlay Hints: `vim.lsp.inlay_hint.enable(true)` (`grh`로 현재 버퍼 토글)
- **패키지 관리 명령어 (`vim.pack`)**:
  - `:packupdate` — 플러그인 업데이트 확인 및 리뷰 (`:write`로 적용 확정, `:quit`으로 취소)
  - `:packupdate ++offline` — 설치된 플러그인 목록/버전 오프라인 조회
  - `:packdel <name>` / `:packdel ++all` — 비활성 플러그인 삭제

| 단축키 | 모드 | 동작 |
| :--- | :--- | :--- |
| `grn` | Normal | 심볼 이름 변경 (`vim.lsp.buf.rename()`) |
| `gra` | Normal / Visual | 코드 액션 실행 (`vim.lsp.buf.code_action()`) |
| `grr` | Normal | 참조 목록 찾기 (`vim.lsp.buf.references()`) |
| `gri` | Normal | 구현부로 이동 (`vim.lsp.buf.implementation()`) |
| `grt` | Normal | 타입 정의로 이동 (`vim.lsp.buf.type_definition()`) |
| `grx` | Normal | CodeLens 실행 (`vim.lsp.codelens.run()`) |
| `grh` | Normal | Inlay Hints 표시 토글 (`vim.lsp.inlay_hint`) |
| `gO` | Normal | 문서 심볼 목차 보기 (`vim.lsp.buf.document_symbol()`) |
| `K` | Normal | 커서 아래 문서(Hover) 보기 (`vim.lsp.buf.hover()`) |
| `<C-]>` / `<C-w>]` | Normal | 정의로 이동 / 창 분할 후 정의로 이동 (`tagfunc`) |
| `<C-s>` | Insert / Select | 함수 시그니처 도움말 (`vim.lsp.buf.signature_help()`) |
| `gq` | Normal / Visual | 코드 포맷팅 (`formatexpr`) |
| `]d` / `[d` | Normal | 다음 / 이전 진단(Diagnostic)으로 이동 |
| `<C-w>d` | Normal | 현재 줄 진단 메시지 플로팅 창 보기 |

---

## tmux (Linux)

외부 플러그인 없이 순정 기능만으로 구성한 Vim 모션 중심 tmux 설정입니다 (`~/.config/tmux/tmux.conf`). TrueColor/Neovim 연동과 배경이 투명한 상단 상태바를 포함합니다.

> **참고**: 기존 `~/.tmux.conf`가 있다면 삭제해야 tmux가 `~/.config/tmux/tmux.conf`를 자동으로 불러옵니다. OSC 52를 지원하지 않는 로컬 터미널에서도 클립보드를 연동하려면 `wl-clipboard`(Wayland) 또는 `xclip`/`xsel`(X11)을 설치하세요.

| 단축키 | 동작 |
| :--- | :--- |
| `Ctrl-g` | Prefix 키 (`Ctrl-g Ctrl-g`로 실제 `Ctrl-g` 전달) |
| `Prefix` + `v` / `s` | 세로 분할(좌/우) / 가로 분할(상/하) |
| `Prefix` + `h` / `j` / `k` / `l` | Vim 모션으로 패널 이동 |
| `Prefix` + `H` / `J` / `K` / `L` | 패널 크기 조절 (5칸 단위, 연속 입력 가능) |
| `Prefix` + `c` / `Tab` / `S` | 현재 경로로 새 창 / 이전 창 전환 / 세션 트리 |
| `Prefix` + `M-h` / `M-l` | 창 위치 좌/우 이동 |
| `Prefix` + `[` 또는 `Esc` | Vi 복사 모드 진입 (`v` 문자, `V` 줄, `C-v` 블록, `y` 복사) |
| `Prefix` + `r` | `~/.config/tmux/tmux.conf` 설정 다시 불러오기 |

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
