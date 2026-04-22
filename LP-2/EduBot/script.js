/* ═══════════════════════════════════════════
   EduBot — Main Application Logic
   ═══════════════════════════════════════════ */

// ──── DOM References ────
const sidebar        = document.getElementById('sidebar');
const hamburgerBtn   = document.getElementById('hamburgerBtn');
const newChatBtn     = document.getElementById('newChatBtn');
const chatHistoryList= document.getElementById('chatHistoryList');
const welcomeScreen  = document.getElementById('welcomeScreen');
const messagesContainer = document.getElementById('messagesContainer');
const typingIndicator= document.getElementById('typingIndicator');
const userInput      = document.getElementById('userInput');
const sendBtn        = document.getElementById('sendBtn');
const settingsBtn    = document.getElementById('settingsBtn');
const settingsModal  = document.getElementById('settingsModal');
const closeSettings  = document.getElementById('closeSettings');
const apiKeyInput    = document.getElementById('apiKeyInput');
const saveKeyBtn     = document.getElementById('saveKeyBtn');
const apiStatusEl    = document.getElementById('apiStatus');
const chips          = document.querySelectorAll('.chip');
const clearBtn       = document.getElementById('clearBtn');

// ──── State ────
let conversations = JSON.parse(localStorage.getItem('edubot_convos') || '[]');
let activeConvoId = null;
let apiKey = 'AIzaSyDm2XSCr4vRGFoGaGb_G2pwfz4-j57rm_M';
let isProcessing = false;

// ──── Predefined Responses (Fallback) ────
const PREDEFINED = [
    { patterns: [/^(hi|hello|hey|hola|greetings)/i],
      responses: [
        "Hello! 👋 How can I help you with your studies today?",
        "Hey there! Ready to learn something new?",
        "Hi! I'm EduBot, your study buddy. What would you like to know?"
    ]},
    { patterns: [/\b(bye|goodbye|see you|cya|later)\b/i],
      responses: [
        "Goodbye! 📚 Keep studying hard — you've got this!",
        "See you later! Don't forget to review your notes!",
        "Bye! Remember: consistency is the key to success. 💪"
    ]},
    { patterns: [/\b(thank|thanks|thx)\b/i],
      responses: [
        "You're welcome! Happy to help! 😊",
        "Anytime! That's what I'm here for.",
        "Glad I could help! Let me know if you have more questions."
    ]},
    { patterns: [/\b(school|college)\s*(time|timing|hours|schedule)\b/i],
      responses: [
        "School timings typically run from 8:00 AM to 2:30 PM, but check with your institution for the exact schedule!",
        "Most colleges operate from 9:00 AM to 4:00 PM. Your college website will have the precise timetable."
    ]},
    { patterns: [/\b(subject|course|class)\b/i],
      responses: [
        "Common subjects include Mathematics, Science, English, History, and Computer Science. Which subject do you need help with?",
        "I can help with a wide range of subjects — from Physics to Literature. Just ask your question!"
    ]},
    { patterns: [/\b(exam|test|assessment)\b.*\b(tip|advice|prepare|study)\b/i],
      responses: [
        "Here are some exam tips:\n1. Start early — don't cram.\n2. Use active recall and spaced repetition.\n3. Practice past papers.\n4. Take short breaks every 45 min.\n5. Stay hydrated and sleep well! 🧠",
    ]},
    { patterns: [/\b(who are you|what are you|your name)\b/i],
      responses: [
        "I'm EduBot — an AI-powered study assistant built to help students like you learn better and faster! 🤖📚"
    ]},
];

const GENERAL_FALLBACKS = [
    "That's an interesting question! While I don't have the specific answer right now, I'd recommend checking reliable educational resources like Khan Academy, Wikipedia, or your textbook for detailed info.",
    "Great question! I'm not 100% sure, but here's a tip: try searching for it on educational platforms or ask your teacher — they'd love that you're curious! 🌟",
    "Hmm, let me think… I may not have the perfect answer, but breaking your question into smaller parts and researching each one can really help you find what you need!",
    "I appreciate the question! For the most accurate answer, I suggest looking it up in a trusted source. Meanwhile, feel free to ask me other study-related questions!"
];

// ──── Helpers ────
function generateId() {
    return Date.now().toString(36) + Math.random().toString(36).slice(2, 8);
}

function timeStr() {
    return new Date().toLocaleTimeString([], { hour:'2-digit', minute:'2-digit' });
}

function pickRandom(arr) {
    return arr[Math.floor(Math.random() * arr.length)];
}

function escapeHtml(str) {
    const div = document.createElement('div');
    div.textContent = str;
    return div.innerHTML;
}

