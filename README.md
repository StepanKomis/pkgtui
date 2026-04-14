# pkgtui

A terminal UI for managing packages on Arch Linux (and derivatives like CachyOS, Manjaro, EndeavourOS).
Handles system updates and package installs/removals via `pacman` and `yay` (AUR).

```
╔══════════════════[ pkgtui v1.0 ]═══════════════════╗
║  ██████╗ ██╗  ██╗ ██████╗ ████████╗██╗   ██╗██╗   ║
║  ██╔══██╗██║ ██╔╝██╔════╝ ╚══██╔══╝██║   ██║██║   ║
║  ██████╔╝█████╔╝ ██║  ███╗   ██║   ██║   ██║██║   ║
║  ██╔═══╝ ██╔═██╗ ██║   ██║   ██║   ██║   ██║██║   ║
║  ██║     ██║  ██╗╚██████╔╝   ██║   ╚██████╔╝██║   ║
║  ╚═╝     ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝   ║
║       Arch Linux Package Manager                   ║
╠════════════════════════════════════════════════════╣
║   ╔══════════════════════════════════════════╗     ║
║   ║  ▶ [1] System Update                    ║     ║
║   ╠══════════════════════════════════════════╣     ║
║   ║    [2] Search & Install                  ║     ║
║   ╠══════════════════════════════════════════╣     ║
║   ║    [3] Remove Package                    ║     ║
║   ╠══════════════════════════════════════════╣     ║
║   ║    [4] Exit                              ║     ║
║   ╚══════════════════════════════════════════╝     ║
╚════════════════════════════════════════════════════╝
```

---

> **Vibecoded Notice**
> This tool was vibecoded — designed and written with AI assistance (Claude by Anthropic).
> It works, but treat it like any community script: read it before running, and don't blindly
> `sudo` things you haven't glanced at.

---

## Requirements

- **Arch-based distro** (Arch, CachyOS, Manjaro, EndeavourOS, …)
- `python3` — part of the base system
- [`fzf`](https://github.com/junegunn/fzf) — fuzzy finder (`sudo pacman -S fzf`)
- [`yay`](https://github.com/Jguer/yay) — AUR helper (`sudo pacman -S yay` or from AUR)
- `pacman` — comes with every Arch install
- Terminal size at least **80×24**

## Install

```bash
git clone <this-repo> ~/pkgtui   # or however you got here
cd ~/pkgtui
bash install.sh
```

The script is copied to `~/.local/bin/pkgtui`. Make sure `~/.local/bin` is in your `PATH`:

**fish:**
```fish
fish_add_path ~/.local/bin
```

**bash/zsh:**
```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc  # or ~/.zshrc
```

Then run:
```bash
pkgtui
```

## Uninstall

```bash
bash ~/pkgtui/uninstall.sh
```

---

## Usage

### Navigation

| Key | Action |
|-----|--------|
| `↑` / `↓` | Move selection |
| `Enter` / `Space` | Confirm selection |
| `1`–`4` | Jump directly to menu item |
| `q` / `Esc` | Quit |

### Menu Items

#### [1] System Update
Runs a full system upgrade:
1. `sudo pacman -Syu` — syncs and upgrades all official packages
2. `yay -Syu` — upgrades AUR packages

Live output is shown directly in the terminal (pacman's progress bars, prompts, etc. are all preserved).

#### [2] Search & Install
1. Type a search query in the overlay dialog
2. Results from both official repos and AUR are shown in `fzf`
3. Use arrow keys / type to filter; `Tab` toggles the preview pane (shows full package info)
4. Press `Enter` to install the selected package via `yay -S`

`yay` handles both AUR and official repo packages transparently — no need to distinguish.

#### [3] Remove Package
1. All installed packages are listed in `fzf`
2. `Tab` previews the package's info (`pacman -Qi`)
3. Press `Enter` to remove via `sudo pacman -Rs` (also removes orphaned dependencies)

#### [4] Exit
Exit pkgtui. Also reachable with `q` or `Esc`.

---

## Notes

- Minimum terminal size: **80 columns × 24 rows**. The menu will show an error if the terminal is smaller; just resize and it will redraw.
- `yay -S` is used for installs (handles both official and AUR). `sudo pacman -Rs` is used for removal.
- No config file, no persistent state — just a single executable script.

---

## License

Do whatever you want with it. It's vibecoded anyway.
