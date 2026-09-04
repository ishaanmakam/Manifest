-- Manifest: run this once in the Supabase SQL editor.

create table if not exists public.applications (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null default auth.uid() references auth.users(id) on delete cascade,
  org         text not null,
  role        text default '',
  term        text default '',
  deadline    date,
  status      text not null default 'go',
  notes       jsonb not null default '[]'::jsonb,
  questions   jsonb not null default '[]'::jsonb,
  position    integer not null default 0,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

create index if not exists applications_user_idx on public.applications(user_id, position);

alter table public.applications enable row level security;

create policy "own rows: select" on public.applications for select using (auth.uid() = user_id);
create policy "own rows: insert" on public.applications for insert with check (auth.uid() = user_id);
create policy "own rows: update" on public.applications for update using (auth.uid() = user_id);
create policy "own rows: delete" on public.applications for delete using (auth.uid() = user_id);

create or replace function public.touch_updated_at() returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end $$;

drop trigger if exists applications_touch on public.applications;
create trigger applications_touch before update on public.applications
  for each row execute function public.touch_updated_at();
