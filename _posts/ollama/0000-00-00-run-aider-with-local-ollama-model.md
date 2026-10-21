---
title: Run Aider with a local Ollama model
category: Ollama
date: 2026-10-22
---

*Run Aider with a locally downloaded Ollama model for offline coding assistance.*

---

### Install Ollama and Aider

- Install Ollama on Linux:

```bash
$ curl -fsSL https://ollama.com/install.sh | sh
```

- Install Aider using its installer:

```bash
$ curl -LsSf https://aider.chat/install.sh | sh
```

- Alternatively, install Aider with `pipx`:

```bash
$ sudo apt update
$ sudo apt install pipx -y
$ pipx ensurepath
$ pipx install aider-chat
```

- Restart the shell after `pipx ensurepath` if the `aider` command is unavailable.
- Verify the installed Aider version:

```bash
$ aider --version
```

### Download and verify a model

- Download a coding model while connected to the internet:

```bash
$ ollama pull qwen2.5-coder:3b
$ ollama run qwen2.5-coder:3b
```

- Exit the model prompt with `/bye`, then list downloaded models:

```bash
$ ollama list
```

- Pull the selected model before disconnecting from the internet.

### Configure Aider

- Create `~/.aider.conf.yml`:

```yaml
# 1. Model Selection
model: ollama_chat/qwen2.5-coder:3b

# 2. Edit Format
# 'diff' is fast & accurate for 7B/14B models.
# Fall back to 'whole' if the model produces malformed diffs.
edit-format: diff

# 3. Context & Performance Settings
# Set context window size (Qwen 2.5 supports up to 32k/128k, but 8k-16k keeps CPU snappy)
max-chat-history-tokens: 4096

# 4. Environment & Stream Options
stream: true
pretty: true
auto-commits: false

# 5. Git Settings
git: true

# Suppress all environment & model-related warnings
show-model-warnings: false

# Set the default language for model chat responses (e.g., Spanish, French, German, English, etc.)
chat-language: English

read:
  - ~/.codex/AGENTS.md
```

- The `read` entry loads the shared instructions file into Aider's context.
- Disable Aider update checks before working offline:

```bash
$ export AIDER_CHECK_UPDATE=false
```

### Limit concurrent Ollama requests

- Create a systemd override for the Ollama service:

```bash
$ sudo systemctl edit ollama.service
```

- Add the following override:

```ini
[Service]
Environment="OLLAMA_NUM_PARALLEL=1"
Environment="OMP_NUM_THREADS=6"
```

- Reload systemd and restart Ollama:

```bash
$ sudo systemctl daemon-reload
$ sudo systemctl restart ollama
```

- `OLLAMA_NUM_PARALLEL=1` permits one concurrent request per loaded model.
- `OMP_NUM_THREADS=6` is an optional runtime environment setting from this setup.

### Start a coding session

- Change to the project directory before launching Aider:

```bash
$ cd /path/to/repository
$ aider --model ollama_chat/qwen2.5-coder:3b
```

- Add files explicitly with `/add <path>` when needed.
- Use `/commit` to commit changes manually when desired.
- Send a one-shot request without entering the chat prompt:

```bash
$ aider --model ollama_chat/qwen2.5-coder:3b --message "Create a backup script"
```

- Download models and install tools before disconnecting from the internet.

---

[Ollama installation](https://ollama.com/download) · [Aider with Ollama](https://aider.chat/docs/llms/ollama.html) · [Aider configuration](https://aider.chat/docs/config/aider_conf.html)

---
