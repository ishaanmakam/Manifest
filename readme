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
