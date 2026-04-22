# EduBot — AI-Powered Study Assistant 🤖📚

A modern, AI-powered chatbot web application designed to help students with their studies.

## Features

- **AI-Powered Responses** — Uses Google Gemini API for intelligent, context-aware answers
- **Smart Fallback** — Predefined responses for common queries (greetings, school info, study tips) when AI is unavailable
- **Conversation History** — Chat sessions are stored in your browser's local storage
- **Responsive Design** — Works beautifully on desktop and mobile
- **Typing Indicator** — Animated "EduBot is thinking…" indicator
- **Suggestion Chips** — Quick-start prompts on the welcome screen
- **Multiple Conversations** — Create and switch between different chat sessions
- **Dark Theme** — Premium dark UI inspired by modern chat applications

## File Structure

```
EduBot/
├── index.html      # Main HTML structure
├── style.css       # All styling (dark theme, animations, responsive)
├── script.js       # Application logic, AI integration, fallback responses
└── README.md       # This file
```

## How to Run

### Option 1: Direct Open (Fallback Mode)
1. Open `index.html` in any modern web browser (Chrome, Edge, Firefox).
2. The chatbot will work immediately using predefined fallback responses.

### Option 2: With AI (Recommended)
1. Open `index.html` in a browser.
2. Click the **⚙ Settings** button in the sidebar.
3. Paste your **Google Gemini API Key**.
   - Get a free key at: [aistudio.google.com/apikey](https://aistudio.google.com/apikey)
4. Click **Save & Connect**.
5. The status indicator will turn green ("AI Online — Gemini").
6. Now all responses are powered by the Gemini AI model!

### Option 3: Live Server (Optional)
If you have VS Code, install the **Live Server** extension and right-click `index.html` → "Open with Live Server".

## How It Works

1. **User sends a message** → the app tries the Gemini AI API first.
2. **If AI is unavailable** (no API key, network error, etc.) → it checks predefined patterns (greetings, farewells, school queries).
3. **If no pattern matches** → it returns a helpful general response, ensuring the user is **never left without a reply**.

## Tech Stack

- **HTML5** — Semantic structure
- **CSS3** — Custom properties, flexbox, animations, responsive design
- **Vanilla JavaScript** — No frameworks, beginner-friendly
- **Google Gemini API** — Free-tier AI model for intelligent responses

## Predefined Response Categories

| Category | Example Triggers |
|----------|-----------------|
| Greetings | hi, hello, hey |
| Farewell | bye, goodbye, see you |
| Thanks | thank you, thanks |
| School Timings | school timing, college hours |
| Subjects | subject, course, class |
| Exam Tips | exam tips, study advice |
| Identity | who are you, what are you |