// ──── API Status ────
function updateApiStatus() {
    const dot  = apiStatusEl.querySelector('.status-dot');
    const text = apiStatusEl.querySelector('.status-text');
    if (apiKey) {
        dot.className = 'status-dot online';
        text.textContent = 'AI Online — Gemini';
    } else {
        dot.className = 'status-dot offline';
        text.textContent = 'AI Offline — Fallback Mode';
    }
}

// ──── Conversation Management ────
function saveConversations() {
    localStorage.setItem('edubot_convos', JSON.stringify(conversations));
}

function getActiveConvo() {
    return conversations.find(c => c.id === activeConvoId);
}

function renderChatHistory() {
    chatHistoryList.innerHTML = '';
    conversations.slice().reverse().forEach(c => {
        const li = document.createElement('li');
        li.textContent = c.title || 'New Chat';
        li.dataset.id = c.id;
        if (c.id === activeConvoId) li.classList.add('active');
        li.addEventListener('click', () => loadConversation(c.id));
        chatHistoryList.appendChild(li);
    });
}

function startNewChat() {
    const convo = {
        id: generateId(),
        title: 'New Chat',
        messages: [],
        createdAt: Date.now()
    };
    conversations.push(convo);
    if (conversations.length > 30) conversations.shift();
    saveConversations();
    loadConversation(convo.id);
}

function loadConversation(id) {
    activeConvoId = id;
    const convo = getActiveConvo();
    if (!convo) return;

    welcomeScreen.style.display = 'none';
    messagesContainer.classList.add('active');
    messagesContainer.innerHTML = '';

    convo.messages.forEach(m => appendMessageToDOM(m.role, m.text, m.time, false));
    renderChatHistory();
    scrollToBottom();
    closeSidebar();
}

function updateConvoTitle(text) {
    const convo = getActiveConvo();
    if (convo && convo.title === 'New Chat') {
        convo.title = text.length > 32 ? text.slice(0, 32) + '…' : text;
        saveConversations();
        renderChatHistory();
    }
}

// ──── Message Rendering ────
function appendMessageToDOM(role, text, time, animate = true) {
    const row = document.createElement('div');
    row.className = `msg-row ${role}`;
    if (!animate) row.style.animation = 'none';
    if (!animate) row.style.opacity = '1';

    const avatar = role === 'bot'
        ? `<div class="msg-avatar">🤖</div>`
        : '';

    // Convert newlines to <br> for display
    const formattedText = escapeHtml(text).replace(/\n/g, '<br>');

    row.innerHTML = `
        ${avatar}
        <div>
            <div class="msg-bubble">${formattedText}</div>
            <div class="msg-time">${time}</div>
        </div>
    `;
    messagesContainer.appendChild(row);
}

function scrollToBottom() {
    requestAnimationFrame(() => {
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    });
}

// ──── Typing Indicator ────
function showTyping() {
    typingIndicator.classList.add('active');
    scrollToBottom();
}
function hideTyping() {
    typingIndicator.classList.remove('active');
}

// ──── Get Bot Response ────
function getPredefinedResponse(input) {
    const lower = input.toLowerCase().trim();
    for (const rule of PREDEFINED) {
        for (const pattern of rule.patterns) {
            if (pattern.test(lower)) {
                return pickRandom(rule.responses);
            }
        }
    }
    return null;
}

async function getAIResponse(userMessage, convo) {
    if (!apiKey) return null;

    // Build conversation context (last 10 messages for context window)
    const historySlice = (convo.messages || []).slice(-10);
    const contents = [];

    // System instruction via first user turn
    contents.push({
        role: 'user',
        parts: [{ text: `You are EduBot, a friendly and knowledgeable AI study assistant for students. Rules:\n- Always respond politely, clearly, and concisely.\n- Give short, student-friendly answers (2-4 sentences unless more detail is needed).\n- If you're unsure, provide a helpful general response instead of saying "I don't know".\n- You can help with any academic subject, study tips, homework, and general knowledge.\n- Use simple language suitable for students.\n\nNow respond to the following conversation naturally.` }]
    });
    contents.push({
        role: 'model',
        parts: [{ text: 'Understood! I\'m EduBot, ready to help students. I\'ll be clear, concise, and encouraging. What would you like to learn today?' }]
    });

    historySlice.forEach(m => {
        contents.push({
            role: m.role === 'user' ? 'user' : 'model',
            parts: [{ text: m.text }]
        });
    });

    // Current question (if not already in history)
    if (contents[contents.length - 1].role !== 'user') {
        contents.push({ role: 'user', parts: [{ text: userMessage }] });
    }

    try {
        const res = await fetch(
            `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${apiKey}`,
            {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    contents,
                    generationConfig: {
                        temperature: 0.7,
                        topP: 0.9,
                        maxOutputTokens: 512
                    }
                })
            }
        );

        if (!res.ok) {
            console.warn('Gemini API error:', res.status);
            return null;
        }

        const data = await res.json();
        const text = data?.candidates?.[0]?.content?.parts?.[0]?.text;
        return text || null;
    } catch (err) {
        console.warn('AI request failed:', err);
        return null;
    }
}

