# Manifest

A tracker for internship and job applications: where you applied, every essay prompt, and what you wrote. Each person signs in and sees only their own data.

## Setup (about 10 minutes)

1. Create a free project at supabase.com.
2. In the SQL editor, paste and run `schema.sql`.
3. Authentication → Providers → Email: leave enabled. If you don't want to verify emails, turn off "Confirm email" under Authentication → Settings.
4. Project Settings → API: copy the Project URL and the anon public key.
5. Open `index.html` and paste them into `SUPABASE_URL` and `SUPABASE_ANON_KEY` at the top of the script.
6. Deploy `index.html` anywhere static (Vercel, Netlify, GitHub Pages).

The anon key is meant to be public. Row-level security in `schema.sql` is what keeps one user from reading another's rows.

## Without Supabase

If the two constants are left blank, the page runs in demo mode: data lives only in that browser tab and is lost on reload. Useful for trying the UI.

## Paste from doc

In the editor, "Paste from doc" takes a pasted block of prompts and answers and splits it into fields. A line is treated as a prompt if it ends in a question mark, starts with words like Tell us / Describe / Why / What / How, or is a short line followed by a long paragraph. Everything until the next prompt becomes that prompt's answer. Review before saving.
