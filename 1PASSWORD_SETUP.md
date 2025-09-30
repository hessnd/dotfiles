# 1Password CLI Setup for API Keys

## Overview
Your API keys are now securely stored in 1Password instead of plain text in your shell configuration.

## What Was Done

### 1. API Keys Stored in 1Password
The following API keys have been securely stored as "API Credential" items in your Private vault:
- Anthropic API Key
- OpenAI API Key  
- Kagi API Key
- Groq API Key
- Gemini API Key
- Perplexity API Key

### 2. Secret References File
Created `/Users/nhess/dotfiles/.env.op` with 1Password secret references:
```
ANTHROPIC_API_KEY=op://Private/Anthropic API Key/credential
OPENAI_API_KEY=op://Private/OpenAI API Key/credential
KAGI_API_KEY=op://Private/Kagi API Key/credential
GROQ_API_KEY=op://Private/Groq API Key/credential
GEMINI_API_KEY=op://Private/Gemini API Key/credential
PERPLEXITY_API_KEY=op://Private/Perplexity API Key/credential
```

### 3. Updated Shell Configuration
- Enabled 1Password auto-signin
- Added `op_env()` function to load secret references
- Added `load-keys` alias for convenience
- Removed plain text API keys from zshrc

## How to Use

### Loading API Keys
```bash
# Method 1: Use the alias
load-keys

# Method 2: Use the function directly
op_env

# Method 3: Specify a different file
op_env /path/to/other/.env.op
```

### Verifying Keys Are Loaded
```bash
# Check if a specific key is set
echo "ANTHROPIC_API_KEY is set: ${ANTHROPIC_API_KEY:+YES}"

# Count loaded API keys
env | grep -E "(ANTHROPIC|OPENAI|KAGI|GROQ|GEMINI|PERPLEXITY)_API_KEY" | wc -l
```

### Manual 1Password Commands
```bash
# Sign in to 1Password
op signin

# Check if signed in
op whoami

# List your API credentials
op item list --categories="API Credential"

# Get a specific API key (reveals the secret)
op item get "Anthropic API Key" --reveal

# Test secret injection
op inject --in-file ~/.env.op
```

## Security Benefits

1. **No Plain Text Storage**: API keys are never stored in plain text files
2. **Encrypted at Rest**: Keys are encrypted in 1Password's secure vault
3. **On-Demand Loading**: Keys are only loaded into memory when needed
4. **No History**: Keys don't appear in shell history
5. **Version Control Safe**: .env.op contains only references, not actual secrets

## Troubleshooting

### If keys don't load:
1. Make sure you're signed into 1Password: `op whoami`
2. Sign in if needed: `op signin`
3. Test injection manually: `op inject --in-file ~/.env.op`

### If 1Password session expires:
Your zshrc is configured to automatically sign you back in, but you can also run:
```bash
op signin
```

## Adding New API Keys

1. Store the key in 1Password:
```bash
op item create --category="API Credential" --vault="Private" --title="New Service API Key" credential="your-api-key-here"
```

2. Add reference to `.env.op`:
```
NEW_SERVICE_API_KEY=op://Private/New Service API Key/credential
```

3. Load the updated keys:
```bash
load-keys
```