// ──── Send Message Flow ────
async function handleSend() {
    const text = userInput.value.trim();
    if (!text || isProcessing) return;
    isProcessing = true;

    // Ensure we have an active conversation
    if (!activeConvoId) {
        startNewChat();
    }

    const convo = getActiveConvo();
    const time = timeStr();

    // Hide welcome, show messages
    welcomeScreen.style.display = 'none';
    messagesContainer.classList.add('active');

    // Add user message
    convo.messages.push({ role:'user', text, time });
    appendMessageToDOM('user', text, time);
    updateConvoTitle(text);
    saveConversations();

    // Clear input
    userInput.value = '';
    userInput.style.height = 'auto';
    sendBtn.disabled = true;
    scrollToBottom();

    // Show typing
    showTyping();

    // Simulate a small delay for natural feel
    await new Promise(r => setTimeout(r, 600));

    // Try AI first, then predefined, then general fallback
    let botReply = await getAIResponse(text, convo);

    if (!botReply) {
        botReply = getPredefinedResponse(text);
    }

    if (!botReply) {
        botReply = pickRandom(GENERAL_FALLBACKS);
    }

    hideTyping();

    const botTime = timeStr();
    convo.messages.push({ role:'bot', text: botReply, time: botTime });
    appendMessageToDOM('bot', botReply, botTime);
    saveConversations();
    scrollToBottom();

    isProcessing = false;
}

// ──── Event Listeners ────
sendBtn.addEventListener('click', handleSend);

userInput.addEventListener('keydown', (e) => {
    if (e.key === 'Enter' && !e.shiftKey) {
        e.preventDefault();
        handleSend();
    }
});

userInput.addEventListener('input', () => {
    sendBtn.disabled = !userInput.value.trim();
    // Auto-resize
    userInput.style.height = 'auto';
    userInput.style.height = Math.min(userInput.scrollHeight, 120) + 'px';
});

// Suggestion chips
chips.forEach(chip => {
    chip.addEventListener('click', () => {
        userInput.value = chip.dataset.msg;
        sendBtn.disabled = false;
        handleSend();
    });
});

// New chat
newChatBtn.addEventListener('click', () => {
    startNewChat();
    welcomeScreen.style.display = 'flex';
    messagesContainer.classList.remove('active');
    messagesContainer.innerHTML = '';
    closeSidebar();
});

// Clear chat
clearBtn.addEventListener('click', () => {
    if (!activeConvoId) return;
    const convo = getActiveConvo();
    if (!convo || convo.messages.length === 0) return;
    if (!confirm('Clear all messages in this chat?')) return;
    convo.messages = [];
    saveConversations();
    messagesContainer.innerHTML = '';
    welcomeScreen.style.display = 'flex';
    messagesContainer.classList.remove('active');
});

// Sidebar toggle (mobile)
hamburgerBtn.addEventListener('click', () => sidebar.classList.toggle('open'));
function closeSidebar() { sidebar.classList.remove('open'); }
document.addEventListener('click', (e) => {
    if (window.innerWidth <= 768 &&
        sidebar.classList.contains('open') &&
        !sidebar.contains(e.target) &&
        !hamburgerBtn.contains(e.target)) {
        closeSidebar();
    }
});

// Settings modal
settingsBtn.addEventListener('click', () => {
    apiKeyInput.value = apiKey;
    settingsModal.classList.add('open');
});
closeSettings.addEventListener('click', () => settingsModal.classList.remove('open'));
settingsModal.addEventListener('click', (e) => {
    if (e.target === settingsModal) settingsModal.classList.remove('open');
});
saveKeyBtn.addEventListener('click', () => {
    apiKey = apiKeyInput.value.trim();
    localStorage.setItem('edubot_api_key', apiKey);
    updateApiStatus();
    settingsModal.classList.remove('open');
});

// ──── Init ────
function init() {
    updateApiStatus();
    renderChatHistory();

    // If we have existing conversations, show the latest
    if (conversations.length > 0) {
        const latest = conversations[conversations.length - 1];
        if (latest.messages.length > 0) {
            loadConversation(latest.id);
        }
    }
}

init();
